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

<title>AutoWarsztat CRM — Klienci</title>
</head>
<body>
	<%@ include file="fragments/header.jsp" %>
	
	<div class="container">	
		<h1 class="m-4">Klienci</h1>
		
		<form action="" method="post">
			<div class="input-group mb-3">
				<input type="text" class="form-control" placeholder="Szukaj" name="name" >
				<div class="input-group-append">
					<input class="form-control" type="submit" value="Szukaj">
				</div>
			</div>
		</form>
		
		<button class="btn" type="button" class="btn btn-primary" data-toggle="modal" data-target="#addModal">Dodaj</button>
		
		<%@ include file="fragments/addClientModal.jsp" %>
		
		<table class="table table-responsive">
			<thead>
				<tr>
					<th scope="col">Nazwisko i imię</th>
					<th scope="col">Email</th>
					<th scope="col">Telefon</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="client" items="${clients}">
					<tr>
						<td><a href="clientDetails?id=${client.id}">${client.lastName} ${client.firstName}</a></td>
						<td><a href="mailto:${client.email}">${client.email}</a></td>
						<td>${client.phone}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	<%@ include file="fragments/footer.jsp" %>
</body>
</html>