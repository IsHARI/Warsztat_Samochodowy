<%@ page contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <title>Hello, world!</title>
  </head>
  <body>
  	<div class="container">
  		<h1>EmployeeTest</h1>
  	</div>
    <div class="container">
    	<form action="" method="post">
    		<div class="form-group">
	    		<input class="form-control" type="number" name="id" placeholder="id">
	    	</div>
	    	<div class="form-group">
	    		<input class="form-control" type="text" name="firstName" placeholder="firstName">
	    	</div>
	    	<div class="form-group">
	    		<input class="form-control" type="text" name="lastName" placeholder="lastName">
	    	</div>
	    	<div class="form-group">
	    		<input class="form-control" type="text" name="address" placeholder="address">
	    	</div>
	    	<div class="form-group">
	    		<input class="form-control" type="text" name="phone" placeholder="phone">
	    	</div>
	    	<div class="form-group">
	    		<textarea class="form-control" name="note" placeholder="note"></textarea>
	    	</div>
	    	<div class="form-group">
	    		<input class="form-control" type="number" step=".01" name="costPerHour" placeholder="costPerHour">
	    	</div>
	    	<div class="form-check form-check-inline">
				<label class="form-check-label">
					<input class="form-check-input" type="radio" name="action" value="select" checked="checked">
					Select
 				</label>
			</div>
			<div class="form-check form-check-inline">
				<label class="form-check-label">
					<input class="form-check-input" type="radio" name="action" value="insert">
					Insert/Update
 				</label>
			</div>
			<div class="form-check form-check-inline">
				<label class="form-check-label">
					<input class="form-check-input" type="radio" name="action" value="delete">
					Delete
 				</label>
			</div>
	    	<div class="form-group">
	    		<input class="btn btn-primary" type="submit" value="test">
    		</div>
    	</form>
    </div>
  	<div class="container">
	    <table class="table">
	    	<thead>
	    		<tr>
	    			<th scope="col">id</th>
	    			<th scope="col">firstName</th>
	    			<th scope="col">lastName</th>
	    			<th scope="col">address</th>	    
	    			<th scope="col">phone</th>
	    			<th scope="col">note</th>
	    			<th scope="col">costPerHour</th>
	    		</tr>
	    	</thead>
	    	<tbody>
	    		<c:if test="${not empty byId}">
	    			<tr class="table-active">
	    				<th scope="row">${byId.id}</th>
	    				<td>${byId.firstName}</td>
	    				<td>${byId.lastName}</td>
	    				<td>${byId.address}</td>
	    				<td>${byId.phone}</td>
	    				<td>${byId.note}</td>
	    				<td>${byId.costPerHour}</td>
	    			</tr>
	    		</c:if>
	    		<c:forEach items="${all}" var="employee">
	    			<tr>
	    				<th scope="row">${employee.id}</th>
	    				<td>${employee.firstName}</td>
	    				<td>${employee.lastName}</td>
	    				<td>${employee.address}</td>
	    				<td>${employee.phone}</td>
	    				<td>${employee.note}</td>
	    				<td>${employee.costPerHour}</td>
	    			</tr>
	    		</c:forEach>
	    	</tbody>
	    </table>
    </div>
    
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  </body>
</html>