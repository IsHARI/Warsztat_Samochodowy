<%@ page contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
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
        <h1 class="m-4">Zlecenie z ${order.repairBeginDate} (<a href="vehicleDetails?id=${vehicle.id}">${vehicle.model}</a>)</h1>

		<form action="orderDelete" method="post">
            <c:if test="${order.status=='TAKEN_IN'}">
			    <button class="btn"  type="button" class="btn btn-primary" data-toggle="modal"
                        data-target="#approveCostsModal">Zatwierdź koszty</button>
            </c:if>
            <c:if test="${order.status=='COSTS_APPROVED'}">
                <button class="btn"  type="button" class="btn btn-primary" data-toggle="modal"
                        data-target="#beginRepairModal">Rozpocznij naprawę</button>
            </c:if>
            <c:if test="${order.status=='IN_REPAIR'}">
                <button class="btn"  type="button" class="btn btn-primary" data-toggle="modal"
                        data-target="#finishRepairModal">Zakończ naprawę</button>
            </c:if>
			<button class="btn"  type="button" class="btn btn-primary" data-toggle="modal" data-target="#editModal">Edytuj</button>
            <c:if test="${order.status!='DONE' and order.status!='CANCELLED'}">
                <button class="btn" type="submit" name="id" value="${order.id}">Anuluj</button>
            </c:if>
		</form>

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
                        <li class="list-group-item">
                            <h5>Koszt roboczogodziny<h5>
                                    ${order.costPerHour}
                        </li>
                    </c:if>
                    <c:if test="${order.status=='DONE'}">
                        <li class="list-group-item">
                            <h5>Ilość roboczogodzin<h5>
                                    ${order.workHours}
                        </li>
                    </c:if>
				</ul>
			</div>
		</div>
	</div>

	<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="editModal" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Edytuj pracownika</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
				<form action="" method="post">
					<div class="modal-body">
						<div class="form-group">
                            <label>Imię</label>
							<input class="form-control" type="text" name="firstName"
                                   placeholder="Imię" value="${order.id}">
						</div>
						<div class="form-group">
                            <label>Nazwisko</label>
							<input class="form-control" type="text" name="lastName"
                                   placeholder="Nazwisko" value="${order.id}">
						</div>
						<div class="form-group">
                            <label>Adres</label>
							<input class="form-control" type="text" name="address"
                                   placeholder="Adres" value="${order.id}">
						</div>
						<div class="form-group">
                            <label>Telefon</label>
							<input class="form-control" type="text" name="phone"
                                   placeholder="Telefon" value="${order.id}">
						</div>
						<div class="form-group">
                            <label>Koszt godziny roboczej</label>
							<input class="form-control" type="number" step=".01" name="costPerHour"
                                   placeholder="Koszt godziny roboczej" value="${order.id}">
						</div>
						<div class="form-group">
                            <label>Uwagi</label>
							<textarea class="form-control" name="note" rows="8"
                                      placeholder="Uwagi">${order.id}</textarea>
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

	<%@ include file="fragments/footer.jsp" %>
</body>	
</html>
