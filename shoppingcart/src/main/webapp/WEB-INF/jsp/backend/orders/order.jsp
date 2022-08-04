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
			<h2 align="center">訂單管理</h2>
			<hr>
			<table id="table-1" class="table table-hover table-border">
				<thead class="table-success">
					<tr>
						<th>訂單編號</th>
						<th>總金額</th>
						<th>訂單日期</th>
						<th>訂單狀態</th>
						<th>運送日期</th>
						<th>操作</th>
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
									查看
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