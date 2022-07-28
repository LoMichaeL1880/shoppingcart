<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="BIG5">
		<title>Insert title here</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	</head>
	<body>
		<div class="container">
			<h2 align="center">產品</h2>
			<hr>
			<table id="table-1" class="table table-hover table-border">
				<thead class="table-success">
					<tr>
						<th>ID</th>
						<th>NAME</th>
						<th>PRICE</th>
						<th>SIZE</th>
						<th>COLOR</th>
						<th>STOCK</th>
						<th>INTRODUCTION</th>
						<th>SPECIFICATION</th>
						<th>UPLOADDATE</th>
						<th>AMOUNT</th>
						<th>CATEGORY</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="pro" items="${productList }">
						<tr>
							<td>${pro.pid }</td>
							<td>${pro.pname }</td>
							<td>${pro.pprice }</td>
							<td>${pro.psize }</td>
							<td>${pro.pcolor } </td>
							<td>${pro.pstock }</td>
							<td>${pro.pintroduction }</td>
							<td>${pro.pspecification } </td>
							<td>${pro.puploaddate }</td>
							<td>${pro.pamount } </td>
							<td>${pro.category }</td>						
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>

	</body>
</html>