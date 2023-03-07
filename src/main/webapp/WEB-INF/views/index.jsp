
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
wtf
<h1>${name}</h1>
<c:forEach var = "i" begin = "1" end = "5">
         Item <c:out value = "${i}"/><p>
     </c:forEach>
</body>
</html>