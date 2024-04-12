<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<c:set var="attr1" value="page value1" scope="page"/>
<c:set var="attr1" value="request value1" scope="request"/>
<c:import url="navbar5.jsp"/>

<div>
    <div>
        attr1 의 value : ${attr1}
        <%--        page value1 --%>
    </div>
    <div>
        attr1 의 request value : ${requestScope.attr1}
        <%--        request value1 --%>
    </div>
</div>
</body>
</html>
