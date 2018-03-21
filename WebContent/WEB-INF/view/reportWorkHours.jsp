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

    <title>AutoWarsztat CRM — Raport: Roboczogodziny (${beginDate} – ${endDate})</title>
</head>
<body>
<%@ include file="fragments/header.jsp" %>

<div class="container">
    <h1 class="m-4">Raport: Roboczogodziny<br>(${beginDate} – ${endDate})</h1>

    <button class="btn" type="button" class="btn btn-primary" data-toggle="modal" data-target="#addModal">Dodaj</button>

    <table class="table table-responsive">
        <thead>
        <tr>
            <th scope="col">Nazwisko i imię</th>
            <th scope="col">Suma roboczogodzin</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="employeeMapElem" items="${employeeMap}">
            <c:set var="employee" value="${employeeMapElem.value}"/>
            <tr>
                <td><a href="employeeDetails?id=${employee.id}">${employee.lastName} ${employee.firstName}</a></td>
                <td>${employeeMapElem.key}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<%@ include file="fragments/footer.jsp" %>
</body>
</html>