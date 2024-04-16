<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<c:if test="${not empty message}">
    <div style="background-color: burlywood">${message}</div>
</c:if>
<div>
    <h1>메인 페이지</h1>
    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nam, repellat?</p>
</div>

</body>
</html>
