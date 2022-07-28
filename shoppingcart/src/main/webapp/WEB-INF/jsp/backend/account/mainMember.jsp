<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta HTTP-EQUIV="pragma" CONTENT="no-cache"> 
<meta charset="UTF-8">
<title>Member Main</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<h1>Member Main Page</h1>

<button onclick="add()">新增</button>
<button onclick="update()">修改</button>
<button onclick="delete()">刪除</button>
<br/>

<p>
會員帳號:<input type="text" id="account" value="John@gmail.com"/><p/>
會員密碼:<input type="text" id="password" value="123"/><p/>

<div id="div1">Show Message</div>
<script>
          function result(data){
        	  alert(data);
          }
       	  function deleteMember(){
        	  var obj=new Object();
        	  obj.account=$("#account").val();        	  
        	  $.post("backend/delete",obj,result);
          }
          /*function updateMember(){
        	  var obj=new Object();
        	  obj.account=$("#account").val();
        	  obj.password=$("#password").val();
        	  $.post("backend/update",obj,result);
          }*/
          function add(){
        	  var obj=new Object();
        	  obj.account=$("#account").val();
        	  obj.password=$("#password").val();
        	  var st=JSON.stringify(obj);
        	  
        	  $.ajax({					
	 				type:"post",
	 				url : "add",
	 				data: st,
	 				contentType:"application/json",  // 要送到server的資料型態				
	 				dataType:"html" ,   // 預期從server接收的資料型態				
	 				success: result ,
	 			    error : function (data, status, errormsg) {
	 			        $("#display").html(errormsg);			        
	 			    }
	 			});         	
          }

   
</script>
</body>
</html>
