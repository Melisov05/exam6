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
    <div class="list-group mb-3">
        <#list appointments as appointment>
            <div class="list-group-item">
                <h5 class="mb-1">${appointment.patient.fullName}</h5>
                <p>Time: ${appointment.formattedTime}</p>
                <p>Type: ${appointment.patient.patientType}</p>
                <p>Symptoms: ${appointment.patient.symptoms}</p>

                <form action="/appointments/delete" method="post" onsubmit="return confirm('Вы уверены, что хотите удалить эту запись?');">
                            <input type="hidden" name="appointmentId" value="${appointment.id}">
                            <input type="hidden" name="date" value="${selectedDate}">
                            <button type="submit" class="btn btn-danger">Удалить</button>
                </form>
            </div>
        </#list>
    </div>


    <div class="card">
        <div class="card-header">
            Добавить новую запись
        </div>
        <div class="card-body">
            <form action="/appointments/add" method="post">
                <input type="hidden" name="date" value="${selectedDate}">
                <div class="mb-3">
                    <label for="time" class="form-label">Время</label>
                    <input type="time" class="form-control" id="time" name="time" required>
                </div>
                <div class="mb-3">
                    <label for="fullName" class="form-label">ФИО</label>
                    <input type="text" class="form-control" id="fullName" name="fullName" placeholder="ФИО" required>
                </div>
                <div class="mb-3">
                    <label for="patientType" class="form-label">Тип пациента</label>
                    <select class="form-select" id="patientType" name="patientType">
                        <option value="Первичный">Первичный</option>
                        <option value="Вторичный">Вторичный</option>
                    </select>
                </div>
                <div class="mb-3">
                    <label for="symptoms" class="form-label">Анамнез</label>
                    <textarea class="form-control" id="symptoms" name="symptoms" placeholder="Анамнез" rows="3"></textarea>
                </div>
                <button type="submit" class="btn btn-primary">Добавить запись</button>
            </form>
        </div>
    </div>
</div>
</body>
</html>
