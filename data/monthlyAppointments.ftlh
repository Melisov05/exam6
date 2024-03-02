<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Monthly Appointments</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</head>
<body>
<div class="container mt-4">
    <h2>Appointments for the Current Month</h2>
    <#list groupedAppointments?keys as date>
        <div class="list-group mt-3">
            <a href="/appointments/day?date=${date}" class="list-group-item <#if date == today>list-group-item-info</#if>" aria-current="true">
                <h5 class="mb-1">${date} - Total Patients: ${groupedAppointments[date]?size}</h5>
            </a>

            <#list groupedAppointments[date] as appointment>
                <div class="list-group-item">
                    <div class="d-flex w-100 justify-content-between">
                        <h6 class="mb-1">${appointment.patient.fullName}</h6>
                        <small>${appointment.appointmentTime}</small>
                    </div>
                    <p class="mb-1">
                        Type:
                        <#if appointment.patient.patientType == 'Первичный'>
                            <span class="text-primary">${appointment.patient.patientType}</span>
                        <#else>
                            <span class="text-success">${appointment.patient.patientType}</span>
                        </#if>
                    </p>
                    <p class="mb-1">Symptoms: ${appointment.patient.symptoms}</p>
                </div>
            </#list>
        </div>
    </#list>
</div>
</body>
</html>
