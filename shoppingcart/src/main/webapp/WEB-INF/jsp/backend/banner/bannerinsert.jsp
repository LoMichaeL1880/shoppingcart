<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<%@ page import="java.time.LocalDateTime" 
		 import="java.time.format.DateTimeFormatter" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%
	LocalDateTime d = LocalDateTime.now();
	DateTimeFormatter f = DateTimeFormatter.ofPattern("yyMMddhhmm");
	String pid = "p" + d.format(f);
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="BIG5">
		<title>Insert title here</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	</head>
	<body>
		<div class="container">
			<h2 align="center">�s�W���� Banner</h2>
			<hr>
			<div class="container">
				<div class="form-group">
					<label for="usr">Banner ID :</label>
					<input type="text" class="form-control" id="picid" name="picid" value="<%=pid %>" disabled>
				</div>
				<div class="form-group">
					<label for="usr">Banner �W�� :</label>
					<input type="text" class="form-control" id="picname" name="picname">
				</div>
				<div class="form-group">
					<label for="usr">�s�����}(���) :</label>
					<input type="text" class="form-control" id="hyperlink" name="hyperlink">
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
							<img class="small-banner" alt="" id="picarea" src="../img/main-slider1.jpg" />
							<input type="hidden" id="picpath" value="">
						</div>
					</div>
				</div>
				
				<div id="msg"></div>
				
				<!-- ��ưe�X -->
				<button class="btn btn-primary" id="send">�s�W</button>
				
			</div>
		</div>
		
		<script type="text/javascript">			
			//�Ϥ��W�Ǥιw��
			$("#myForm").submit(function(e){
				e.preventDefault(); // ����Ĳ�osubmit
				console.log("upload");
				var formData = new FormData($("#myForm")[0]); // �ϥ�FormData�]��form���Ӷǿ���
				$.ajax({
					type:"POST",
					url:"uploadpic",
					data:formData,
					cache:false, // ���ݭncache
					processData : false, // jQuery�w�]�|��data�ରquery String, �ҥH�n����
					contentType : false, // jQuery�w�]contentType��'application/x-www-form-urlencoded; charset=UTF-8', �B���Φۤv�]�w��'multipart/form-data'
					//dataType: 'text',
					success : function(data) {
						//$("#picarea").attr("src",data);
						//$("#picpath").html(data);
						$("#msg").html(data);
					}f
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
				
				$.ajax("insertOK",{
					type:"post",
					data:str,
					contentType:"application/json",
					success:function(data,status){
						alert(data);
					}
					error : function(data) {
						alert(data.exception);
					}
				});
			});
			
		</script>
	</body>
</html>