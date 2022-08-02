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
			<h2 align="center">�d�߲��~</h2>
			<hr>
			<div>
				�H���~�N���d��<input type="text" id="findbypid">
				<button onclick="findpid()">�d��</button>
			</div>
			<div>
				�H���~���O�d��<input type="text" id="findbycategory">
				<button onclick="findcategory()">�d��</button>
			</div>
			<div>
				�H�c�椤���~���O�d��<input type="text" id="findbysellingcategory">
				<button onclick="findsellingcategory()">�d��</button>
			</div>
			
			<div id = "showquery"><%@include file="queryshow.jsp" %></div>
			
			
		</div>
		<script>
			function update(url){
				$.get(url,function(data){
					$("#maincontainer").html(data);
				})
			}
		</script>
		<script>		
			function findpid()
			{
				var obj=new Object();
				obj.pid=document.getElementById("findbypid").value;				
				var st = JSON.stringify(obj);
				//alert(st);
				$.ajax({
					type:"post",
					url:"findbypid",
					data:st,
					contentType:"application/json",
					success:function(data,status){
						$("#maincontainer").html(data);						
					}
				});
			}
			
			function findcategory()
			{
				var obj=new Object();
				obj.name=document.getElementById("findbycategory").value;	
				var stc = JSON.stringify(obj);
				//alert(stc);
				$.ajax({
					type:"post",
					url:"findbycategory",
					data:stc,
					contentType:"application/json",
					success:function(data,status){
						$("#maincontainer").html(data);						
					}
				});
			}

			function findsellingcategory()
			{
				var obj=new Object();
				obj.name=document.getElementById("findbysellingcategory").value;	
				var stc = JSON.stringify(obj);
				//alert(stc);
				$.ajax({
					type:"post",
					url:"findbysellingcategory",
					data:stc,
					contentType:"application/json",
					success:function(data,status){
						$("#maincontainer").html(data);						
					}
				});
			}
		
		</script>
	</body>
</html>