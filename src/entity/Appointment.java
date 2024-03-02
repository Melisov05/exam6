package entity;

import java.time.LocalDateTime;

public class Appointment {
    private LocalDateTime appointmentTime;
    private Patient patient;

    private String formattedTime;

    public void setAppointmentTime(LocalDateTime appointmentTime) {
        this.appointmentTime = appointmentTime;
    }

    public void setPatient(Patient patient) {
        this.patient = patient;
    }

    public void setFormattedTime(String formattedTime) {
        this.formattedTime = formattedTime;
    }

    public String getFormattedTime() {
        return formattedTime;
    }

    public LocalDateTime getAppointmentTime() {
        return appointmentTime;
    }

    public Patient getPatient() {
        return patient;
    }

    public Appointment(LocalDateTime appointmentTime, Patient patient) {
        this.appointmentTime = appointmentTime;
        this.patient = patient;
    }
}
