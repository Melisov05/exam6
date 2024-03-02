<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title>Записи на прием</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</head>
<body>
    <h1 class="text-center my-4">Все записи на прием</h1>
    <div class="container">
        <table class="table table-striped table-hover table-bordered">
            <thead>
                <tr>
                    <th>Время</th>
                    <th>ФИО</th>
                    <th>Дата рождения</th>
                    <th>Тип пациента</th>
                    <th>Анамнез</th>
                </tr>
            </thead>
            <tbody>
                <#list appointments as appointment>
                    <tr>
                        <!-- Format the time -->
                        <td>${appointment.formattedTime}</td>
                        <td>${appointment.patient.fullName}</td>
                        <td>${appointment.patient.dateOfBirth}</td>
                        <td>${appointment.patient.patientType}</td>
                        <td>${appointment.patient.symptoms}</td>
                    </tr>
                </#list>
            </tbody>
        </table>
    </div>
</body>
</html>
