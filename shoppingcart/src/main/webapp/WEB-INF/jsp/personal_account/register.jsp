<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<%@ page import="java.time.LocalDateTime" 
		 import="java.time.format.DateTimeFormatter" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	LocalDateTime d = LocalDateTime.now();
	DateTimeFormatter f = DateTimeFormatter.ofPattern("yyMMddhhmm");
	String mid = "Mem" + d.format(f);
%>
<!DOCTYPE html>
<html>
  <head>
	<%@include file="../frontend/home/home_head.jsp" %>
  </head>
  <body>
    <!-- navbar -->
    <%@include file="../frontend/home/navbar.jsp" %>
    
    <!-- 註冊畫面 -->
    <div id="all">
      <div id="content">
        <div class="container">
          <div class="row">
          
          
            <div class="col-lg-12">
              <!-- breadcrumb-->
              <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="index">Home</a></li>
                  <li aria-current="page" class="breadcrumb-item active">New account / Sign in</li>
                </ol>
              </nav>
            </div>
            
            <!-- 註冊 -->
            <div class="col-lg-6">
              <div class="box">
                <h1>New account</h1>
                <p class="lead">Not our registered customer yet?</p>
                
                <hr>
                <div class="form-group">
                  <label for="name">Name</label>
                  <input id="name" type="text" class="form-control">
                </div>
                <div class="form-group">
                  <label for="email">Email</label>
                  <input id="email" type="text" class="form-control">
                </div>
                <div class="form-group">
                  <label for="password">Password</label>
                  <input id="password" type="password" class="form-control">
                </div>                
                <input type="hidden" id="mid" value="<%=mid %>">
                  
                <form id="registeraction" action="register_2" method="post">
                  <input type="hidden" id="registerobj" name="registerobj" value="">
                  <div class="text-center">
                    <button type="submit" class="btn btn-primary" onclick="return register()">
                      <i class="fa fa-user-md"></i> Register
                    </button>
                  </div>
                </form>
                
                
              </div>
            </div>
            
            <!-- 登入 -->
            <div class="col-lg-6">
              <div class="box">
                <h1>Login</h1>
                <p class="lead">Already our customer?</p>
                
                <hr>
                
                <div class="form-group">
                  <label for="checkemail">Email</label>
                  <input id="checkemail" type="text" class="form-control">
                </div>
                <div class="form-group">
                  <label for="checkpassword">Password</label>
                  <input id="checkpassword" type="password" class="form-control">
                </div>
                <input type="hidden" id="mid" value="<%=mid %>">
                
                
                <form action="logincheck" method="post">
				  <input type="hidden" id="checkmemobj" name="checkmemobj" value="">
                  <div class="text-center">
                    <button type="submit" class="btn btn-primary" onclick="return check()">
                      <i class="fa fa-sign-in"></i> Log in
                    </button>
                  </div>
                </form>
                
                
              </div>
            </div>
            
            
          </div>
        </div>
      </div>
    </div>
    
    <!-- include footer -->
    <%@include file="../frontend/home/home_footer.jsp" %>
    
    <script type="text/javascript">
    	function register(){
    		var obj = new Object();
    		obj.mid = $("#mid").val();
    		obj.account = $("#email").val();
    		obj.email = $("#email").val();
    		obj.mname = $("#name").val();
    		obj.password = $("#password").val();
    		obj.role = "customer";
    		var str = JSON.stringify(obj);
    		$("#registerobj").val(str);
    		alert("帳號新增成功");
    		return true;
    	}
    	
    	function check(){
    		var obj = new Object();
    		obj.email = $("#checkemail").val();
    		obj.password = $("#checkpassword").val();
    		var str = JSON.stringify(obj);
    		$("#checkmemobj").val(str);
    		return true;
    	}
    </script>
  </body>
</html>