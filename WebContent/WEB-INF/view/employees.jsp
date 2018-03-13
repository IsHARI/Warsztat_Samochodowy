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

<title>AutoWarsztat CRM — Pracownicy</title>
</head>
<body>
	<%@ include file="fragments/header.jsp" %>
	
	<div class="container">
		<h1 class="m-4">Pracownicy</h1>

		<button class="btn" type="button" class="btn btn-primary" data-toggle="modal" data-target="#addModal">Dodaj</button>

		<table class="table table-responsive">
			<thead>
				<tr>
					<th scope="col">Nazwisko i imię</th>
					<th scope="col">Telefon</th>
					<th scope="col">Koszt roboczogodziny</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="employee" items="${employees}">
					<tr>
						<td><a href="employeeDetails?id=${employee.id}">${employee.lastName} ${employee.firstName}</a></td>
						<td>${employee.phone}</td>
						<td>${employee.costPerHour}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="addModal" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Dodaj pracownika</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
				<form action="" method="post">
					<div class="modal-body">
						<div class="form-group">
                            <label>Imię</label>
							<input class="form-control" type="text" name="firstName" placeholder="Imię">
						</div>
						<div class="form-group">
                            <label>Nazwisko</label>
							<input class="form-control" type="text" name="lastName" placeholder="Nazwisko">
						</div>
						<div class="form-group">
                            <label>Adres</label>
							<input class="form-control" type="text" name="address" placeholder="Adres">
						</div>
						<div class="form-group">
                            <label>Telefon</label>
							<input class="form-control" type="text" name="phone" placeholder="Telefon">
						</div>
						<div class="form-group">
                            <label>Koszt godziny roboczej</label>
							<input class="form-control" type="number" step=".01" name="costPerHour" placeholder="Koszt godziny roboczej">
						</div>
						<div class="form-group">
                            <label>Uwagi</label>
                            <textarea class="form-control" name="note" rows="8" placeholder="Uwagi"></textarea>
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