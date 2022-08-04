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
		<div class="container" id="maincontainer">
			<h2 align="center">�q��޲z</h2>
			<hr>
			<table id="table-1" class="table table-hover table-border">
				<thead class="table-success">
					<tr>
						<th>�q��s��</th>
						<th>�`���B</th>
						<th>�q����</th>
						<th>�q�檬�A</th>
						<th>�B�e���</th>
						<th>�ާ@</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="list" items="${orderList }">
						<tr>
							<td>${list.orderid }</td>
							<td>${list.totalprice}</td>
							<td>${list.orderdate}</td>
							<td>${list.status}</td>
							<td>${list.deliverdate}</td>
							
							<td>
								<a href="#" onclick=send("${pageContext.request.contextPath }/backend/orderview/${list.orderid }") class="btn btn-success">
									�d��
								</a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<script type="text/javascript">
			function send(url){
				$.get(url,function(data){
					$("#maincontainer").html(data);
				});
			}
		</script>
	</body>
</html>