<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<!DOCTYPE html>
<html>
	<head>
		<%@include file="navbar.jsp" %>
	</head>
	<body>
		<div class="container">
			<div class="row">
				<%@include file="aside.jsp" %>
				<!--main-->
                <div class="col-md-9" id="mainarea">
                	<h1>Welcome to ShoppingCart</h1>
                	<hr>
                	<h2>請從右方選擇您要處理的工作</h2>
                </div>
			</div>
		</div>
		
		<script type="text/javascript">
			// banner
			$("#bannerlist").click(function(){
				$.ajax("banner",{
					type:"GET",
					dataType:"html",
					success:function(data,status){
						$("#mainarea").html(data);
					}
				});
			});
			$("#bannerinsert").click(function(){
				$.ajax("insert",{
					type:"GET",
					dataType:"html",
					success:function(data,status){
						$("#mainarea").html(data);
					}
				});
			});
			// products
			$("#productlist").click(function(){
				$.ajax("product",{
					type:"GET",
					dataType:"html",
					success:function(data,status){
						$("#mainarea").html(data);
					}
				});
			});
			$("#addp").click(function(){
				$.ajax("addp",{
					type:"GET",
					dataType:"html",
					success:function(data,status){
						$("#mainarea").html(data);
					}
				});
			});$("#sellingproduct").click(function(){
				$.ajax("sellingproduct",{
					type:"GET",
					dataType:"html",
					success:function(data,status){
						$("#mainarea").html(data);
					}
				});
			});
			$("#stopsellingproduct").click(function(){
				$.ajax("stopsellingproduct",{
					type:"GET",
					dataType:"html",
					success:function(data,status){
						$("#mainarea").html(data);
					}
				});
			});
			$("#queryproduct").click(function(){
				$.ajax("queryproduct",{
					type:"GET",
					dataType:"html",
					success:function(data,status){
						$("#mainarea").html(data);
					}
				});
			});
			// orders
			$("#order").click(function(){
				$.ajax("order",{
					type:"GET",
					dataType:"html",
					success:function(data,status){
						$("#mainarea").html(data);
					}
				});
			});
			
			// account
			$("#memberlist").click(function(){
				$.ajax("member",{
					type:"GET",
					dataType:"html",
					success:function(data,status){
						$("#mainarea").html(data);
					}
				});
			});
			$("#memberupdate").click(function(){
				$.ajax("memberupdate",{
					type:"GET",
					dataType:"html",
					success:function(data,status){
						$("#mainarea").html(data);
					}
				});
			});
		</script>

	</body>
</html>