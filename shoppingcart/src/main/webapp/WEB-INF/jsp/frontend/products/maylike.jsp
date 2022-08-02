<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
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
           <div class="front"><a href="detail"><img src="../img/product2.jpg" alt="" class="img-fluid"></a></div>
           <div class="back"><a href="detail"><img src="../img/product2_2.jpg" alt="" class="img-fluid"></a></div>
         </div>
       </div><a href="detail" class="invisible"><img src="../img/product2.jpg" alt="" class="img-fluid"></a>
       <div class="text">
         <h3>Fur coat</h3>
         <p class="price">$143</p>
       </div>
     </div>
     <!-- /.product-->
   </div>
  </c:forEach>
</div>