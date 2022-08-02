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
          
            
            
            <div id="basket" class="col-lg-9">
              <div class="box">
              
              
                <form method="post" action="checkout1">
                  <h1>Shopping cart</h1>
                  <p class="text-muted">You currently have ${sessionScope.productincar } item(s) in your cart.</p>
                  
                  <!-- 商品內容 -->
                  <div class="table-responsive">
                    <table class="table">
                      <thead>
                        <tr>
                          <th colspan="2">Product</th>
                          <th>Quantity</th>
                          <th>Unit price</th>
                          <th>Discount</th>
                          <th colspan="2">Total</th>
                        </tr>
                      </thead>
                      <tbody>                        
                        <!-- 產品清單 -->  
                        <c:set var="total" value="0"/>
                        <c:set var="num" value="0"></c:set>                  
                        <c:forEach var="o" items="${order }">
	                        <tr>
	                          <c:set var="num" value="${num + 1 }"></c:set>
	                          <td><a href="#"><img src="${o.product.ppicpath }" alt=""></a></td>
	                          <td><a href="#">${o.product.pname }</a></td>
	                          <td>
	                            <input onclick="change('${num}')" id="q${num }" type="number" value="${o.quantity }" class="form-control">
	                          </td>
	                          <td>$${o.price }</td>
	                          <input type="hidden" value="${o.price }" id="p${num }">
	                          <td>$0.00</td>
	                          <td id="s${num }">$${o.price*o.quantity }</td>
	                          <c:set var="total" value="${total + o.price*o.quantity }"/>
	                          <td><a href="#"><i class="fa fa-trash-o"></i></a></td>
	                        </tr>
	                        
                        </c:forEach>      
                      </tbody>
                      <tfoot>
                        <tr>
                          <th colspan="5">Total</th>
                          <th colspan="2" id="total">$${total }</th>
                        </tr>
                      </tfoot>
                    </table>
                  </div>
                  
                  
                  
                  <!-- /.table-responsive-->
                  <div class="box-footer d-flex justify-content-between flex-column flex-lg-row">
                    <div class="left"><a href="category" class="btn btn-outline-secondary"><i class="fa fa-chevron-left"></i> Continue shopping</a></div>
                    <div class="right">
                      <button type="submit" class="btn btn-primary">Proceed to pay<i class="fa fa-chevron-right"></i></button>
                    </div>
                  </div>
                  
                  
                </form>
              </div>
              <!-- /.box-->
              

              <!-- 可能喜歡 -->
			  <%@include file="../../frontend/products/maylike.jsp" %>
			  
            </div>
            
            <!-- 右邊小計 -->
            <!-- /.col-lg-9-->
            <div class="col-lg-3">
              <div id="order-summary" class="box">
                <div class="box-header">
                  <h3 class="mb-0">Order summary</h3>
                </div>
                <p class="text-muted">Shipping and additional costs are calculated based on the values you have entered.</p>
                <div class="table-responsive">
                  <table class="table">
                    <tbody>
                      <tr>
                        <td>Order subtotal</td>
                        <th>$446.00</th>
                      </tr>
                      <tr>
                        <td>Shipping and handling</td>
                        <th>$10.00</th>
                      </tr>
                      <tr>
                        <td>Tax</td>
                        <th>$0.00</th>
                      </tr>
                      <tr class="total">
                        <td>Total</td>
                        <th>$456.00</th>
                      </tr>
                    </tbody>
                  </table>
                </div>
              </div>
              
            </div>
            
            
            
            <!-- /.col-md-3-->
          </div>
        </div>
      </div>
    </div>


    <!-- include footer -->
    <%@include file="../../frontend/home/home_footer.jsp" %>
	
	<script type="text/javascript">
		function change(i){
			var total = $("#q"+i).val()*$("#p"+i).val();
			$("#s"+i).html("$"+total);
			
		}
	</script>
  </body>
</html>