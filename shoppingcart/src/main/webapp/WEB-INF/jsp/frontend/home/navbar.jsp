<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>Insert title here</title>
</head>
<body>
    <!-- navbar-->
    <header class="header mb-5">
        <!--
        *** TOPBAR ***
        _________________________________________________________
        -->
        <div id="top">
          <!-- 黑色表頭 -->
          <div class="container">
            <div class="row">
              <div class="col-lg-6 offer mb-3 mb-lg-0"><a href="http://10.10.1.74:8080/shoppingcart/backend/home" class="btn btn-success btn-sm">BACKEND</a></div>
              <div class="col-lg-6 text-center text-lg-right">
                <ul class="menu list-inline mb-0">
                  <li class="list-inline-item"><a href="#" data-toggle="modal" data-target="#login-modal">Login</a></li>
                  <li class="list-inline-item"><a href="registerpage">Register</a></li>
                </ul>
              </div>
            </div>
          </div>
          
          <!-- login 的彈出視窗，直接登入用 -->
          <div id="login-modal" tabindex="-1" role="dialog" aria-labelledby="Login" aria-hidden="true" class="modal fade">
            <div class="modal-dialog modal-sm">
              <div class="modal-content">
              	<!-- 標題 -->
                <div class="modal-header">
                  <h5 class="modal-title">Customer login</h5>
                  <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span aria-hidden="true">Ã</span></button>
                </div>
                
                <div class="modal-body">
                  <!-- 登入表單 -->
                  <div class="form-group">
                    <input id="email-modal" type="text" placeholder="email" class="form-control">
                  </div>
                  <div class="form-group">
                    <input id="password-modal" type="password" placeholder="password" class="form-control">
                  </div>
                  
                  <form action="logincheck" method="post">
                  	<input type="hidden" id="checkmemobj" name="checkmemobj" value="">
                    <p class="text-center">
                      <button class="btn btn-primary" onclick="return check()"><i class="fa fa-sign-in"></i> Log in</button>
                    </p>
                  </form>
                  
                  <p class="text-center text-muted">Not registered yet?</p>
                  
                  <!-- 轉到註冊頁面 -->
                  <p class="text-center text-muted"><a href="registerpage"><strong>Register now</strong></a>! It is easy and done in 1Â minute and gives you access to special discounts and much more!</p>
                
                </div>
                
              </div>
            </div>
          </div>
          <!-- *** TOP BAR END ***-->
          
          
        </div>
        <nav class="navbar navbar-expand-lg">
          <div class="container"><a href="http://10.10.1.74:8080/shoppingcart/shopping/index" class="navbar-brand home"><img src="../img/logo.png" alt="Obaju logo" class="d-none d-md-inline-block"><img src="../img/logo-small.png" alt="Obaju logo" class="d-inline-block d-md-none"><span class="sr-only">Obaju - go to homepage</span></a>
            
            <div class="navbar-buttons">
              <button type="button" data-toggle="collapse" data-target="#navigation" class="btn btn-outline-secondary navbar-toggler"><span class="sr-only">Toggle navigation</span><i class="fa fa-align-justify"></i></button>
              <button type="button" data-toggle="collapse" data-target="#search" class="btn btn-outline-secondary navbar-toggler"><span class="sr-only">Toggle search</span><i class="fa fa-search"></i></button><a href="basket.html" class="btn btn-outline-secondary navbar-toggler"><i class="fa fa-shopping-cart"></i></a>
            </div>
            
            <div id="navigation" class="collapse navbar-collapse">
              <ul class="navbar-nav mr-auto">
              
                <li class="nav-item"><a href="http://10.10.1.74:8080/shoppingcart/shopping/index" class="nav-link active">Home</a></li>
                
                <!-- 未完成 -->
                <li class="nav-item"><a href="category" class="nav-link" id="necklace">Necklace</a></li>
                <li class="nav-item"><a href="category" class="nav-link" id="bracelet">Bracelet</a></li>
                <li class="nav-item"><a href="category" class="nav-link" id="rings">Rings</a></li>
                <li class="nav-item"><a href="category" class="nav-link" id="earrings">Earrings</a></li>
                
              </ul>
              
              
              <!-- 靠右區塊 -->
              <div class="navbar-buttons d-flex justify-content-end">
              	
              </div>
              
            </div>
          </div>
        </nav>
        
      </header>
      
      <script type="text/javascript">
		function check(){
	  		var obj = new Object();
	  		obj.email = $("#email-modal").val();
	  		obj.password = $("#password-modal").val();
	  		var str = JSON.stringify(obj);
	  		$("#checkmemobj").val(str);
	  		return true;
		}
      </script>
</body>
</html>