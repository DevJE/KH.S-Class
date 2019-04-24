<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage='true'%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>first</title>
</head>
<body>
<h1>오류 발생!</h1>
<c:if test='${ not empty message }'>
	${ message }
</c:if>
<c:if test='${ empty message }'>
	<h2><%= exception.getMessage() %></h2>
</c:if>
<h2><a href='main.do'>시작페이지로 이동</a></h2>

</body>
</html>