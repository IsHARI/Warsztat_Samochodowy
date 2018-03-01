<%@ page language="java" contentType="text/html; charset=UTF-8"
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
  	<div class="container-flex">
  		<h1>VehicleTest</h1>
  	</div>
    <div class="container-flex">
    	<form action="" method="post">
    		<div class="form-group">
	    		<input class="form-control" type="number" name="id" placeholder="id">
	    	</div>
	    	<div class="form-group">
	    		<input class="form-control" type="date" name="takeInDate" placeholder="takeInDate">
	    	</div>
	    	<div class="form-group">
	    		<input class="form-control" type="date" name="plannedRepairBeginDate" placeholder="plannedRepairBeginDate">
	    	</div>
	    	<div class="form-group">
	    		<input class="form-control" type="number" name="employeeId" placeholder="employeeId">
	    	</div>
	    	<div class="form-group">
	    		<textarea class="form-control" name="problemDescription" placeholder="problemDescription"></textarea>
	    	</div>
	    	<div class="form-group">
	    		<input class="form-control" type="number" name="vehicleId" placeholder="vehicleId">
	    	</div>
	    	<div class="form-check form-check-inline">
				<label class="form-check-label" for="defaultCheck1">
					<input class="form-check-input" type="radio" name="action" value="select" checked="checked">
					Select
 				</label>
			</div>
			<div class="form-check form-check-inline">
				<label class="form-check-label" for="defaultCheck1">
					<input class="form-check-input" type="radio" name="action" value="insert">
					Insert/Update
 				</label>
			</div>
			<div class="form-check form-check-inline">
				<label class="form-check-label" for="defaultCheck1">
					<input class="form-check-input" type="radio" name="action" value="delete">
					Delete
 				</label>
			</div>
	    	<div class="form-group">
	    		<input class="btn btn-primary" type="submit" value="test">
    		</div>
    	</form>
    </div>
  	<div class="container-flex">
	    <table class="table">
	    	<thead>
	    		<tr>
	    			<th scope="col">id</th>
	    			<th scope="col">takeInDate</th>
	    			<th scope="col">plannedRepairBeginDate</th>
	    			<th scope="col">repairBeginDate</th>	    
	    			<th scope="col">repairEndDate</th>
	    			<th scope="col">employee id</th>
	    			<th scope="col">problemDescription</th>
	    			<th scope="col">repairDescription</th>
	    			<th scope="col">status</th>
	    			<th scope="col">vehicle id</th>
	    			<th scope="col">costForClient</th>
	    			<th scope="col">costOfParts</th>
	    			<th scope="col">costPerHour</th>
	    			<th scope="col">workHours</th>
	    		</tr>
	    	</thead>
	    	<tbody>
	    		<c:if test="${not empty byId}">
	    			<c:set var="vehicle" value="${byId.vehicle}" />
	    			<c:set var="employee" value="${byId.employee}" />
	    			<tr class="table-active">
	    				<th scope="row">${byId.id}</th>
	    				<td>${byId.takeInDate}</td>
	    				<td>${byId.plannedRepairBeginDate}</td>
	    				<td>${byId.repairBeginDate}</td>
	    				<td>${byId.repairEndDate}</td>
	    				<td>${employee.id}</td>
	    				<td>${byId.problemDescription}</td>
	    				<td>${byId.repairDescription}</td>
	    				<td>${byId.status}</td>
	    				<td>${vehicle.id}</td>
	    				<td>${byId.costForClient}</td>
	    				<td>${byId.costOfParts}</td>
	    				<td>${byId.costPerHour}</td>
	    				<td>${byId.workHours}</td>
	    			</tr>
	    		</c:if>
	    		<c:forEach items="${all}" var="order">
	    			<c:set var="vehicle" value="${order.vehicle}" />
	    			<c:set var="employee" value="${order.employee}" />
	    			<tr>
	    				<th scope="row">${order.id}</th>
	    				<td>${order.takeInDate}</td>
	    				<td>${order.plannedRepairBeginDate}</td>
	    				<td>${order.repairBeginDate}</td>
	    				<td>${order.repairEndDate}</td>
	    				<td>${employee.id}</td>
	    				<td>${order.problemDescription}</td>
	    				<td>${order.repairDescription}</td>
	    				<td>${order.status}</td>
	    				<td>${vehicle.id}</td>
	    				<td>${order.costForClient}</td>
	    				<td>${order.costOfParts}</td>
	    				<td>${order.costPerHour}</td>
	    				<td>${order.workHours}</td>
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