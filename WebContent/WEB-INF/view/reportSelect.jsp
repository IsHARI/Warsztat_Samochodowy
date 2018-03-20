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

    <title>AutoWarsztat CRM — Raporty</title>
</head>
<body>
<%@ include file="fragments/header.jsp" %>

<div class="container">
    <h1 class="m-4">Raporty</h1>

    <form action="" method="post">
        <div class="form-group">
            <label>Zakres czasowy</label>
            <div class="form-row">
                <div class="col-auto">
                    <input class="form-control" type="date" name="begin">
                </div>
                <span class="input-group-text">–</span>
                <div class="col-auto">
                    <input class="form-control" type="date" name="end">
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="form-row">
                <div class="col-auto">
                    <button class="btn btn-primary" type="submit" name="form" value="workHours">Roboczogodziny</button>
                </div>
                <div class="col-auto">
                    <button class="btn btn-primary" type="submit" name="form" value="gains">Zyski</button>
                </div>
            </div>
        </div>
    </form>
</div>

<%@ include file="fragments/footer.jsp" %>
</body>
</html>