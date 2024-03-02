package server;

import Utils.Generator;
import com.sun.net.httpserver.HttpExchange;
import entity.Appointment;
import entity.AppointmentManager;
import entity.Patient;
import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import freemarker.template.TemplateExceptionHandler;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

public class ExamServer extends BasicServer{

    private final static Configuration freemarker = initFreeMarker();
    private AppointmentManager appointmentsManager = new AppointmentManager();

    public ExamServer(String host, int port) throws IOException {
        super(host, port);
        initializeAppointments(appointmentsManager);
        registerGet("/appointments", this::appointmentsHandler);
    }

    private void appointmentsHandler(HttpExchange exchange) {
//        LocalDate date = LocalDate.now() ;
        List<Appointment> appointments = appointmentsManager.getAllAppointments();

        for (Appointment appointment : appointments) {
            String formattedTime = appointment.getAppointmentTime()
                    .format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm"));
            appointment.setFormattedTime(formattedTime);
        }

        Map<String, Object> dataModel = new HashMap<>();
        dataModel.put("appointments", appointments);


        System.out.println(dataModel.get("appointments"));

        renderTemplate(exchange, "data/appointments.ftlh", dataModel);

    }

    public static void initializeAppointments(AppointmentManager manager) {

        int numberOfAppointments = 10;
        Random random = new Random();

        for (int i = 0; i < numberOfAppointments; i++) {
            LocalDate date = LocalDate.now().plusDays(random.nextInt(30));
            LocalTime time = LocalTime.of(random.nextInt(10) + 8, 0);
            LocalDateTime dateTime = LocalDateTime.of(date, time);

            Patient patient = new Patient(
                    Generator.makeName(),
                    LocalDate.of(1980 + random.nextInt(40),
                            random.nextInt(12) + 1,
                            random.nextInt(28) + 1),
                    random.nextBoolean() ? "Первичный" : "Вторичный",
                    Generator.makeDescription()
            );
            Appointment appointment = new Appointment(dateTime, patient);
            manager.addAppointment(appointment);
        }
    }

    private static Configuration initFreeMarker() {
        Configuration cfg = new Configuration(Configuration.VERSION_2_3_29);
        try {
            cfg.setDirectoryForTemplateLoading(new File("."));
            cfg.setDefaultEncoding("UTF-8");
            cfg.setTemplateExceptionHandler(TemplateExceptionHandler.RETHROW_HANDLER);
            cfg.setLogTemplateExceptions(false);
            cfg.setWrapUncheckedExceptions(true);
            cfg.setFallbackOnNullLoopVariable(false);
        } catch (IOException e) {
            throw new RuntimeException("Failed to set directory for template loading", e);
        }
        return cfg;
    }

    protected void renderTemplate(HttpExchange exchange, String templateFile, Object dataModel) {
        try {
            Template template = freemarker.getTemplate(templateFile);
            ByteArrayOutputStream stream = new ByteArrayOutputStream();
            try (OutputStreamWriter writer = new OutputStreamWriter(stream)) {
                template.process(dataModel, writer);
                writer.flush();
                byte[] data = stream.toByteArray();
                sendByteData(exchange, ResponseCodes.OK, ContentType.TEXT_HTML, data);
            }
        } catch (IOException | TemplateException e) {
            e.printStackTrace();
            try {
                exchange.sendResponseHeaders(500, -1);
            } catch (IOException ex) {
                ex.printStackTrace();
            }
        }
    }
}
