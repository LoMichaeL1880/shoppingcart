<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<%
	if(session.getAttribute("productincar")==null){
		session.setAttribute("productincar", 0);
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>Insert title here</title>
</head>
<body>
    <!-- navbar-->
    <header class="header mb-5">
        <!--
        *** TOPBAR ***
        _________________________________________________________
        -->
        <div id="top">
          <!-- 黑色表頭 -->
          <div class="container">
            <div class="row">
              <div class="col-lg-6 offer mb-3 mb-lg-0"><a href="http://localhost:8080/shoppingcart/backend/home" class="btn btn-success btn-sm">BACKEND</a></div>
              <div class="col-lg-6 text-center text-lg-right">
                <ul class="menu list-inline mb-0">
                  <li class="list-inline-item"><a href="logout">Logout</a></li>
                  <li class="list-inline-item"><a href="customer-account">Member</a></li>
                  <li class="list-inline-item"><a href="basket">Cart</a></li>
                </ul>
              </div>
            </div>
          </div>
          
         
          <!-- *** TOP BAR END ***-->
          
          
        </div>
        <nav class="navbar navbar-expand-lg">
          <div class="container"><a href="http://localhost:8080/shoppingcart/shopping/index" class="navbar-brand home"><img src="../img/logo.png" alt="Obaju logo" class="d-none d-md-inline-block"><img src="../img/logo-small.png" alt="Obaju logo" class="d-inline-block d-md-none"><span class="sr-only">Obaju - go to homepage</span></a>
            
            <div class="navbar-buttons">
              <button type="button" data-toggle="collapse" data-target="#navigation" class="btn btn-outline-secondary navbar-toggler"><span class="sr-only">Toggle navigation</span><i class="fa fa-align-justify"></i></button>
              <button type="button" data-toggle="collapse" data-target="#search" class="btn btn-outline-secondary navbar-toggler"><span class="sr-only">Toggle search</span><i class="fa fa-search"></i></button><a href="basket.html" class="btn btn-outline-secondary navbar-toggler"><i class="fa fa-shopping-cart"></i></a>
            </div>
            
            <div id="navigation" class="collapse navbar-collapse">
              <ul class="navbar-nav mr-auto">
              
                <li class="nav-item"><a href="http://localhost:8080/shoppingcart/shopping/index" class="nav-link active">Home</a></li>
                
                <!-- 未完成 -->
                <li class="nav-item"><a href="category" class="nav-link" id="necklace">Necklace</a></li>
                <li class="nav-item"><a href="category" class="nav-link" id="bracelet">Bracelet</a></li>
                <li class="nav-item"><a href="category" class="nav-link" id="rings">Rings</a></li>
                <li class="nav-item"><a href="category" class="nav-link" id="earrings">Earrings</a></li>
                
              </ul>
              
              
              <!-- 靠右區塊 -->
              <div class="navbar-buttons d-flex justify-content-end">
              	<div id="basket-overview" class="navbar-collapse collapse d-none d-lg-block">
	              	<a href="basket" class="btn btn-primary navbar-btn">
	              		<i class="fa fa-shopping-cart"></i><span>${sessionScope.productincar } items in cart</span>
	              	</a>
              	</div>
              </div>
              
            </div>
          </div>
        </nav>
        
      </header>
      
 
</body>
</html>