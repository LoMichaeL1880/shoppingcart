<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
                  <li aria-current="page" class="breadcrumb-item active">My wishlist</li>
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
            
            
            <div id="wishlist" class="col-lg-9">
              <div class="row products">
	              <c:forEach begin="1" end="8">
		              
		                <div class="col-lg-3 col-md-4">
		                  <div class="product">
		                    <div class="flip-container">
		                      <div class="flipper">
		                        <div class="front"><a href="detail.html"><img src="../img/product1.jpg" alt="" class="img-fluid"></a></div>
		                        <div class="back"><a href="detail.html"><img src="../img/product1_2.jpg" alt="" class="img-fluid"></a></div>
		                      </div>
		                    </div><a href="detail.html" class="invisible"><img src="../img/product1.jpg" alt="" class="img-fluid"></a>
		                    <div class="text">
		                      <h3><a href="detail.html">Fur coat with very but very very long name</a></h3>
		                      <p class="price"> 
		                        <del></del>$143.00
		                      </p>
		                      <p class="buttons">
			                      <a href="detail" class="btn btn-outline-secondary">View detail</a>
			                      <a href="basket" class="btn btn-primary"><i class="fa fa-shopping-cart"></i>Add to cart</a>
		                      </p>
		                    </div>
		                    <!-- /.text-->
		                  </div>
		                  <!-- /.product            -->
		                </div>
		                <!-- /.products-->
		              
	              </c:forEach>
              </div>
            </div>
            
            
          </div>
        </div>
      </div>
    </div>

    <!-- include footer -->
    <%@include file="../../frontend/home/home_footer.jsp" %>
  </body>
</html>