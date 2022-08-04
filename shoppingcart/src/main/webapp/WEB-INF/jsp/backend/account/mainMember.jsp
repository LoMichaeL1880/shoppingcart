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
<br><br/>

<p>
會員編號:<input type="text" id="mid" value="4"/><p/>
會員帳號:<input type="text" id="account" value="Peter@gmail.com"/>(修改及刪除時，此欄位必填)<p/>
會員密碼:<input type="text" id="password" value="1111"/><p/>
姓   名:<input type="text" id="mname" value="Peter Wang"/><p/>
地   址:<input type="text" id="address" value="Taipei District"/><p/>
電   話:<input type="text" id="phone" value="0228123456"/><p/>
郵件信箱:<input type="text" id="email" value="Peter@gmail.com"/><p/>
會員權限:<input type="text" id="role" value="1"/><p/>
建立日期:<input type="text" id="createdate" value="2022-08-02"/><p/>
<br><br/>
<div id="div1"></div>
<script type="text/javascript">
		function show()
		{
			var mobj = new Object();
    		mobj.mid = $("#mid").val();
    		mobj.account = $("#account").val();
    		mobj.password = $("#password").val();
    		mobj.mname = $("#mname").val();
    		mobj.address = $("#address").val();
    		mobj.phone = $("#phone").val();
    		mobj.email= $("#email").val();
    		mobj.role = $("#role").val();
    		mobj.createdate = $("#createdate").val();
		
		var str = JSON.stringify(mobj);
		alert(str);
		
		}

          function add(){
        	  var mobj = new Object();
        		mobj.mid = $("#mid").val();
        		mobj.account = $("#account").val();
        		mobj.password = $("#password").val();
        		mobj.mname = $("#mname").val();
        		mobj.address = $("#address").val();
        		mobj.phone = $("#phone").val();
        		mobj.email= $("#email").val();
        		mobj.role = $("#role").val();
        		mobj.createdate = $("#createdate").val();
        		var str = JSON.stringify(mobj);
        		alert(str);
        	  $.ajax({					
	 				type:"post",
	 				url : "addNewMember",
	 				data:str,
	 				contentType:"application/json",  // 要送到server的資料型態				
	 				dataType:"html" ,   // 預期從server接收的資料型態				
	 				success: function (data, status) {
	 			        $("#div1").html(data);			        
	 			    },
	 			    error : function (data, status, errormsg) {
	 			        $("#div1").html(errormsg);			        
	 			    }
	 			});         	
          }

          function update(){
        	  var mobj = new Object();
        		mobj.mid = $("#mid").val();
        		mobj.account = $("#account").val();
        		mobj.password = $("#password").val();
        		mobj.mname = $("#mname").val();
        		mobj.address = $("#address").val();
        		mobj.phone = $("#telephone").val();
        		mobj.email= $("#email").val();
        		mobj.role = $("#role").val();
        		mobj.createdate = $("#createdate").val();
        		var stt = JSON.stringify(mobj);
        		alert(stt);
        	  $.ajax({					
	 				type:"post",
	 				url : "updateExistMember",
	 				data:stt,
	 				contentType:"application/json",  // 要送到server的資料型態				
	 				dataType:"html" ,   // 預期從server接收的資料型態				
	 				success: function (data, status) {
	 			        $("#div1").html(data);			        
	 			    },
	 			    error : function (data, status, errormsg) {
	 			        $("#div1").html(errormsg);			        
	 			    }
	 			});         	
          }
          
   
</script>
</body>
</html>
