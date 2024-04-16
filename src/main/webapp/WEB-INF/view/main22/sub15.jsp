<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<c:if test="${not empty message}">
    <div style="background-color: lightblue;">
            ${message}
    </div>
</c:if>
<h1>Lorem ipsum dolor.</h1>
<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aperiam dolore dolorum inventore nemo officiis quam
    quisquam sunt. A adipisci consectetur debitis illo laboriosam omnis pariatur unde. Aut consectetur deserunt
    nam!
</p>


</body>
</html>
