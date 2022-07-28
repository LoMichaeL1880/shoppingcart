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
			<div>產品代號<input type="text"  id="pid" value="10"></div>
			<div>產品名稱<input type="text"  id="pname" value="dring"></div>
			<div>產品價格<input type="text"  id="pprice" value="14000"></div>
			<div>產品尺寸<input type="text"  id="psize" value="m"></div>
			<div>產品顏色<input type="text"  id="pcolor" value="yellow"></div>
			<div>產品存量<input type="text"  id="pstock" value="10"></div>
			<div>產品介紹<input type="text"  id="pintroduction" value="yellow diamand ring"></div>
			<div>產品規格<input type="text"  id="pspecification" value="regular"></div>
			<div>產品數量<input type="text"  id="pamount" value="10"></div>
			<div>產品類別<input type="text"  id="category" value="ring"></div>
			<form id="pictureform" >	
				<div>產品圖片<input type="file" id="file" accept="image/gif, image/jpeg, image/png" name="file" ></div>
				<div>
					<image alt="" id="picturearea">
					<input type="submit" value="上傳圖片">
					<input type="hidden" id="picuturepath">				
				</div>		
			</form>	
			<div><button  id="send">新增</button></div>
			<div><button onclick="show()">TEST</button></div>
			<div id="test"></div>
			
		</div>
<script type="text/javascript">
function show()
{
	var sobj = new Object();
	sobj.pid = document.getElementById("pid").value;
	sobj.pname = document.getElementById("pname").value;
	sobj.pprice = document.getElementById("pprice").value;
	sobj.size = document.getElementById("psize").value;
	sobj.pcolor = document.getElementById("pcolor").value;
	sobj.pstock = document.getElementById("pstock").value;
	sobj.pintroduction = document.getElementById("pintroduction").value;
	sobj.pspecification = document.getElementById("pspecification").value;
	sobj.pamount = document.getElementById("pamount").value;
	sobj.category = document.getElementById("category").value;
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
				//$("#picturearea").attr("src",data);
				//$("#picturepath").val(data);
				$("#test").html(data);
			},
			error : function(data) {
				alert(data.exception);
			}
		});
	});


	
	$("#send").click(function(e){
		e.preventDefault();
		var obj = new Object();
		obj.pid = document.getElementById("pid").value;
		obj.pname = document.getElementById("pname").value;
		obj.pprice = document.getElementById("pprice").value;
		obj.size = document.getElementById("psize").value;
		obj.pcolor = document.getElementById("pcolor").value;
		obj.pstock = document.getElementById("pstock").value;
		obj.pintroduction = document.getElementById("pintroduction").value;
		obj.pspecification = document.getElementById("pspecification").value;
		obj.pamount = document.getElementById("pamount").value;
		obj.ppicpath = document.getElementById("ppicpath").value;
		var st = JSON.stringify(obj);
		
		$.ajax({
			type:"post",
			url:"add",
			data:st,
			contentType:"application/json",
			success:function(data,status){
				alert(data);			
			}
		});
	});
});

</script>
	</body>
</html>