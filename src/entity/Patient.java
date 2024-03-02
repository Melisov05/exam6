package entity;

import java.time.LocalDate;

public class Patient {
    private String fullName;
    private LocalDate dateOfBirth;
    private String patientType;
    private String symptoms;

    public String getFullName() {
        return fullName;
    }

    public LocalDate getDateOfBirth() {
        return dateOfBirth;
    }

    public String getPatientType() {
        return patientType;
    }

    public String getSymptoms() {
        return symptoms;
    }

    public Patient(String fullName, LocalDate dateOfBirth, String patientType, String symptoms) {
        this.fullName = fullName;
        this.dateOfBirth = dateOfBirth;
        this.patientType = patientType;
        this.symptoms = symptoms;
    }

    public Patient(String fullName, String patientType, String symptoms) {
        this.fullName = fullName;
        this.patientType = patientType;
        this.symptoms = symptoms;
    }
}
