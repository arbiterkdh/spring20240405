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
            color: orange;
            font-weight: bold;
        }

        .pages {
            display: flex;
            width: 100%;
            justify-content: center;
            align-items: center;
        }

        .pageBox {
            margin: 10px;
        }
    </style>
    <title>Title</title>
</head>
<body>
<table>
    <thead>
    <tr>
        <th>아이디</th>
        <th>성</th>
        <th>이름</th>
        <th>생년월일</th>
        <th>사진</th>
        <th>메모</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${employeeList}" var="employee">
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
<div class="pages">
    <p class="pageBox">
        <c:if test="${currentPage ne '1'}">
            <c:url var="link" value="/main27/sub2">
                <c:param name="page" value="1"/>
            </c:url>
            <span>
            <a href="${link}">&lt;&lt;맨앞</a>
        </span>
        </c:if>

        <c:if test="${not empty prevPage}">
            <c:url var="link" value="/main27/sub2">
                <c:param name="page" value="${prevPage}"/>
            </c:url>
            <span>
        <a href="${link}">&lt;이전</a>
    </span>
        </c:if>

        <c:forEach begin="${beginPageNumber}" end="${endPageNumber}" var="pageNumber">
            <c:url var="link" value="/main27/sub2">
                <c:param name="page" value="${pageNumber}"/>
            </c:url>
            <span>
            <a class="${pageNumber eq currentPage ? 'active' : ''}" href="${link}">${pageNumber}</a>
        </span>
        </c:forEach>

        <c:if test="${not empty nextPage}">
            <c:url var="link" value="/main27/sub2">
                <c:param name="page" value="${nextPage}"/>
            </c:url>
            <span>
        <a href="${link}">다음&gt;</a>
    </span>
        </c:if>

        <c:if test="${currentPage ne lastPageNumber}">
            <c:url var="link" value="/main27/sub2">
                <c:param name="page" value="${lastPageNumber}"/>
            </c:url>
            <span>
        <a href="${link}">맨뒤&gt;&gt;</a>
    </span>
        </c:if>
    </p>
</div>
</body>
</html>
