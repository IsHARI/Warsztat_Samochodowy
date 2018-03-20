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

<title>AutoWarsztat CRM — ${employee.lastName} ${employee.firstName}</title>
</head>
<body>
	<%@ include file="fragments/header.jsp" %>
	
	<div class="container">
		<h1 class="m-4">${employee.lastName} ${employee.firstName}</h1>
		
		<form action="employeeDelete" method="post">
			<button class="btn"  type="button" class="btn btn-primary" data-toggle="modal" data-target="#editModal">Edytuj</button>
			<button class="btn" type="submit" name="id" value="${employee.id}">Usuń</button>
		</form>

		<div class="row">
			<div class="col">
				<ul class="list-group">
					<li class="list-group-item">
						<h5>Telefon</h5>
						${employee.phone}
					</li>
					<li class="list-group-item">
						<h5>Adres</h5>
						${employee.address}
					</li>
					<li class="list-group-item">
						<h5>Koszt godziny roboczej</h5>
						${employee.costPerHour} zł
					</li>
					<li class="list-group-item">
						<h5>Uwagi</h5>
						${employee.note}
					</li>
				</ul>
			</div>
			<div class="col">	
				<table class="table table-responsive">
					<thead>
						<tr>
							<th scope="col">Rozpoczęcie naprawy</th>
							<th scope="col">Pojazd</th>
							<th scope="col">Koszt dla klienta</th>
							<th scope="col">Koszt części</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="order" items="${orders}">
							<c:set var="vehicle" value="${order.vehicle}" />
							<tr>
								<td><a href="orderDetails?id=${order.id}">${order.repairBeginDate}</a></td>
								<td><a href="vehicleDetails?id=${vehicle.id}">${vehicle.model}</a></td>
								<td>${order.costForClient}</td>
								<td>${order.costOfParts}</td>
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
                                   placeholder="Imię" value="${employee.firstName}">
						</div>
						<div class="form-group">
                            <label>Nazwisko</label>
							<input class="form-control" type="text" name="lastName"
                                   placeholder="Nazwisko" value="${employee.lastName}">
						</div>
						<div class="form-group">
                            <label>Adres</label>
							<input class="form-control" type="text" name="address"
                                   placeholder="Adres" value="${employee.address}">
						</div>
						<div class="form-group">
                            <label>Telefon</label>
							<input class="form-control" type="text" name="phone"
                                   placeholder="Telefon" value="${employee.phone}">
						</div>
						<div class="form-group">
                            <label>Koszt godziny roboczej</label>
							<input class="form-control" type="number" step=".01" name="costPerHour"
                                   placeholder="Koszt godziny roboczej" value="${employee.costPerHour}">
						</div>
						<div class="form-group">
                            <label>Uwagi</label>
							<textarea class="form-control" name="note" rows="8"
                                      placeholder="Uwagi">${employee.note}</textarea>
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
