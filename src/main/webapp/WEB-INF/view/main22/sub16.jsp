<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<c:if test="${not empty message}">
    <div style="background-color: indianred">${message}</div>
</c:if>
<form action="/main22/sub17" method="post">
    <div>
        id
        <input type="text" name="id">
    </div>
    <div>
        pw
        <input type="password" name="pw">
    </div>
    <div>
        <input type="submit" name="로그인">
    </div>
</form>
</body>
</html>
