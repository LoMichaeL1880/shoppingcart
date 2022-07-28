<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<div class="container">
  <div class="row">
    <div class="col-md-12">
      <div id="main-slider" class="owl-carousel owl-theme">
        <c:forEach var="pic" items="${picList }">
        	<div class="item">
        		<a href="${pic.hyperlink }">
        			<img src="${pic.path }" alt="" class="img-fluid">
        		</a>
        	</div>
        </c:forEach>
      </div>
      <!-- /#main-slider-->
    </div>
  </div>
</div>