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
			<h2 align="center">������ƭק�</h2>
			<hr>
			<div class="container">
				<div class="form-group">
					<label for="usr">Banner ID :</label>
					<input type="text" class="form-control" id="picid" name="picid" value="${objBanner.picid }" disabled>
				</div>
				<div class="form-group">
					<label for="usr">Banner �W�� :</label>
					<input type="text" class="form-control" id="picname" name="picname" value="${objBanner.picname }">
				</div>
				<div class="form-group">
					<label for="usr">�s�����}(���) :</label>
					<input type="text" class="form-control" id="hyperlink" name="hyperlink" value="${objBanner.hyperlink }">
				</div>
				
				<!-- �W�ǹϤ� -->
				<div class="row">
					<!-- ����ɮ� -->
					<div class="col-md-8">
						<form id="myForm">
							<div class="form-group">
								<label for="usr">��ܹ��� :</label>
								<div class="input-group mb-3">
									<div class="input-group-prepend">
										<input type="file" id="file" class="form-control-file" name="file" accept="image/gif, image/jpeg, image/png">
									</div>
									<input type="submit" value="�W�ǹ���">
								</div>
							</div>
						</form>
					</div>
					<!-- �Ϥ��w�� -->
					<div class="col-md-4">
						<div style="border:1px solid black">
							<img class="small-banner" alt="" id="picarea" src="${objBanner.path }" />
							<input type="hidden" id="picpath" value="">
						</div>
					</div>
				</div>
				
				<div id="msg"></div>
				
				<!-- ��ưe�X -->
				<button class="btn btn-primary" id="send">�s�W</button>
				<button class="btn btn-primary" id="back">�^�W�@��</button>
				
			</div>
		</div>
		
		<script type="text/javascript">			
			$(document).ready(function(){
				// �Ϥ��W�Ǥιw��
				$("#myForm").submit(function(e) {
					e.preventDefault(); // ����Ĳ�osubmit
					console.log("upload");
					var formData = new FormData($("#myForm")[0]); // �ϥ�FormData�]��form����Ӷǿ���
					$.ajax({
						type : "POST",
						url : "uploadpic",
						data : formData,
						cache : false, // ���ݭncache
						processData : false, // jQuery�w�]�|��data�ରquery String, �ҥH�n����
						contentType : false, // jQuery�w�]contentType��'application/x-www-form-urlencoded; charset=UTF-8', �B���Φۤv�]�w��'multipart/form-data'
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