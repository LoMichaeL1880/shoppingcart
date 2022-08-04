<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.time.LocalDateTime" 
		 import="java.time.format.DateTimeFormatter" %>
<%
	LocalDateTime d = LocalDateTime.now();
	DateTimeFormatter f = DateTimeFormatter.ofPattern("yyMMddhhmm");
	DateTimeFormatter f2 = DateTimeFormatter.ofPattern("yyyy/MM/dd hh:mm");
	String orderid = "order" + d.format(f);
	String orderdate = ""+d.format(f2);
%>
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
            
            <div id="basket" class="col-lg-12">
              <div class="box">
                
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
	                            <input onclick="change('${num}')" id="quantity${num }" type="number" value="${o.quantity }" min="0" class="form-control">
	                          </td>
	                          <td>$${o.price }</td>
	                          <input type="hidden" value="${o.price }" id="price${num }">
	                          <td>$0.00</td>
	                          <td id="sum${num }">$${o.price*o.quantity }</td>
	                          <c:set var="total" value="${total + o.price*o.quantity }"/>
	                          <td><a href="#"><i class="fa fa-trash-o"></i></a></td>
	                        </tr>
	                        
	                        <input type="hidden" id="pid${num }" value="${o.product.pid }">
	                        
                        </c:forEach>
                        <input type="hidden" id="ordersize" value="${num}">
                      </tbody>
                      <tfoot>
                        <tr>
                          <th colspan="5">Total</th>
                          <th colspan="2" id="total">$${total }</th>
                          <input typ="hidden" id="totalsum" value="${total }">
                        </tr>
                      </tfoot>
                    </table>
                  </div>
                  
                  
                  
                  <!-- /.table-responsive-->
                  <div class="box-footer d-flex justify-content-between flex-column flex-lg-row">
                    <div class="left"><a href="category" class="btn btn-outline-secondary"><i class="fa fa-chevron-left"></i> Continue shopping</a></div>
                    <div class="right">
                      <form method="post" action="checkout1">
                      	<input type="hidden" id="sendorder" name="sendorder">
                      	<button type="submit" onclick="return send()" class="btn btn-primary">Proceed to pay<i class="fa fa-chevron-right"></i></button>
                      </form>	
                    </div>
                  </div>
                
              </div>
              <!-- /.box-->
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
			var sum = $("#quantity"+i).val() * $("#price"+i).val();
			$("#sum"+i).html("$"+sum);
			
		}
		
		function send(){
			var size = $("#ordersize").val();
			var ordertmp = [];
			for(var i=1; i<=size; i++){
				var obj = new Object();
				obj.orderid = "<%=orderid%>";
				obj.pid = $("#pid"+i).val();
				obj.quantity = $("#quantity"+i).val();
				obj.price = $("#price"+i).val();
				obj.total = $("#totalsum").val();
				obj.orderdate = "<%=orderdate%>";
				ordertmp.push(obj);
			}
			var data = JSON.stringify(ordertmp)
			$("#sendorder").val(data);
			return true;
		}
	</script>
  </body>
</html>