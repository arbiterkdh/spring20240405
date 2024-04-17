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
<h3>고객 정보 조회</h3>
<%-- action 의 값이 없거나 생략되면 현재 요청 경로로 보냄 --%>
<form action="">
    고객명 :
    <input type="text" value="${search}" name="name" placeholder="고객의 이름을 입력하세요">
    <input type="submit" value="조회">
</form>
<table>
    <thead>
    <tr>
        <th>#</th>
        <th>고객명</th>
        <th>접근명</th>
        <th>주소</th>
        <th>도시</th>
        <th>우편번호</th>
        <th>국가</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${customerList}" var="customer">
        <tr>
            <td>${customer.customerId}</td>
            <td>${customer.customerName}</td>
            <td>${customer.contactName}</td>
            <td>${customer.address}</td>
            <td>${customer.city}</td>
            <td>${customer.postalCode}</td>
            <td>${customer.country}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
