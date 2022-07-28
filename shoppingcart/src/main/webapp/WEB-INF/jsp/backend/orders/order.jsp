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
			<h2 align="center">�q��޲z</h2>
			<hr>
			<table id="table-1" class="table table-hover table-border">
				<thead class="table-success">
					<tr>
						<th>�q��s��</th>
						<th>�|���s��</th>
						<th>�`���B</th>
						<th>�q����</th>
						<th>�q�檬�A</th>
						<th>�B�e���</th>
						<th>�ӫ~����</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="pic" items="${bannerList }">
						<tr>
							<td>${pic.orderid }</td>
							<td>${pic.mid }</td>
							<td>${pic.totalprice}</td>
							<td>${pic.orderdate}</td>
							<td>${pic.status}</td>
							<td>${pic.deliverdate}</td>
							<td>${pic.comments}</td>
							
							<td>
								<a href="${pageContext.request.contextPath }/backend/update/${pic.picid }" onclick="return confirm('�T�w�n�ק� ${item.product.name}?')">�ק�</a>
								<a href="${pageContext.request.contextPath }/backend/remove/${pic.picid }" onclick="return confirm('�T�w�n�R�� ${item.product.name}?')">�R��</a>								
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>

	</body>
</html>