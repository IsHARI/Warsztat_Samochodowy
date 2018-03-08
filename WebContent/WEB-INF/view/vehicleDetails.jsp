<%@ page language="java" contentType="text/html; charset=UTF-8"
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
<link href="sticky-footer.css" rel="stylesheet">

<title>AutoWarsztat CRM — ${vehicle.model}</title>
</head>
<body>
	<%@ include file="fragments/header.jsp" %>
	
	<div class="container">
		<h1 class="m-4">${vehicle.model}</h1>
		
		<form action="vehicleDelete" method="post">
			<button class="btn"  type="button" class="btn btn-primary" data-toggle="modal" data-target="#addVehicleModal">Edytuj</button>
			<button class="btn" type="submit" name="id" value="${vehicle.id}">Usuń</button>
		</form>
			
		<%@ include file="fragments/addVehicleModal.jsp" %>
			
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
		
			<%@ include file="fragments/addOrderModal.jsp" %>
			
			<table class="table table-responsive">
				<thead>
					<tr>
						<th scope="col">Rozpoczęcie naprawy</th>
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
	
	<%@ include file="fragments/footer.jsp" %>
</body>	
</html>
