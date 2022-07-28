<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<<<<<<< HEAD
<html>
<body>
<!--
*** HOT PRODUCT SLIDESHOW ***
_________________________________________________________
-->
<div id="hot">
  <div class="box py-4">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <h2 class="mb-0">Hot this week</h2>
        </div>
      </div>
    </div>
  </div>
  
  <div class="container">
    <div class="product-slider owl-carousel owl-theme">

      <!--hot product list -->
      <c:forEach begin="1" end="5">
	      <div class="item">
	        <div class="product">
	          <div class="flip-container">
	            <div class="flipper">
	              <div class="front"><a href="detail.html"><img src="../img/product3.jpg" alt="" class="img-fluid"></a></div>
	              <div class="back"><a href="detail.html"><img src="../img/product3_2.jpg" alt="" class="img-fluid"></a></div>
	            </div>
	          </div><a href="detail.html" class="invisible"><img src="../img/product3.jpg" alt="" class="img-fluid"></a>
	          <div class="text">
	            <h3><a href="detail.html">Black Blouse Versace</a></h3>
	            <p class="price"> 
	              <del></del>$143.00
	            </p>
	          </div>
	        </div>
	      </div>
      </c:forEach>
      

    </div>
  </div>
</div>
<script type="text/javascript">
	
</script>
</body>
</html>
=======
<!--
*** HOT PRODUCT SLIDESHOW ***
_________________________________________________________
-->
<div id="hot">
  <div class="box py-4">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <h2 class="mb-0">Hot this week</h2>
        </div>
      </div>
    </div>
  </div>
  
  <div class="container">
    <div class="product-slider owl-carousel owl-theme">

      <!--hot product list -->
      <c:forEach begin="1" end="5">
	      <div class="item">
	        <div class="product">
	          <div class="flip-container">
	            <div class="flipper">
	              <div class="front"><a href="detail.html"><img src="../img/product3.jpg" alt="" class="img-fluid"></a></div>
	              <div class="back"><a href="detail.html"><img src="../img/product3_2.jpg" alt="" class="img-fluid"></a></div>
	            </div>
	          </div><a href="detail.html" class="invisible"><img src="../img/product3.jpg" alt="" class="img-fluid"></a>
	          <div class="text">
	            <h3><a href="detail.html">Black Blouse Versace</a></h3>
	            <p class="price"> 
	              <del></del>$143.00
	            </p>
	          </div>
	        </div>
	      </div>
      </c:forEach>
      



    </div>
  </div>
</div>
>>>>>>> branch 'master' of https://github.com/LoMichaeL1880/shoppingcart.git
