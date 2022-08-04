<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<!DOCTYPE html>
<html>
  <head>
    <%@include file="../frontend/home/home_head.jsp" %>
  </head>
  <body>
    <!-- navbar -->
	<% if(session.getAttribute("login") != null){ %>
		<%@include file="../frontend/home/navbar_login.jsp" %>
	<% } else { %>
		<%@include file="../frontend/home/navbar.jsp" %>
	<% } %>
    
    <!-- 會員 -->
    <div id="all">
      <div id="content">
        <div class="container">
          <div class="row">
            <div class="col-lg-12">
              <!-- breadcrumb-->
              <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="index">Home</a></li>
                  <li aria-current="page" class="breadcrumb-item active">My account</li>
                </ol>
              </nav>
            </div>
            <div class="col-lg-3">
              <!--
              *** CUSTOMER MENU ***
              _________________________________________________________
              -->
              <%@include file="customerasidemenu.jsp" %>
              
              
              <!-- /.col-lg-3-->
              <!-- *** CUSTOMER MENU END ***-->
            </div>
            
            
            <div class="col-lg-9">
              <div class="box">
                <h1>My account</h1>
                <p class="lead">Change your personal details or your password here.</p>
                <p class="text-muted">Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.</p>
                
                <!-- 改密碼 -->
                <h3>Change password</h3>
                
                <div class="row">
                  <div class="col-md-6">
                    <div class="form-group">
                      <label for="password_old">Old password</label>
                      <input id="password_old" type="password" value="${member.password }" class="form-control" required>
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="col-md-6">
                    <div class="form-group">
                      <label for="password_1">New password</label>
                      <input id="password_1" type="password" class="form-control" required>
                    </div>
                  </div>
                  <div class="col-md-6">
                    <div class="form-group">
                      <label for="password_2">Retype new password</label>
                      <input id="password_2" type="password" class="form-control" required>
                    </div>
                  </div>
                </div>
                <!-- /.row-->
                
                <form>
	                <div class="col-md-12 text-center">
	                  <input type="hidden" id="pssschange" name="pssschange" value="">
	                  <button type="submit" class="btn btn-primary" onclick="changepass()">
	                  	<i class="fa fa-save"></i> Save new password
	                  </button>
	                </div>
                </form>
                
                
                <!-- 查看及更改個人資料 -->
                <h3 class="mt-5">Personal details</h3>
                <div class="row">
                  <div class="col-md-12">
                    <div class="form-group">
                      <label for="name">Name</label>
                      <input id="name" type="text" value="${member.mname }" class="form-control">
                    </div>
                  </div>
                 
                </div>
                <!-- /.row-->
                <div class="row">
                  <div class="col-md-12">
                    <div class="form-group">
                      <label for="address">Address</label>
                      <input id="address" type="text" value="${member.address }" class="form-control">
                    </div>
                  </div>
                  
                </div>
                <!-- /.row-->
                <div class="row">
                  
                  <div class="col-md-6">
                    <div class="form-group">
                      <label for="phone">Telephone</label>
                      <input id="phone" type="text" value="${member.phone }" class="form-control">
                    </div>
                  </div>
                  <div class="col-md-6">
                    <div class="form-group">
                      <label for="email">Email</label>
                      <input id="email" type="text" value="${member.email }" class="form-control">
                    </div>
                  </div>
                  <div class="col-md-12 text-center">
                    <button type="submit" class="btn btn-primary" id="updatemem"><i class="fa fa-save"></i> Save changes</button>
                  </div>
                </div>
                
                
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

  <!-- include footer -->
  <%@include file="../frontend/home/home_footer.jsp" %>
  
  <script type="text/javascript">
  	function changepass(){
  		var oldpass = $("#password_old").val();
  		var newpass1 = $("#password_1").val();
  		var newpass2 = $("#password_1").val();
  		if(newpass1 != newpass2){
  			alert("新密碼輸入不一致");
  		}
  		var str = {"oldpass":oldpass , "newpass":newpass1};
  		$.ajax({
  			type:"post",
  			url:"",
  			data:str,
  			contextType:"application/json",
  			success:function(data,status){
  				alert(data);
  			}
  		});
  	}
  	
  	$("#updatemem").click(function(){
  		var obj = new Object();
  		obj.mname = $("#name").val();
  		obj.address = $("#address").val();
  		obj.phone = $("#phone").val();
  		obj.email = $("#email").val();
  		var str = JSON.stringify(obj);
  		$.ajax({
  			type:"post",
  			url:"updatecustomer",
  			data:str,
  			contentType:"application/json",
  			success:function(data,status){
  				alert("data");  				
  			}
  		});
  	});
  </script>
  
  </body>
</html>