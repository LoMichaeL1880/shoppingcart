<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="BIG5">
		<title>Insert title here</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	</head>
	<body>
		<div class="container">
			<h2 align="center">新增產品</h2>
			<hr>
			<div>產品代號<input type="text"  id="pid" value="${objProduct.pid }"><button  type="button" id="check">檢查是否重複</button></div>
			<div>產品名稱<input type="text"  id="pname" value="${objProduct.pname }"></div>
			<div>產品價格<input type="text"  id="pprice" value="${objProduct.pprice }"></div>
			<div>產品尺寸<input type="text"  id="psize" value="${objProduct.psize }"></div>
			<div>產品顏色<input type="text"  id="pcolor" value="${objProduct.pcolor }"></div>
			<div>產品存量<input type="text"  id="pstock" value="${objProduct.pstock }"></div>
			<div>產品介紹<input type="text"  id="pintroduction" value=""${objProduct.pintroduction }"></div>
			<div>產品規格<input type="text"  id="pspecification" value="${objProduct.pspecification }"></div>
			<div>產品數量<input type="text"  id="pamount" value="${objProduct.pamount }"></div>
			<div>產品類別<input type="text"  id="categorycode" value="${objProduct.category.id }"></div>
			<div>產品類別<input type="text"  id="categorytype" value="${product.category.name }"></div>			
			<form id="pictureform" >	
				<div>產品圖片<input type="file" id="${objProduct.ppicpath }" accept="image/gif, image/jpeg, image/png" name="file" ></div>
				<div>
					<image alt="" id="picturearea" height=100 width=150 src="">
					<input type="submit" value="上傳圖片">
					<input type="hidden" id="picuturepath">				
				</div>		
			</form>	
			<div><button  type="submit" id="send" hide>修改</button></div>
			<div><button onclick="show()">TEST</button></div>
			<div id="test"></div>
			
		</div>
<script type="text/javascript">
function show()
{
	var categoryObj = new Object();
	categoryObj.id=document.getElementById("categorycode").value;
	categoryObj.name=document.getElementById("categorytype").value;
	var sobj = new Object();
	sobj.pid = document.getElementById("pid").value;
	sobj.pname = document.getElementById("pname").value;
	sobj.pprice = document.getElementById("pprice").value;
	sobj.psize = document.getElementById("psize").value;
	sobj.pcolor = document.getElementById("pcolor").value;
	sobj.pstock = document.getElementById("pstock").value;
	sobj.pintroduction = document.getElementById("pintroduction").value;
	sobj.pspecification = document.getElementById("pspecification").value;
	sobj.pamount = document.getElementById("pamount").value;
	sobj.category = categoryObj;
	sobj.ppicpath = document.getElementById("ppicpath").value;
	var stt = JSON.stringify(sobj);
	alert(stt);
}
</script>
<script>
$(document).ready(function(){
	$("#pictureform").submit(function(e) {
		e.preventDefault(); // 停止觸發submit
		console.log("upload");
		var formData = new FormData($("#pictureform")[0]); // 使用FormData包裝form表單來傳輸資料
		$.ajax({
			type : "POST",
			url : "uploadpicture",
			data : formData,
			cache : false, // 不需要cache
			processData : false, // jQuery預設會把data轉為query String, 所以要停用
			contentType : false, // jQuery預設contentType為'application/x-www-form-urlencoded; charset=UTF-8', 且不用自己設定為'multipart/form-data'
			//dataType: 'text',
			success : function(data) {
				$("#picturearea").attr("src",data);
				$("#picturepath").val(data);
				//$("#test").html(data);
			},
			error : function(data) {
				alert(data.exception);
			}
		});
	});


	
	$("#send").click(function(e){
		e.preventDefault();
		var cobj=new Object();
		cobj.id=document.getElementById("categorycode").value;
		cobj.name=document.getElementById("categorytype").value;
		var obj = new Object();
		obj.pid = document.getElementById("pid").value;
		obj.pname = document.getElementById("pname").value;
		obj.pprice = document.getElementById("pprice").value;
		obj.psize = document.getElementById("psize").value;
		obj.pcolor = document.getElementById("pcolor").value;
		obj.pstock = document.getElementById("pstock").value;
		obj.pintroduction = document.getElementById("pintroduction").value;
		obj.pspecification = document.getElementById("pspecification").value;
		obj.pamount = document.getElementById("pamount").value;
		obj.category =cobj;
		obj.ppicpath = document.getElementById("ppicpath").value;
		var st = JSON.stringify(obj);
		
		$.ajax({
			type:"post",
			url:"updated",
			data:st,
			contentType:"application/json",
			success:function(data,status){
				alert(data);			
			}
		});
	});
});

</script>
<script>
	$("#check").click(function(e)
	{
		e.preventDefault();
		
			var id = document.getElementById("pid").value;
			
			$.ajax({
		        url  : "checkId",
		        type : 'POST',
		        dataType : 'HTML',
		        data : id,
		        success: function(data, stutus) {
		          if(res=='1') {
		            alert('ID重複，請輸入其他ID');
		          } else {
		        	alert('ID可使用');
		          }
		        }
		      });

			
		}
	}
</script>
	</body>
</html>