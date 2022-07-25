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
				<!-- ½ü¼½ -->
				<div class="container">
	                <div class="row">
	                  <div class="col-md-12">
	                    <div id="main-slider" class="owl-carousel owl-theme">
	                      <c:forEach var="pic" items="${picList }">
	                      	<div class="item"><img src="${pic.path }" alt="" class="img-fluid"></div>
	                      </c:forEach>
	                    </div>
	                    <!-- /#main-slider-->
	                  </div>
	                </div>
	              </div>
			</div>
		</div>
	
	
		<!-- include footer -->
    	<%@include file="home_footer.jsp" %>
	</body>
</html>