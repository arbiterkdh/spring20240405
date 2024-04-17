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

        table {
            width: 100%;
        }
    </style>
</head>
<body>
<form action="">
    <h3>상품 조회</h3>
    <input type="text" value="${search}" name="name" placeholder="상품 이름을 입력하세요">
    <%--    form 내의 버튼은 submit 역할 --%>
    <button>조회</button>
</form>
<hr>
<c:if test="${empty productList}" var="emptyProductList">
    <p>입력하신 상품이 없습니다.</p>
</c:if>

<c:if test="${not emptyProductList}">
    <table>
        <thead>
        <tr>
            <th>#</th>
            <th>상품명</th>
            <th>공급ID</th>
            <th>종류ID</th>
            <th>수량</th>
            <th>가격</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${productList}" var="product">
            <tr>
                <td>${product.productId}</td>
                <td>${product.productName}</td>
                <td>${product.supplierId}</td>
                <td>${product.categoryId}</td>
                <td>${product.unit}</td>
                <td>${product.price}$</td>
            </tr>
        </c:forEach>

        </tbody>
    </table>
</c:if>

</body>
</html>
