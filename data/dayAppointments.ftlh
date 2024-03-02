<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Appointments for ${selectedDate}</title>
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

</head>
<body>
<div class="container mt-4">
    <h2>Appointments for ${selectedDate}</h2>
    <div class="list-group">
        <#list appointments as appointment>
            <div class="list-group-item">
                <h5 class="mb-1">${appointment.patient.fullName}</h5>
                <p>Time: ${appointment.formattedTime}</p>
                <p>Type: ${appointment.patient.patientType}</p>
                <p>Symptoms: ${appointment.patient.symptoms}</p>
            </div>
        </#list>
    </div>
</div>
</body>
</html>
