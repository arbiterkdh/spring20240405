<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h3>고객 정보 조회</h3>
<form action="/main25/sub4">
    고객명 :
    <input type="text" value="${name}" name="search" placeholder="고객의 이름을 입력하세요">
    <input type="submit" value="조회">
</form>
<table style="text-indent: 10px;">
    <thead style="text-align: left;">
    <tr>
        <th>#</th>
        <th>고객명</th>
        <th>접근명</th>
        <th>주소</th>
        <th>도시</th>
        <th>PostalCode</th>
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
