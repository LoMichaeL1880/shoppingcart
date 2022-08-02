<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
	<body>
		<div class="container">
			<h2 align="center">--ALL MEMBER--</h2>
			<hr>
			<table id="table-1" class="table table-hover table-border">
				<thead class="table-success">
					<tr>
						<th>ID</th>
						<th>Name</th>
						<th>Account</th>
						<th>Address</th>
						<th>Phone</th>
						<th>Email</th>
						<th>Password</th>
						<th>Role</th>
						<th>Created Date</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="mem" items="${memberList}">
						<tr>
							<th>${mem.mid}</th>
							<th>${mem.mname}</th>
							<th>${mem.account}</th>
							<th>${mem.address}</th>
							<th>${mem.phone}</th>
							<th>${mem.email}</th>
							<th>${mem.password}</th>
							<th>${mem.role}
								<a href="#" onclick=update("${pageContext.request.contextPath }/backend/changerole/${mem.mid }")>修改</a>
							</th>
							<th>${mem.createdate}</th>
							
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
<script type="text/javascript">
function update(url){
	$.get(url,function(data){
		$("#miancontainer").html(data);
	})
}

</script>
	</body>
</html>