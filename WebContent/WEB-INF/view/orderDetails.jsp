<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
          crossorigin="anonymous">
    <link href="${pageContext.request.contextPath}/sticky-footer.css" rel="stylesheet">
    <c:set var="vehicle" value="${order.vehicle}"/>
    <title>AutoWarsztat CRM — Zlecenie z ${order.repairBeginDate} (${vehicle.model})</title>
</head>
<body>
<%@ include file="fragments/header.jsp" %>

<div class="container">
    <h1 class="m-4">Zlecenie z ${order.repairBeginDate} (<a href="vehicleDetails?id=${vehicle.id}">${vehicle.model}</a>)
    </h1>

    <c:if test="${order.status=='TAKEN_IN'}">
        <button class="btn" type="button" class="btn btn-primary" data-toggle="modal"
                data-target="#approveCostsModal">Zatwierdź koszty
        </button>
    </c:if>
    <c:if test="${order.status=='COSTS_APPROVED'}">
        <button class="btn" type="button" class="btn btn-primary" data-toggle="modal"
                data-target="#beginRepairModal">Rozpocznij naprawę
        </button>
    </c:if>
    <c:if test="${order.status=='IN_REPAIR'}">
        <button class="btn" type="button" class="btn btn-primary" data-toggle="modal"
                data-target="#finishRepairModal">Zakończ naprawę
        </button>
    </c:if>
    <button class="btn" type="button" class="btn btn-primary" data-toggle="modal" data-target="#editModal">Edytuj
    </button>
    <c:if test="${order.status!='DONE' and order.status!='CANCELLED'}">
        <button class="btn" type="button" class="btn btn-primary" data-toggle="modal"
                data-target="#cancelModal">Anuluj zlecenie
        </button>
    </c:if>

    <div class="row">
        <div class="col">
            <ul class="list-group">
                <li class="list-group-item">
                    <h5>Przyjęcie do naprawy</h5>
                    ${order.takeInDate}
                </li>
                <li class="list-group-item">
                    <c:if test="${order.status=='TAKEN_IN' or order.status=='COSTS_APPROVED'}">
                        <h5>
                            Planowane rozpoczęcie naprawy
                        </h5>
                        ${order.plannedRepairBeginDate}
                    </c:if>
                    <c:if test="${order.status!='TAKEN_IN' and order.status!='COSTS_APPROVED'}">
                        <h5>
                            Rozpoczęcie naprawy
                        </h5>
                        ${order.repairBeginDate}
                    </c:if>
                </li>
                <c:if test="${order.status=='DONE'}">
                    <li class="list-group-item">
                        <h5>Zakończenie naprawy</h5>
                            ${order.repairEndDate}
                    </li>
                </c:if>
                <li class="list-group-item">
                    <h5>Status</h5>
                    <c:if test="${order.status=='TAKEN_IN'}">Przyjęte</c:if>
                    <c:if test="${order.status=='COSTS_APPROVED'}">Koszty zatwierdzone</c:if>
                    <c:if test="${order.status=='IN_REPAIR'}">Naprawa w toku</c:if>
                    <c:if test="${order.status=='DONE'}">Zakończone</c:if>
                    <c:if test="${order.status=='CANCELLED'}">Anulowane</c:if>
                </li>
                <li class="list-group-item">
                    <h5>Pracownik</h5>
                    <c:set var="employee" value="${order.employee}"/>
                    <a href="employeeDetails?id=${employee.id}">${employee.firstName} ${employee.lastName}</a>
                </li>
                <li class="list-group-item">
                    <h5>Opis problemu</h5>
                    ${order.problemDescription}
                </li>
                <c:if test="${order.status=='DONE'}">
                    <li class="list-group-item">
                        <h5>Opis naprawy</h5>
                            ${order.repairDescription}
                    </li>
                </c:if>
                <c:if test="${order.status!='TAKEN_IN'}">
                    <li class="list-group-item">
                        <h5>Koszt dla klienta</h5>
                            ${order.costForClient}
                    </li>
                    <li class="list-group-item">
                        <h5>Koszt części</h5>
                            ${order.costOfParts}
                    </li>
                </c:if>
                <li class="list-group-item">
                    <h5>Koszt roboczogodziny</h5>
                    ${order.costPerHour}
                </li>
                <c:if test="${order.status=='DONE'}">
                    <li class="list-group-item">
                        <h5>Ilość roboczogodzin</h5>
                            ${order.workHours}
                    </li>
                </c:if>
            </ul>
        </div>
    </div>
</div>

<div class="modal fade" id="approveCostsModal" tabindex="-1" role="dialog" aria-labelledby="approveCostsModal"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Zatwierdź koszty</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="" method="post">
                <div class="modal-body">
                    <div class="form-group">
                        <div class="form-row">
                            <div class="col">
                                <label>Koszt dla klienta</label>
                                <input class="form-control" type="number" name="costForClient">
                            </div>
                            <div class="col">
                                <label>Koszt części</label>
                                <input class="form-control" type="number" name="costOfParts">
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Koszt roboczogodziny</label>
                        <input class="form-control" type="number" name="costPerHour"
                               value="${order.costPerHour}" disabled="disabled">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Anuluj</button>
                    <button type="submit" class="btn btn-primary">Zapisz</button>
                </div>
            </form>
        </div>
    </div>
</div>

