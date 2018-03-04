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

<title>AutoWarsztat CRM — ${employee.lastName} ${employee.firstName}</title>
</head>
<body>
	<%@ include file="fragments/header.jsp" %>
	
	<div class="container">
		<h1>${employee.lastName} ${employee.firstName}</h1>
		
		<button class="btn">Edytuj</button>
		<button class="btn">Usuń</button>
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
						<h5>Uwagi</h5>
						${employee.note}
					</li>
				</ul>
			</div>
			<div class="col">
				
			</div>
		</div>
	</div>
	
	<%@ include file="fragments/footer.jsp" %>
</body>	
</html>
