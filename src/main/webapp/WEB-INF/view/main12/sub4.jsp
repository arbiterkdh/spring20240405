<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<c:forEach begin="1" end="3" var="num">
    <p>반복 출력 코드 ${num}</p>
</c:forEach>
<hr>
<c:forEach items="${myList}" var="elem">
    <p>${elem}</p>
</c:forEach>
<hr>
<c:forEach items="${foods}" var="food" begin="1" end="2">
    <p>${food}</p>
</c:forEach>
<hr>
<c:forEach items="${myMap}" var="entry">
    <p>${entry.key} : ${entry.value}</p>
</c:forEach>
<hr>
<c:forEach items="${cars}" var="entry">
    <p>${entry.key} 는 ${entry.value} 에서 만든 자동차입니다.</p>
</c:forEach>
<hr>
<%-- TODO: myList2 라는 이름의 attribute 를 List 타입으로 넣기--%>

<c:forEach items="${myList2}" var="elem">
    <p>${elem}</p>
</c:forEach>
<hr>
<%-- TODO: myMap2 라는 이름의 attribute 를 Map 타입으로 넣기--%>
<c:forEach items="${myMap2}" var="entry">
    <p>${entry.key} : ${entry.value}</p>
</c:forEach>
</body>
</html>