<div class="modal fade" id="beginRepairModal" tabindex="-1" role="dialog" aria-labelledby="beginRepairModal"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Rozpocznij naprawę</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="" method="post">
                <div class="modal-body">
                    <div class="form-group">
                        <label>Rozpoczęcie naprawy</label>
                        <div class="form-row">
                            <div class="col">
                                <input class="form-control" type="date" name="repairBeginDay">
                            </div>
                            <div class="col-auto">
                                <input class="form-control" type="time" name="repairBeginTime">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Anuluj</button>
                    <button type="submit" class="btn btn-primary">Zapisz</button>
                </div>
            </form>
        </div>
    </div>
</div>

<div class="modal fade" id="finishRepairModal" tabindex="-1" role="dialog" aria-labelledby="finishRepairModal"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Zakończ naprawę</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="" method="post">
                <div class="modal-body">
                    <div class="form-group">
                        <label>Zakończenie naprawy</label>
                        <div class="form-row">
                            <div class="col">
                                <input class="form-control" type="date" name="repairEndDay">
                            </div>
                            <div class="col-auto">
                                <input class="form-control" type="time" name="repairEndTime">
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Opis naprawy</label>
                        <textarea class="form-control" name="repairDescription" rows="8"
                                  placeholder="Opis naprawy"></textarea>
                    </div>
                    <div class="form-group">
                        <label>Ilość roboczogodzin</label>
                        <input class="form-control" type="number" name="workHours">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Anuluj</button>
                    <button type="submit" class="btn btn-primary">Zapisz</button>
                </div>
            </form>
        </div>
    </div>
</div>

<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="editModal" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Edytuj zlecenie</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="" method="post">
                <div class="modal-body">
                    <div class="form-group">
                        <label>Przyjęcie do naprawy</label>
                        <div class="form-row">
                            <div class="col">
                                <input class="form-control" type="date" name="takeInDay">
                            </div>
                            <div class="col-auto">
                                <input class="form-control" type="time" name="takeInTime">
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Planowane rozpoczęcie naprawy</label>
                        <div class="form-row">
                            <div class="col">
                                <input class="form-control" type="date" name="plannedRepairBeginDay">
                            </div>
                            <div class="col-auto">
                                <input class="form-control" type="time" name="plannedRepairBeginTime">
                            </div>
                        </div>
                    </div>
                    <c:if test="${order.status!='TAKEN_IN' and order.status!='COSTS_APPROVED'}">
                        <div class="form-group">
                            <label>Rozpoczęcie naprawy</label>
                            <div class="form-row">
                                <div class="col">
                                    <input class="form-control" type="date" name="repairBeginDay">
                                </div>
                                <div class="col-auto">
                                    <input class="form-control" type="time" name="repairBeginTime">
                                </div>
                            </div>
                        </div>
                    </c:if>
                    <c:if test="${order.status=='DONE'}">
                        <div class="form-group">
                            <label>Zakończenie naprawy</label>
                            <div class="form-row">
                                <div class="col">
                                    <input class="form-control" type="date" name="repairEndDay">
                                </div>
                                <div class="col-auto">
                                    <input class="form-control" type="time" name="repairEndTime">
                                </div>
                            </div>
                        </div>
                    </c:if>
                    <div class="form-group">
                        <label>Pracownik</label>
                        <select name="employeeId" class="form-control">
                            <c:forEach var="employee" items="${employees}">
                                <option value="${employee.id}">${employee.firstName} ${employee.lastName}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>Pojazd</label>
                        <select name="vehicleId" class="form-control">
                            <c:forEach var="vehicle" items="${vehicles}">
                                <option value="${vehicle.id}">${vehicle.model} (${vehicle.licenceNumber})</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>Opis problemu</label>
                        <textarea class="form-control" name="problemDescription" rows="8"
                                  placeholder="Opis problemu">${vehicle.problemDescription}</textarea>
                    </div>
                    <c:if test="${order.status=='DONE'}">
                        <div class="form-group">
                            <label>Opis naprawy</label>
                            <textarea class="form-control" name="repairDescription" rows="8"
                                      placeholder="Opis naprawy">${vehicle.repairDescription}</textarea>
                        </div>
                    </c:if>
                    <c:if test="${order.status!='TAKEN_IN'}">
                        <div class="form-group">
                            <div class="form-row">
                                <div class="col">
                                    <label>Koszt dla klienta</label>
                                    <input class="form-control" type="number" name="costForClient">
                                </div>
                                <div class="col">
                                    <label>Koszt części</label>
                                    <input class="form-control" type="number" name="costOfParts">
                                </div>
                            </div>
                        </div>
                    </c:if>
                    <c:if test="${order.status=='DONE'}">
                        <div class="form-group">
                            <label>Ilość roboczogodzin</label>
                            <input class="form-control" type="number" name="workHours">
                        </div>
                    </c:if>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Anuluj</button>
                    <button type="submit" class="btn btn-primary">Zapisz</button>
                </div>
            </form>
        </div>
    </div>
</div>

<div class="modal fade" id="cancelModal" tabindex="-1" role="dialog" aria-labelledby="cancelModal" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Anuluj zlecenie</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p>Czy na pewno chcesz anulować zlecenie?</p>
            </div>
            <div class="modal-footer">
                <form action="/orderCancel" method="post">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Anuluj</button>
                    <button type="submit" class="btn btn-danger" name="id" value="${order.id}">Zatwierdź</button>
                </form>
            </div>
        </div>
    </div>
</div>

<%@ include file="fragments/footer.jsp" %>
</body>
</html>
