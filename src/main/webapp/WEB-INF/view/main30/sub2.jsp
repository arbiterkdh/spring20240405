<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<c:if test="${not empty message}">
    <div style="background-color: orange">${message}</div>
</c:if>
<h3>직원 정보 수정</h3>
<form action="">
    번호
    <input type="number" name="id">
    <button>조회</button>
</form>
<hr>

<form action="/main30/sub2/update" method="post">
    <c:if test="${empty employee}">직원 정보가 없습니다.</c:if>
    <c:if test="${not empty employee}">
    <input type="number" name="employeeId" value="${employee.employeeId}" hidden="hidden">
    <div>성
        <input type="text" name="lastName" value="${employee.lastName}">
    </div>
    <div>이름
        <input type="text" name="firstName" value="${employee.firstName}">
    </div>
    <div>생년월일
        <input type="date" name="birthDate" value="${employee.birthDate}">
    </div>
    <div>사진
        <input type="file" name="photo" value="${employee.photo}">
    </div>
    <div>메모
        <textarea cols="30" name="notes" rows="10" style="resize: none">${employee.notes}</textarea>
    </div>
    <div>
        <input type="submit" value="수정">
    </div>
</form>
</c:if>

</body>
</html>
