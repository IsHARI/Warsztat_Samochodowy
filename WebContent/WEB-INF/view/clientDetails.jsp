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
			<button class="btn"  type="button" class="btn btn-primary" data-toggle="modal" data-target="#addModal">Edytuj</button>
			<button class="btn" type="submit" name="id" value="${client.id}">Usuń</button>
		</form>
			
		<%@ include file="fragments/addClientModal.jsp" %>
			
		<div class="container">
			<div class="row">
				<div class="col">
					<h5>Telefon</h5>
					${client.phone}
				</div>
				<div class="col">
					<h5>Email</h5>
					${client.email}
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col">
			<button class="btn" type="button" class="btn btn-primary" data-toggle="modal" data-target="#addVehicleModal">Dodaj</button>
		
			<%@ include file="fragments/addVehicleModal.jsp" %>
			
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
	
	<%@ include file="fragments/footer.jsp" %>
</body>	
</html>
