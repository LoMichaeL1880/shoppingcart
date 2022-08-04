<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"><head>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/bootpag.min.js"></script>
    <link rel="stylesheet" href="../css/bootstrap.min.css">
</head>
<title>Paging Member</title>
</head>
<body>
	<div class="member.container">Dynamic Content goes here</div>
    <div  class="content">Pagination goes here</div>
    
    <script>
	    var pics;
	    function showPage(){
		      $('#page-selection').bootpag({
			       total : 10
		       }).on("page", function(event, /* page number here */num) {
			          $("#content").html("Insert content page" + num); // some ajax content loading...
		       });
	    }
		function getPic(){
			 $.ajax("getPicture2",{					
        			type:"get",
        			dataType:"json" ,   // 預期從server接收的資料型態				
        			success: function (data, status) {
            			  pics=data;
        				  $('#picPage').bootpag({
        			            total: data.length
        			        }).on("page", function(event, num){
            			        $("#content").html("Page "+pics[num-1].path);
        			            // ... after content load -> change total to 10
        			            //$(this).bootpag({total: 10, maxVisible: 10});
        			         
        			        });   
        		    },
        		    error : function (data, status, errormsg) {
        		        $("#div1").html(errormsg);			        
        		    }
        		});
	    }
	</script>
</body>
</html>