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
		<div class="container" id="miancontainer">
			<h2 align="center">販售中產品</h2>
			<hr>
			<table id="table-1" class="table table-hover table-border">
				<thead class="table-success">
					<tr>
						<th>ID</th>
						<th>NAME</th>
						<th>PRICE</th>
						<th>STOCK</th>
						<th>UPLOADDATE</th>
						<th>CATEGORY</th>
						<th>PICTURE</th>
						<th>STATUS</th>
						<th>UPDATE/DELETE</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="pro" items="${productList }">
						<tr>
							<td>${pro.pid }</td>
							<td>${pro.pname }</td>
							<td>${pro.pprice }</td>
							<td>${pro.pstock }</td>
							<td>${pro.puploaddate }</td>
							<td>${pro.category.name }</td>		
							<td><img src="${pro.ppicpath }"  height=80 width=100></td>		
							<td>${pro.status }</td>
							<td>
								<a href="#" onclick=update("${pageContext.request.contextPath }/backend/updateproduct/${pro.pid }")>修改</a>
								<a href="#" onclick=update("${pageContext.request.contextPath }/backend/stopselling/${pro.pid }")>下架</a>
							</td>		
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<script>
			function update(url){
				$.get(url,function(data){
					$("#miancontainer").html(data);
				})
			}
		</script>
	</body>
</html>