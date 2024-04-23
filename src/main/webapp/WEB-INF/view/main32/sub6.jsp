<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h3>직원 조회 및 수정</h3>
<form action="">
    번호
    <input type="number" name="id">
    <button>조회</button>
</form>
<hr>
<c:if test="${empty employee}">
    조회된 직원이 없습니다.
</c:if>
<c:if test="${not empty employee}">
    <form action="/main32/sub6/main30/sub1/update" method="post">
        <div>
            lastName
            <input type="text" value="${employee.lastName}" name="lastName">
        </div>
        <div>
            <input type="text" value="${employee.firstName}" name="firstName">
        </div>
        <div>
            <input type="text" value="${employee.}" name="">
        </div>
        <div>
            <input type="text" value="${employee.}" name="">
        </div>
        <div>
            <input type="text" value="${employee.}" name="">
        </div>
        <div>
            <input type="text">
        </div>
    </form>
</c:if>

</body>
</html>
