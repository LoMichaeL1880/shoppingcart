<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>Insert title here</title>
</head>
<body>
<h1>Here is banner</h1>
<table>
	<c:forEach var="pic" items="${bannerList}">
		<h3><c:out value=" ${pic.picname}"/></h3><br>
	</c:forEach>
</table>
</body>
</html>