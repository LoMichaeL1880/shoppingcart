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
			<h2 align="center">訂單明細</h2>
			<hr>
			<table id="table-1" class="table table-hover table-border">
				<thead class="table-success">
					<tr>
						<th>商品名稱</th>
						<th>數量</th>
						<th>單價</th>
						<th>折扣</th>
						<th>小計</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="order" items="${orderdetail }">
						<tr>
							<td>${order.product.pname }</td>
							<td>${order.quantity }</td>
							<td>${order.product.pprice }</td>
							<td>$0.00</td>
							<td>${order.quantity*order.product.pprice }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<input type="button" class="btn btn-success" id="backpage" value="回上一頁">
		</div>

	</body>
	<script type="text/javascript">
		$("#backpage").click(function(){
			window.history.back();
		});
	</script>
	
</html>