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
			                  <li class="breadcrumb-item"><a href="#">Ladies</a></li>
			                  <li class="breadcrumb-item"><a href="#">Tops</a></li>
			                  <li aria-current="page" class="breadcrumb-item active">White Blouse Armani</li>
			                </ol>
			              </nav>
			            </div>
			            
						<!--側邊欄-->
						<%@include file="product_aside.jsp" %>
						
			            <!--產品介紹-->
			            <div class="col-lg-9 order-1 order-lg-2">
			              <div id="productMain" class="row">
			                <!--產品圖-->
			                <div class="col-md-6">
			                  <div data-slider-id="1" class="owl-carousel shop-detail-carousel">
			                    <div class="item"> <img src="img/detailbig1.jpg" alt="" class="img-fluid"></div>
			                    <div class="item"> <img src="img/detailbig2.jpg" alt="" class="img-fluid"></div>
			                    <div class="item"> <img src="img/detailbig3.jpg" alt="" class="img-fluid"></div>
			                  </div>                  
			                </div>
			                <!--明細區-->
			                <div class="col-md-6">
			                  <!--文字介紹-->
			                  <div class="box">
			                    <h1 class="text-center">White Blouse Armani</h1>
			                    <p class="goToDescription"><a href="#details" class="scroll-to">Scroll to product details, material &amp; care and sizing</a></p>
			                    <p class="price">$124.00</p>
			                    <p class="text-center buttons"><a href="basket.html" class="btn btn-primary"><i class="fa fa-shopping-cart"></i> Add to cart</a><a href="basket.html" class="btn btn-outline-primary"><i class="fa fa-heart"></i> Add to wishlist</a></p>
			                  </div>
			                  <!--縮小圖-->
			                  <div data-slider-id="1" class="owl-thumbs">
			                    <button class="owl-thumb-item"><img src="img/detailsquare.jpg" alt="" class="img-fluid"></button>
			                    <button class="owl-thumb-item"><img src="img/detailsquare2.jpg" alt="" class="img-fluid"></button>
			                    <button class="owl-thumb-item"><img src="img/detailsquare3.jpg" alt="" class="img-fluid"></button>
			                  </div>
			                </div>
			              </div>
			              <!--產品詳細介紹-->
			              <div id="details" class="box">
			                <p></p>
			                <h4>Product details</h4>
			                <p>White lace top, woven, has a round neck, short sleeves, has knitted lining attached</p>
			                <h4>Material &amp; care</h4>
			                <ul>
			                  <li>Polyester</li>
			                  <li>Machine wash</li>
			                </ul>
			                <h4>Size &amp; Fit</h4>
			                <ul>
			                  <li>Regular fit</li>
			                  <li>The model (height 5'8" and chest 33") is wearing a size S</li>
			                </ul>
			                <blockquote>
			                  <p><em>Define style this season with Armani's new range of trendy tops, crafted with intricate details. Create a chic statement look by teaming this lace number with skinny jeans and pumps.</em></p>
			                </blockquote>
			                <hr>
			                <div class="social">
			                  <h4>Show it to your friends</h4>
			                  <p><a href="#" class="external facebook"><i class="fa fa-facebook"></i></a><a href="#" class="external gplus"><i class="fa fa-google-plus"></i></a><a href="#" class="external twitter"><i class="fa fa-twitter"></i></a><a href="#" class="email"><i class="fa fa-envelope"></i></a></p>
			                </div>
			              </div>
						  
						  <!-- 可能喜歡 -->
			              <div class="row same-height-row">
			                <div class="col-md-3 col-sm-6">
			                  <div class="box same-height">
			                    <h3>You may also like these products</h3>
			                  </div>
			                </div>
			                
			                <c:forEach begin="1" end="3">
				                <div class="col-md-3 col-sm-6">
				                  <div class="product same-height">
				                    <div class="flip-container">
				                      <div class="flipper">
				                        <div class="front"><a href="detail.html"><img src="img/product2.jpg" alt="" class="img-fluid"></a></div>
				                        <div class="back"><a href="detail.html"><img src="img/product2_2.jpg" alt="" class="img-fluid"></a></div>
				                      </div>
				                    </div><a href="detail.html" class="invisible"><img src="img/product2.jpg" alt="" class="img-fluid"></a>
				                    <div class="text">
				                      <h3>Fur coat</h3>
				                      <p class="price">$143</p>
				                    </div>
				                  </div>
				                  <!-- /.product-->
				                </div>
			                </c:forEach>
			              </div>
			
			            </div>
			            <!-- /.col-md-9-->
			          </div>
			        </div>
			      </div>
			    </div>				
		<!-- include footer -->
    	<%@include file="home_footer.jsp" %>
	</body>
</html>