<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h3>고객 리스트</h3>
<ul>
    <c:forEach items="${customerList}" var="name" varStatus="stat">
        <p>
                ${stat.count} ${name}
        </p>
    </c:forEach>
</ul>

</body>
</html>
