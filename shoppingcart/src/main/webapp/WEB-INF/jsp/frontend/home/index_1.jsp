<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<%@include file="home_head.jsp" %>
	</head>
	<body>
		<!-- container -->
		<div id="all">
			<div id="content">
				<!-- navbar -->
				<% if(session.getAttribute("login") != null){ %>
					<%@include file="navbar_login.jsp" %>
				<% } else { %>
					<%@include file="navbar.jsp" %>
				<% } %>
				
				<!-- ���� -->
				<%@include file="carousel.jsp" %>
				
				<!-- Hot this week -->
				<%@include file="hotproductlist.jsp" %>
				
				<!-- ����-2 -->
				<%@include file="carousel-2.jsp" %>
			</div>
		</div>
	
	
		<!-- include footer -->
    	<%@include file="home_footer.jsp" %>
    	
    	<script type="text/javascript">
    		$(document).ready(function(){
    			
    		});
    	</script>
	</body>
</html>