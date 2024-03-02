package entity;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

public class AppointmentManager {
    private List<Appointment> appointments;

    public AppointmentManager() {
        this.appointments = new ArrayList<>();
    }

    public void addAppointment(Appointment appointment) {
        appointments.add(appointment);
    }

    public List<Appointment> getAppointmentsForDate(LocalDate date) {
        return appointments.stream()
                .filter(a -> a.getAppointmentTime().toLocalDate().equals(date))
                .collect(Collectors.toList());
    }

    public List<Appointment> getAllAppointments() {
        return new ArrayList<>(appointments);
    }

    public void removeAppointment(UUID id) {
        appointments.removeIf(appointment -> appointment.getId().equals(id));
    }
}
