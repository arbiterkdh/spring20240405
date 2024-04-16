<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>고객 국가 리스트</h1>
<table>
    <thead style="text-align: left; font-size: 1.5em; line-height: 40px;">
    <tr>
        <th style="padding-right: 15px">#</th>
        <th>country</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${customers}" var="customer" varStatus="stat">
        <tr>
            <td>${stat.count}</td>
            <td>${customer}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
