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
    <p>Total Patients: ${appointments?size}</p>
    <div class="list-group">
        <#list appointments as appointment>
            <a href="/appointments/day?date=${appointment.formattedTime}" class="list-group-item list-group-item-action" aria-current="true">
                <div class="d-flex w-100 justify-content-between">
                    <h5 class="mb-1">${appointment.patient.fullName}</h5>
                    <small>${appointment.formattedTime}</small>
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
            </a>
        </#list>
    </div>
</div>
</body>
</html>
