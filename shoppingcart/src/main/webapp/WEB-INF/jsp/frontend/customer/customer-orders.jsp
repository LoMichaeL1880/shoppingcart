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
            
            
            <div class="col-lg-3">
              <!--
              *** CUSTOMER MENU ***
              _________________________________________________________
              -->
              
			  <%@include file="../../personal_account/customerasidemenu.jsp" %>

              <!-- /.col-lg-3-->
              <!-- *** CUSTOMER MENU END ***-->
            </div>
            
            
            <div id="customer-orders" class="col-lg-9">
              <div class="box">
                <h1>My orders</h1>
                <p class="lead">Your orders on one place.</p>
                <hr>
                
                
                <div class="table-responsive">
                  <table class="table table-hover">
                    <thead>
                      <tr>
                        <th>Order</th>
                        <th>Date</th>
                        <th>Total</th>
                        <th>Action</th>
                      </tr>
                    </thead>
                    <tbody>
                      <c:forEach var="o" items="${orderList }">
                      	<tr>
	                      	<th>${o.orderid }</th>
	                        <td>${o.orderdate }</td>
	                        <td>$ ${o.totalprice }</td>
	                        <td><a href="customer-order/${o.orderid }" class="btn btn-primary btn-sm">View</a></td>
                      	</tr>
                      </c:forEach>
                    </tbody>
                  </table>
                </div>
                
                
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