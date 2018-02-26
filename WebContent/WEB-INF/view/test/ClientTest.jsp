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
    <table class="table">
    	<thead>
    		<tr>
    			<th scope="col">id</th>
    			<th scope="col">firstName</th>
    			<th scope="col">lastName</th>
    			<th scope="col">email</th>	    
    			<th scope="col">phone</th>
    		</tr>
    	</thead>
    	<tbody>
    		<c:forEach items="${all}" var="client">
    			<tr>
    				<th scope="row">${client.id}</th>
    				<td>${client.firstName}</td>
    				<td>${client.lastName}</td>
    				<td>${client.email}</td>
    				<td>${client.phone}</td>
    			</tr>
    		</c:forEach>
    	</tbody>
    </table>
  </body>
</html>