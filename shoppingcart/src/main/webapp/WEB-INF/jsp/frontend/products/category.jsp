<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<%@include file="home_head.jsp" %>
	</head>
	<body>
		<!-- navbar -->
		<%@include file="navbar.jsp" %>
		<!-- container -->
		<div id="all">
			<div id="content">
				<div class="container">
		          <div class="row">
		
		            <!--麵包屑-->
		            <div class="col-lg-12">
		              <!-- breadcrumb-->
		              <nav aria-label="breadcrumb">
		                <ol class="breadcrumb">
		                  <li class="breadcrumb-item"><a href="#">Home</a></li>
		                  <li aria-current="page" class="breadcrumb-item active">Ladies</li>
		                </ol>
		              </nav>
		            </div>
		
					<!--側邊欄-->
					<%@include file="product_aside.jsp" %>
		
		            <!--Product-->
		            <div class="col-lg-9">
		              <!--分頁及搜尋-->
		              <div class="box info-bar">
		                <div class="row">
		                  <!--產品數量-->
		                  <div class="col-md-12 col-lg-4 products-showing">Showing <strong>12</strong> of <strong>25</strong> products</div>
		                  
		                  <div class="col-md-12 col-lg-7 products-number-sort">
		                    <form class="form-inline d-block d-lg-flex justify-content-between flex-column flex-md-row">
		                      <!--單頁數量設定-->
		                      <div class="products-number"><strong>Show</strong><a href="#" class="btn btn-sm btn-primary">12</a><a href="#" class="btn btn-outline-secondary btn-sm">24</a><a href="#" class="btn btn-outline-secondary btn-sm">All</a><span>products</span></div>
		                      <!--依條件搜尋-->
		                      <div class="products-sort-by mt-2 mt-lg-0"><strong>Sort by</strong>
		                        <select name="sort-by" class="form-control">
		                          <option>Price</option>
		                          <option>Name</option>
		                        </select>
		                      </div>
		                    </form>
		                  </div>
		                </div>
		              </div>
		
		              <!--產品列表-->
		              <div class="row products">
		                <div class="col-lg-4 col-md-6">
		                  <div class="product">
		                    <div class="flip-container">
		                      <div class="flipper">
		                        <div class="front"><a href="detail.html"><img src="img/product1.jpg" alt="" class="img-fluid"></a></div>
		                        <div class="back"><a href="detail.html"><img src="img/product1_2.jpg" alt="" class="img-fluid"></a></div>
		                      </div>
		                    </div><a href="detail.html" class="invisible"><img src="img/product1.jpg" alt="" class="img-fluid"></a>
		                    <div class="text">
		                      <h3><a href="detail.html">Fur coat with very but very very long name</a></h3>
		                      <p class="price"> 
		                        <del></del>$143.00
		                      </p>
		                      <p class="buttons"><a href="detail.html" class="btn btn-outline-secondary">View detail</a><a href="basket.html" class="btn btn-primary"><i class="fa fa-shopping-cart"></i>Add to cart</a></p>
		                    </div>
		                    <!-- /.text-->
		                  </div>
		                  <!-- /.product -->
		                </div>
		
		              </div>
		
		              <!--產品分頁-->
		              <div class="pages">
		                <nav aria-label="Page navigation example" class="d-flex justify-content-center">
		                  <ul class="pagination">
		                    <li class="page-item"><a href="#" aria-label="Previous" class="page-link"><span aria-hidden="true">«</span><span class="sr-only">Previous</span></a></li>
		                    <li class="page-item active"><a href="#" class="page-link">1</a></li>
		                    <li class="page-item"><a href="#" class="page-link">2</a></li>
		                    <li class="page-item"><a href="#" class="page-link">3</a></li>
		                    <li class="page-item"><a href="#" class="page-link">4</a></li>
		                    <li class="page-item"><a href="#" class="page-link">5</a></li>
		                    <li class="page-item"><a href="#" aria-label="Next" class="page-link"><span aria-hidden="true">»</span><span class="sr-only">Next</span></a></li>
		                  </ul>
		                </nav>
		              </div>
		
		
		            </div>
		            <!-- /.col-lg-9-->
		          </div>
		        </div>
				
				
				
			</div>
		</div>
	
	
		<!-- include footer -->
    	<%@include file="home_footer.jsp" %>
	</body>
</html>