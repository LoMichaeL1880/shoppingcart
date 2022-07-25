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
			$("#banner").click(function(){
				$.ajax("banner",{
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