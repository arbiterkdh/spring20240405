<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Title</title>
    <style>
        table, tr, th, td {
            border: 1px solid black;
            border-collapse: collapse;
        }

        table {
            width: 100%;
        }
    </style>
</head>
<body>
<form action="">
    직원 목록 조회
    <input type="text" name="name" value="${search}" placeholder="조회할 직원의 이름을 입력하세요">
    <button>
        조회
    </button>
</form>
<c:if test="${empty employees}" var="emptyEmployees">
    <p>해당 키워드인 직원이 없습니다.</p>
</c:if>
<c:if test="${not emptyEmployees}">
    <table>
        <thead>
        <tr>
            <th>#</th>
            <th>성</th>
            <th>이름</th>
            <th>생년월일</th>
            <th>사진</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${employees}" var="employee">
            <tr>
                <td>${employee.employeeId}</td>
                <td>${employee.lastName}</td>
                <td>${employee.firstName}</td>
                <td>${employee.birthDate}</td>
                <td>${employee.photo}</td>
                <td>${employee.notes}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</c:if>
</body>
</html>
