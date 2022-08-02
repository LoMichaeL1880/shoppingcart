<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
  <head>
    <%@include file="../../frontend/home/home_head.jsp" %>
  </head>
  <body>

	<!-- navbar -->
    <%@include file="../../frontend/home/navbar.jsp" %>

    <div id="all">
      <div id="content">
        <div class="container">
          <div class="row">
            <div class="col-lg-12">
              <!-- breadcrumb-->
              <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="index">Home</a></li>
                  <li aria-current="page" class="breadcrumb-item"><a href="customer-orders">My orders</a></li>
                  <li aria-current="page" class="breadcrumb-item active">Order # 1735</li>
                </ol>
              </nav>
            </div>
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
                <h1>Order #1735</h1>
                <p class="lead">Order #1735 was placed on <strong>22/06/2013</strong> and is currently <strong>Being prepared</strong>.</p>
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
                      <c:forEach begin="1" end="3">
	                      <tr>
	                        <td><a href="#"><img src="../img/detailsquare.jpg" alt="White Blouse Armani"></a></td>
	                        <td><a href="#">White Blouse Armani</a></td>
	                        <td>2</td>
	                        <td>$123.00</td>
	                        <td>$0.00</td>
	                        <td>$246.00</td>
	                      </tr>
                      </c:forEach>                      
                    </tbody>
                    
                    
                    <tfoot>
                      <tr>
                        <th colspan="5" class="text-right">Order subtotal</th>
                        <th>$446.00</th>
                      </tr>
                      <tr>
                        <th colspan="5" class="text-right">Shipping and handling</th>
                        <th>$10.00</th>
                      </tr>
                      <tr>
                        <th colspan="5" class="text-right">Tax</th>
                        <th>$0.00</th>
                      </tr>
                      <tr>
                        <th colspan="5" class="text-right">Total</th>
                        <th>$456.00</th>
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