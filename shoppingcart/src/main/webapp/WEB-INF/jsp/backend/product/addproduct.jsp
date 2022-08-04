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
			
			<table id="table-1" class="table table-hover table-border">
				<tr>
					<td>產品代號</td>
					<td><input type="text"  id="pid" value="10"></td>
					<td>產品名稱</td>
					<td><input type="text"  id="pname" value="dring"></td>
				</tr>
				<tr>
					<td>產品價格</td>
					<td><input type="text"  id="pprice" value="14000"></td>
					<td>產品尺寸</td>
					<td><input type="text"  id="psize" value="m"></td>
				</tr>
					<tr>
					<td>產品顏色</td>
					<td><input type="text"  id="pcolor" value="yellow"></td>
					<td>產品存量</td>
					<td><input type="text"  id="pstock" value="10"></td>
				</tr>
					<tr>
					<td>產品介紹</td>
					<td><input type="text"  id="pintroduction" value="yellow diamand ring"></td>
					<td>產品規格</td>
					<td><input type="text"  id="pspecification" value="regular"></td>
				</tr>
					<tr>
					<td>產品數量</td>
					<td><input type="text"  id="pamount" value="10"></td>
					<td>產品類別</td>
					<td><input type="text"  id="category" value="ring"></td>
				</tr>
				
				<tr>		
					<form id="pictureform" action="">	
						<td>產品圖片</td>
						<td ><input type="file" id="ppicpath" accept="image/gif, image/jpeg, image/png" name="file" ></td>
						<td><image alt="" id="picturearea"></td>
						<td>
								<input type="hidden" id="picuturepath">
								<input type="submit" value="上傳圖片">
						</td>		
				
					</form>	
							
				</tr>
					
				<tr>
					<td colspan=4 align="center"><button  id="send">新增</button></td>
				</tr>
				<tr>
					<td colspan=4 align="center"><button onclick="show()">TEST</button></td>
				</tr>
			</table>
			
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
				$("#picturearea").attr("src",data);
				$("#picturepath").val(data);
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