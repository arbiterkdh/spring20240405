<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>고객 정보</h1>
<table>
    <thead style="text-align: left">
    <tr>
        <th>#</th>
        <th>name</th>
        <th>city</th>
        <th>country</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${customers}" var="customer" varStatus="stat">
        <tr>
            <td>${stat.count}</td>
            <td>${customer.customerName}</td>
            <td>${customer.city}</td>
            <td>${customer.country}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>

</body>
</html>
