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

<title>AutoWarsztat CRM — ${client.lastName} ${client.firstName}</title>
</head>
<body>
	<%@ include file="fragments/header.jsp" %>
	
	<div class="container">
		<h1 class="m-4">${client.lastName} ${client.firstName}</h1>
		
		<form action="clientDelete" method="post">
			<button class="btn"  type="button" class="btn btn-primary" data-toggle="modal" data-target="#editModal">Edytuj</button>
			<button class="btn" type="submit" name="id" value="${client.id}">Usuń</button>
		</form>

		<div class="container">
			<div class="row">
				<div class="col">
					<h5>Telefon</h5>
					${client.phone}
				</div>
				<div class="col">
					<h5>Email</h5>
					<a href="mailto:${client.email}">${client.email}</a>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col">
			<button class="btn" type="button" class="btn btn-primary" data-toggle="modal" data-target="#addModal">Dodaj</button>

			<table class="table table-responsive">
				<thead>
					<tr>
						<th scope="col">Model</th>
						<th scope="col">Rok produkcji</th>
						<th scope="col">Numer rejestracyjny</th>
						<th scope="col">Data następnego przeglądu</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="vehicle" items="${vehicles}">
						<tr>
							<td><a href="vehicleDetails?id=${vehicle.id}">${vehicle.model}</a></td>
							<td>${vehicle.yearOfProduction}</td>
							<td>${vehicle.licenceNumber}</td>
							<td>${vehicle.nextInspectionDate}</td>
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
					<h5 class="modal-title">Edytuj klienta</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<form action="" method="post">
					<div class="modal-body">
						<div class="form-group">
							<label>Imię</label>
							<input class="form-control" type="text" name="firstName"
                                   placeholder="Imię" value="${client.firstName}">
						</div>
						<div class="form-group">
							<label>Nazwisko</label>
							<input class="form-control" type="text" name="lastName"
                                   placeholder="Nazwisko" value="${client.lastName}">
						</div>
						<div class="form-group">
							<label>Email</label>
							<input class="form-control" type="email" name="email"
                                   placeholder="Email" value="${client.email}">
						</div>
						<div class="form-group">
							<label>Telefon</label>
							<input class="form-control" type="text" name="phone"
                                   placeholder="Telefon" value="${client.phone}">
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
                    <h5 class="modal-title">Dodaj pojazd</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form action="" method="post">
                    <div class="modal-body">
                        <div class="form-group">
                            <label>Model</label>
                            <input class="form-control" type="text" name="model" placeholder="Model">
                        </div>
                        <div class="form-group">
                            <label>Rok produkcji</label>
                            <input class="form-control" type="number" name="yearOfProduction" placeholder="Rok produkcji">
                        </div>
                        <div class="form-group">
                            <label>Numer rejestracyjny</label>
                            <input class="form-control" type="text" name="licenceNumber" placeholder="Numer rejestracyjny">
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
	
	<%@ include file="fragments/footer.jsp" %>
</body>	
</html>
