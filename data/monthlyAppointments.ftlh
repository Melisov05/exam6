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
    <button type="button" form="addAppointmentForm" class="btn btn-primary float-end" data-bs-toggle="modal" data-bs-target="#addAppointmentModal">
          Добавить новую запись
    </button>
    <h3>Today is: ${today}</h3>
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

<div class="modal fade" id="addAppointmentModal" tabindex="-1" aria-labelledby="addAppointmentModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="addAppointmentModalLabel">Новая запись</h5>
        <button type="button" form="addAppointmentForm" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form id="addAppointmentForm" action="/appointments/windowAdd" method="post">
          <div class="mb-3">
            <label for="appointmentDate" class="form-label">Дата</label>
            <input type="date" class="form-control" id="appointmentDate" name="date" required>
          </div>
          <div class="mb-3">
            <label for="appointmentTime" class="form-label">Время</label>
            <input type="time" class="form-control" id="appointmentTime" name="time" required>
          </div>
          <div class="mb-3">
            <label for="patientFullName" class="form-label">ФИО</label>
            <input type="text" class="form-control" id="patientFullName" name="fullName" required>
          </div>
          <div class="mb-3">
            <label for="patientType" class="form-label">Тип пациента</label>
            <select class="form-select" id="patientType" name="patientType" required>
              <option value="Первичный">Первичный</option>
              <option value="Вторичный">Вторичный</option>
            </select>
          </div>
          <div class="mb-3">
            <label for="symptoms" class="form-label">Анамнез</label>
            <textarea class="form-control" id="symptoms" name="symptoms" rows="3" required></textarea>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Закрыть</button>
        <button type="submit" form="addAppointmentForm" class="btn btn-primary">Добавить запись</button>
      </div>
    </div>
  </div>
</div>
</body>
</html>
