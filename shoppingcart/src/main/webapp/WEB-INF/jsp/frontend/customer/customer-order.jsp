<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Shopping Cart</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="all,follow">
    <!-- Bootstrap CSS-->
    <link rel="stylesheet" href="../../vendor/bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome CSS-->
    <link rel="stylesheet" href="../../vendor/font-awesome/css/font-awesome.min.css">
    <!-- Google fonts - Roboto -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,700">
    <!-- owl carousel-->
    <link rel="stylesheet" href="../../vendor/owl.carousel/assets/owl.carousel.css">
    <link rel="stylesheet" href="../../vendor/owl.carousel/assets/owl.theme.default.css">
    <!-- theme stylesheet-->
    <link rel="stylesheet" href="../../css/style.default.css" id="theme-stylesheet">
    <!-- Custom stylesheet - for your changes-->
    <link rel="stylesheet" href="../../css/custom.css">
    <!-- Favicon-->
    <link rel="shortcut icon" href="../favicon.png">

    <!-- Tweaks for older IEs--><!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
  </head>
  <body>

    <!-- navbar -->
	<% if(session.getAttribute("login") != null){ %>
		<%@include file="../../frontend/home/navbar_login.jsp" %>
	<% } else { %>
		<%@include file="../../frontend/home/navbar.jsp" %>
	<% } %>

    <div id="all">
      <div id="content">
        <div class="container">
          <div class="row">
            
            
            <div class="col-lg-3">
              <!--
              *** CUSTOMER MENU ***
              _________________________________________________________
              -->
              <%@include file="../../personal_account/customerasidemenu.jsp" %>
              
              
              <!-- /.col-lg-3-->
              <!-- *** CUSTOMER MENU END ***-->
            </div>
            <div id="customer-order" class="col-lg-9">
              <div class="box">
                <h1>Order </h1>
                <hr>
                <div class="table-responsive mb-4">
                  <table class="table">
                    <thead>
                      <tr>
                        <th colspan="2">Product</th>
                        <th>Quantity</th>
                        <th>Unit price</th>
                        <th>Discount</th>
                        <th>Total</th>
                      </tr>
                    </thead>
                    
                    
                    <tbody>
                      <c:forEach var="o" items="${orderdetail }">
                      	<c:set var="num" value="${num + 1 }"></c:set>
	                      <tr>
	                        <td><a href="#"><img src="../${o.product.ppicpath }" alt=""></a></td>
	                        <td><a href="#">${o.product.pname }</a></td>
	                        <td>${o.quantity }</td>
	                        <td>$${o.price }</td>
	                        <td>$0.00</td>
	                        <td>$${o.price*o.quantity }</td>
	                        <c:set var="total" value="${total + o.price*o.quantity }"/>
	                      </tr>
                      </c:forEach>                      
                    </tbody>
                    
                    
                    <tfoot>
                      <tr>
                        <th colspan="5" class="text-right">Total</th>
                        <th>$${total }</th>
                      </tr>
                    </tfoot>
                  </table>
                  
                  
                </div>
                <!-- /.table-responsive-->
                
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!--


    <!-- include footer -->
    <%@include file="../../frontend/home/home_footer.jsp" %>
    
  </body>
</html>