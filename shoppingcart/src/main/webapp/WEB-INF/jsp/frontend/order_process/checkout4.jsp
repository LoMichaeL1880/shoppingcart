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
	<% if(session.getAttribute("login") != null){ %>
		<%@include file="../../frontend/home/navbar_login.jsp" %>
	<% } else { %>
		<%@include file="../../frontend/home/navbar.jsp" %>
	<% } %>


    <div id="all">
      <div id="content">
        <div class="container">
          <div class="row">

            
            
            <div id="checkout" class="col-lg-12">
              <div class="box">
              
                
                  <h1>Checkout - Order review</h1>
                  
                  
                  <div class="content">
                    <div class="table-responsive">
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
                          <c:forEach var="o" items="${order }">
	                          <tr>
	                          	<c:set var="num" value="${num + 1 }"></c:set>
	                            <td><a href="#"><img src="${o.product.ppicpath }" alt=""></a></td>
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
                            <th colspan="5">Total</th>
                            <th>$${total }</th>
                          </tr>
                        </tfoot>
                        
                      </table>
                    </div>
                    <!-- /.table-responsive-->
                  </div>
                  
                  
                  <!-- /.content-->
             
                  <div class="box-footer d-flex justify-content-between">
                  	<a href="checkout1" class="btn btn-outline-secondary"><i class="fa fa-chevron-left"></i>Back to Checkout Member</a>
                    <a href="cartfinish" class="btn btn-primary"><i class="fa fa-chevron-right"></i>Place an order</a>

                  </div>
                  
                
              </div>
              <!-- /.box-->
            </div>
            
            
            <!-- /.col-lg-3-->
          </div>
        </div>
      </div>
    </div>
 
     <!-- include footer -->
    <%@include file="../../frontend/home/home_footer.jsp" %>
 
  </body>
</html>