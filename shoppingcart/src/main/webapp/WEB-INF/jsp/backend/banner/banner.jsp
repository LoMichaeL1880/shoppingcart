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
			<h2 align="center">輪播管理</h2>
			<hr>
			<table id="table-1" class="table table-hover table-border">
				<thead class="table-success">
					<tr>
						<th>ID</th>
						<th>PIC</th>
						<th>NAME</th>
						<th>HYPERLINK</th>
						<th>ACTION</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="pic" items="${bannerList }">
						<tr>
							<td>${pic.picid }</td>
							<td>
								<img class="small-banner" alt="" src="${pic.path }"/>
							</td>
							<td>${pic.picname }</td>
							<td>${pic.hyperlink }
							<td>

								<a href="#" onclick=remove("${pageContext.request.contextPath }/backend/remove/${pic.picid }")>刪除</a>
								
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<script type="text/javascript">
			function remove(url){
				if(confirm("是否要刪除?")){
					$.get(url,function(data){
						$("#maincontainer").html(data);
					});
				}
			}
		</script>
	</body>
</html>