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
			<h2 align="center">訂單管理</h2>
			<hr>
			<table id="table-1" class="table table-hover table-border">
				<thead class="table-success">
					<tr>
						<th>訂單編號</th>
						<th>會員編號</th>
						<th>總金額</th>
						<th>訂單日期</th>
						<th>訂單狀態</th>
						<th>運送日期</th>
						<th>商品評論</th>
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
								<a href="${pageContext.request.contextPath }/backend/update/${pic.picid }" onclick="return confirm('確定要修改 ${item.product.name}?')">修改</a>
								<a href="${pageContext.request.contextPath }/backend/remove/${pic.picid }" onclick="return confirm('確定要刪除 ${item.product.name}?')">刪除</a>								
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>

	</body>
</html>