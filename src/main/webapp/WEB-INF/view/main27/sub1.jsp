<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <style>
        table, tr, th, td {
            border: 1px solid black;
            border-collapse: collapse;
        }

        table {
            width: 100%;
        }

        a {
            color: black;
        }

        .active {
            font-weight: bold;
            color: orange;
        }

        .pages {
        }
    </style>
</head>
<body>
<hr>
<table>
    <thead>
    <tr>
        <th>id</th>
        <th>name</th>
        <th>contact</th>
        <th>address</th>
        <th>city</th>
        <th>post</th>
        <th>country</th>
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
<div class="pages">
    <c:if test="${currentPage != 1}">
        <c:url var="link" value="/main27/sub1">
            <c:param name="page" value="1"/>
        </c:url>
        <span>
        <a href="${link}">&lt;&lt;맨앞</a>
    </span>
    </c:if>

    <c:if test="${not empty prevPageNumber}">
        <c:url var="link" value="/main27/sub1">
            <c:param name="page" value="${prevPageNumber}"/>
        </c:url>
        <span>
            <a href="${link}">&lt;이전</a>
        </span>
    </c:if>


    <c:forEach begin="${beginPageNumber}" end="${endPageNumber}" var="pageNumber">
        <c:url var="link" value="/main27/sub1">
            <c:param name="page" value="${pageNumber}"/>
        </c:url>
        <span>
            <a class="${currentPage eq pageNumber ? 'active' : ''}" href="${link}">${pageNumber}</a>
        </span>
    </c:forEach>
    <c:if test="${not empty nextPageNumber}">
        <c:url var="link" value="/main27/sub1">
            <c:param name="page" value="${nextPageNumber}"/>
        </c:url>
        <span>
        <a href="${link}">다음&gt;</a>
    </span>
    </c:if>

    <c:if test="${currentPage != lastPageNumber}">
        <c:url var="link" value="/main27/sub1">
            <c:param name="page" value="${lastPageNumber}"/>
        </c:url>
        <span>
        <a href="${link}">맨뒤&gt;&gt;</a>
    </span>
    </c:if>
</div>
</body>
</html>
