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

<title>AutoWarsztat CRM — ${vehicle.model}</title>
</head>
<body>
	<%@ include file="fragments/header.jsp" %>
	
	<div class="container">
		<h1 class="m-4">${vehicle.model}</h1>
		
		<form action="vehicleDelete" method="post">
			<button class="btn"  type="button" class="btn btn-primary" data-toggle="modal" data-target="#editModal">Edytuj</button>
			<button class="btn" type="submit" name="id" value="${vehicle.id}">Usuń</button>
		</form>

		<div class="container">
			<div class="row">
				<div class="col">
					<h5>Model</h5>
					${vehicle.model}
				</div>
				<div class="col">
					<h5>Właściciel</h5>
					<c:set var="client" value="${vehicle.owner}" />
					<a href="clientDetails?id=${client.id}">${client.lastName} ${client.firstName}</a>
				</div>
				<div class="col">
					<h5>Rok produkcji</h5>
					${vehicle.yearOfProduction}
				</div>
				<div class="col">
					<h5>Numer rejestracyjny</h5>
					${vehicle.licenceNumber}
				</div>
				<div class="col">
					<h5>Data następnego przeglądu</h5>
					${vehicle.nextInspectionDate}
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col">
			<button class="btn" type="button" class="btn btn-primary" data-toggle="modal" data-target="#addModal">Dodaj</button>

			<table class="table table-responsive">
				<thead>
					<tr>
						<th scope="col">Rozpoczęcie naprawy<br>
							/ Przyjęcie zamówienia</th>
						<th scope="col">Opis problemu</th>
						<th scope="col">Opis naprawy</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="order" items="${orders}">
						<tr>
							<td><a href="orderDetails?id=${order.id}">${order.repairBeginDate}</a></td>
							<td>${order.problemDescription}</td>
							<td>${order.repairDescription}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			</div>
		</div>
	</div>

	<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="editModal" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Edytuj pojazd</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<form action="" method="post">
					<div class="modal-body">
						<div class="form-group">
							<label>Model</label>
							<input class="form-control" type="text" name="model"
                                   placeholder="Model" value="${vehicle.model}">
						</div>
						<div class="form-group">
							<label>Rok produkcji</label>
							<input class="form-control" type="number" name="yearOfProduction"
                                   placeholder="Rok produkcji" value="${vehicle.yearOfProduction}">
						</div>
						<div class="form-group">
							<label>Numer rejestracyjny</label>
							<input class="form-control" type="text" name="licenceNumber"
                                   placeholder="Numer rejestracyjny" value="${vehicle.licenceNumber}">
						</div>
						<div class="form-group">
							<label>Następny przegląd</label>
							<div class="form-row">
								<div class="col">
									<input class="form-control" type="date" name="nextInspectionDay">
								</div>
								<div class="col-auto">
									<input class="form-control" type="time" name="nextInspectionTime">
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

    <div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="addModal" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Dodaj zlecenie</h5>
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
                        <div class="form-group">
                            <label>Pracownik</label>
                            <select name="employeeId" class="form-control">
                                <c:forEach var="employee" items="${employees}">
                                    <option value="${employee.id}">${employee.firstName} ${employee.lastName}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="form-group">
                            <label>Opis problemu</label>
                            <textarea class="form-control" name="problemDescription" rows="8"
                                      placeholder="Opis problemu"></textarea>
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
