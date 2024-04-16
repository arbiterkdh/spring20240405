<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<c:if test="${param.login eq 'fail'}">
    <div style="background-color: green">
        로그인에 실패했습니다.
    </div>
</c:if>
<form action="/main22/sub7" method="post">
    <div>
        아이디:
        <input type="text" name="id">
    </div>
    <div>
        비밀번호:
        <input type="password" name="password">
    </div>
    <div>
        <input type="submit" name="로그인">
    </div>
</form>

</body>
</html>
