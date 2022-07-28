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
			<h2 align="center">輪播資料修改</h2>
			<hr>
			<div class="container">
				<div class="form-group">
					<label for="usr">Banner ID :</label>
					<input type="text" class="form-control" id="picid" name="picid" value="${objBanner.picid }" disabled>
				</div>
				<div class="form-group">
					<label for="usr">Banner 名稱 :</label>
					<input type="text" class="form-control" id="picname" name="picname" value="${objBanner.picname }">
				</div>
				<div class="form-group">
					<label for="usr">連結網址(選填) :</label>
					<input type="text" class="form-control" id="hyperlink" name="hyperlink" value="${objBanner.hyperlink }">
				</div>
				
				<!-- 上傳圖片 -->
				<div class="row">
					<!-- 選擇檔案 -->
					<div class="col-md-8">
						<form id="myForm">
							<div class="form-group">
								<label for="usr">選擇圖檔 :</label>
								<div class="input-group mb-3">
									<div class="input-group-prepend">
										<input type="file" id="file" class="form-control-file" name="file" accept="image/gif, image/jpeg, image/png">
									</div>
									<input type="submit" value="上傳圖檔">
								</div>
							</div>
						</form>
					</div>
					<!-- 圖片預覽 -->
					<div class="col-md-4">
						<div style="border:1px solid black">
							<img class="small-banner" alt="" id="picarea" src="${objBanner.path }" />
							<input type="hidden" id="picpath" value="">
						</div>
					</div>
				</div>
				
				<div id="msg"></div>
				
				<!-- 資料送出 -->
				<button class="btn btn-primary" id="send">新增</button>
				<button class="btn btn-primary" id="back">回上一頁</button>
				
			</div>
		</div>
		
		<script type="text/javascript">			
			$(document).ready(function(){
				// 圖片上傳及預覽
				$("#myForm").submit(function(e) {
					e.preventDefault(); // 停止觸發submit
					console.log("upload");
					var formData = new FormData($("#myForm")[0]); // 使用FormData包裝form表單來傳輸資料
					$.ajax({
						type : "POST",
						url : "uploadpic",
						data : formData,
						cache : false, // 不需要cache
						processData : false, // jQuery預設會把data轉為query String, 所以要停用
						contentType : false, // jQuery預設contentType為'application/x-www-form-urlencoded; charset=UTF-8', 且不用自己設定為'multipart/form-data'
						//dataType: 'text',
						success : function(data) {
							$("#picarea").attr("src",data);
							$("#picpath").val(data);
						},
						error : function(data) {
							alert(data.exception);
						}
					});
				});
				
				$("#send").click(function(e){
					e.preventDefault();
					
					var obj = new Object();
					obj.picid = $("#picid").val();
					obj.picname = $("#picname").val(); 
					obj.hyperlink = $("#hyperlink").val();
					obj.path = $("#picpath").val();
					
					var str = JSON.stringify(obj);
					
					$.ajax({
						type:"post",
						url:"updateOK",
						data:str,
						contentType:"application/json",
						success:function(data,status){
							alert(data);
							$(location).attr("href","http://localhost:8080/shoppingcart/backend/home");
						}
					});
				});
				
				$("#back").click(function(){
					$(location).attr("href","http://localhost:8080/shoppingcart/backend/home");
				});
				
			});
			
		</script>
	</body>
</html>