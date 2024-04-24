<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Title</title>
    <style>
        table, tr, th, td {
            border-collapse: collapse;
            border: 1px solid black;
        }
    </style>
</head>
<body>
<form action="" method="post">
    <div>
        제목
        <input type="text" name="title" value="무제">
    </div>
    <div>
        이름
        <input type="text" name="name" value="무명">
    </div>
    <div>
        나이
        <input type="number" name="age" value="20">
    </div>
    <div>
        가격
        <input type="number" name="price" value="10000.000" step="0.001">
    </div>
    <div>
        출시
        <input type="date" name="published" value="1990-01-01">
    </div>
    <div>
        삽입
        <input type="datetime-local" name="inserted" value="2024-12-31T23:59:59" step="1">
    </div>
    <div>
        <input type="submit" value="추가">
    </div>
</form>
<hr>
<h3>
    my_table10 리스트
</h3>
<table>
    <thead>
    <tr>
        <th>제목</th>
        <th>이름</th>
        <th>나이</th>
        <th>가격</th>
        <th>출시</th>
        <th>삽입</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${properties}" var="propertie">
        <tr>
            <td>
                    ${propertie.title}
            </td>
            <td>
                    ${propertie.name}
            </td>
            <td>
                    ${propertie.age}
            </td>
            <td>
                    ${propertie.price}
            </td>
            <td>
                    ${propertie.published}
            </td>
            <td>
                    ${propertie.inserted}
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

</body>
</html>
