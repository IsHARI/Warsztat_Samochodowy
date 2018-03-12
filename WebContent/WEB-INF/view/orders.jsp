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
    <link href="sticky-footer.css" rel="stylesheet">

    <title>AutoWarsztat CRM — Zlecenia</title>
</head>
<body>
<%@ include file="fragments/header.jsp" %>

<div class="container">
    <h1 class="m-4">Zlecenia</h1>

    <table class="table table-responsive">
        <thead>
        <tr>
            <th scope="col">
                Rozpoczęcie naprawy<br>
                / Przyjęcie zamówienia
            </th>
            <th scope="col">Pracownik</th>
            <th scope="col">Pojazd</th>
            <th scope="col">Status</th>
            <th scope="col">Koszt dla klienta</th>
            <th scope="col">Koszt części</th>
            <th scope="col">Koszt roboczogodziny</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="order" items="${orders}">
            <c:set var="employee" value="${order.employee}"/>
            <c:set var="vehicle" value="${order.vehicle}"/>
            <tr>
                <td><a href="orderDetails?id=${order.id}">${order.repairBeginDate}</a></td>
                <td><a href="employeeDetails?id=${employee.id}">${employee.lastName} ${employee.firstName}</a></td>
                <td>${vehicle.model}</td>
                <td>
                    <c:if test="${order.status=='TAKEN_IN'}">Przyjęte</c:if>
                    <c:if test="${order.status=='COSTS_APPROVED'}">Koszty zatwierdzone</c:if>
                    <c:if test="${order.status=='IN_REPAIR'}">Naprawa w toku</c:if>
                    <c:if test="${order.status=='DONE'}">Zakończone</c:if>
                    <c:if test="${order.status=='CANCELLED'}">Anulowane</c:if>
                </td>
                <td>
                    <c:if test="${not empty order.costForClient}">
                        ${order.costForClient}
                    </c:if>
                </td>
                <td>
                    <c:if test="${not empty order.costOfParts}">
                        ${order.costOfParts}
                    </c:if>
                </td>
                <td>
                        ${order.costPerHour}
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<%@ include file="fragments/footer.jsp" %>
</body>
</html>