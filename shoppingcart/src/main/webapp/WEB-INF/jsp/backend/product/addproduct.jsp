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
			<h2 align="center">�s�W���~</h2>
			<hr>
			
			<table id="table-1" class="table table-hover table-border">
				<tr>
					<td>���~�N��</td>
					<td><input type="text"  id="pid" value="10"></td>
					<td>���~�W��</td>
					<td><input type="text"  id="pname" value="dring"></td>
				</tr>
				<tr>
					<td>���~����</td>
					<td><input type="text"  id="pprice" value="14000"></td>
					<td>���~�ؤo</td>
					<td><input type="text"  id="psize" value="m"></td>
				</tr>
					<tr>
					<td>���~�C��</td>
					<td><input type="text"  id="pcolor" value="yellow"></td>
					<td>���~�s�q</td>
					<td><input type="text"  id="pstock" value="10"></td>
				</tr>
					<tr>
					<td>���~����</td>
					<td><input type="text"  id="pintroduction" value="yellow diamand ring"></td>
					<td>���~�W��</td>
					<td><input type="text"  id="pspecification" value="regular"></td>
				</tr>
					<tr>
					<td>���~�ƶq</td>
					<td><input type="text"  id="pamount" value="10"></td>
					<td>���~���O</td>
					<td><input type="text"  id="category" value="ring"></td>
				</tr>
				
				<tr>		
					<form id="pictureform" action="">	
						<td>���~�Ϥ�</td>
						<td ><input type="file" id="ppicpath" accept="image/gif, image/jpeg, image/png" name="file" ></td>
						<td><image alt="" id="picturearea"></td>
						<td>
								<input type="hidden" id="picuturepath">
								<input type="submit" value="�W�ǹϤ�">
						</td>		
				
					</form>	
							
				</tr>
					
				<tr>
					<td colspan=4 align="center"><button  id="send">�s�W</button></td>
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
		e.preventDefault(); // ����Ĳ�osubmit
		console.log("upload");
		var formData = new FormData($("#pictureform")[0]); // �ϥ�FormData�]��form���Ӷǿ���
		$.ajax({
			type : "POST",
			url : "uploadpicture",
			data : formData,
			cache : false, // ���ݭncache
			processData : false, // jQuery�w�]�|��data�ରquery String, �ҥH�n����
			contentType : false, // jQuery�w�]contentType��'application/x-www-form-urlencoded; charset=UTF-8', �B���Φۤv�]�w��'multipart/form-data'
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