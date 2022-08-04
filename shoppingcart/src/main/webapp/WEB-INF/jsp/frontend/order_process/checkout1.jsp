<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
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
          
            
            
            <div id="checkout" class="col-lg-12">
              <div class="box">
              
              
                
                  <h1>Checkout - Address</h1>
                  
                  
                  <div class="content py-3">
                    <div class="row">
                      <div class="col-md-12">
                        <div class="form-group">
                          <label for="name">Name</label>
                          <input id="name" type="text" class="form-control" value="${member.mname }">
                        </div>
                      </div>
                    </div>
                    <!-- /.row-->
                    <div class="row">
                      <div class="col-md-12">
                        <div class="form-group">
                          <label for="address">Address</label>
                          <input id="address" type="text" class="form-control" value="${member.address }">
                        </div>
                      </div>
                    </div>
                    <!-- /.row-->
                    <div class="row">
                      <div class="col-md-6">
                        <div class="form-group">
                          <label for="phone">Telephone</label>
                          <input id="phone" type="text" class="form-control" value="${member.phone }">
                        </div>
                      </div>
                      <div class="col-md-6">
                        <div class="form-group">
                          <label for="email">Email</label>
                          <input id="email" type="text" class="form-control" value="${member.email }">
                        </div>
                      </div>
                    </div>
                    <!-- /.row-->
                  </div>
                  
                <form method="post" action="checkout4">
                  
                  <div class="box-footer d-flex justify-content-between">
                  	<a href="basket" class="btn btn-outline-secondary"><i class="fa fa-chevron-left"></i>Back to Basket</a>
                    <input type="hidden" id="sendmember" name="sendmember">
                    <button type="submit" onclick="return send()" class="btn btn-primary">Continue to Complete<i class="fa fa-chevron-right"></i></button>
                  </div>
                  
                  
                </form>
              </div>
              <!-- /.box-->
            </div>
            
            <!-- /.col-lg-3-->
          </div>
        </div>
      </div>
    </div>


    <!-- include footer -->
    <%@include file="../../frontend/home/home_footer.jsp" %>
    
    <script type="text/javascript">
    	function send(){
    		var obj = new Object();
    		obj.mname = $("#name").val();
    		obj.address = $("#address").val();
    		obj.phone = $("#phone").val();
    		obj.email = $("#email").val();
    		var str = JSON.stringify(obj);
    		$("#sendmember").val(str);
    		return true;
    	}
    </script>
  </body>
</html>