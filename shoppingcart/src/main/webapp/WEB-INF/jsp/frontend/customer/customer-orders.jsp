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
                  <li aria-current="page" class="breadcrumb-item active">My orders</li>
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
            
            
            <div id="customer-orders" class="col-lg-9">
              <div class="box">
                <h1>My orders</h1>
                <p class="lead">Your orders on one place.</p>
                <p class="text-muted">If you have any questions, please feel free to <a href="contact.html">contact us</a>, our customer service center is working for you 24/7.</p>
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
                      <c:forEach begin="1" end="5">
                      	<tr>
	                      	<th># 1735</th>
	                        <td>22/06/2013</td>
	                        <td>$ 150.00</td>
	                        <td><a href="customer-order" class="btn btn-primary btn-sm">View</a></td>
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