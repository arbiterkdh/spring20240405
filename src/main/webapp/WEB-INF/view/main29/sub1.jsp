<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<c:if test="${not empty message}">
    <div style="background-color: orange">
            ${message}
    </div>
</c:if>
<h3>고객 조회</h3>
<form>
    고객 번호
    <input type="number" name="id" value="${customer.customerId}">
    <button>조회</button>
</form>
<hr>
<c:if test="${empty customer}">
    조회된 고객이 없습니다.
</c:if>
<c:if test="${not empty customer}">

    <div>
        번호
        <input type="number" readonly value="${customer.customerId}">
    </div>
    <div>
        이름
        <input type="text" readonly value="${customer.customerName}">
    </div>
    <div>
        계약명
        <input type="text" readonly value="${customer.contactName}">
    </div>
    <div>
        주소
        <input type="text" readonly value="${customer.address}">
    </div>
    <div>
        도시
        <input type="text" readonly value="${customer.city}">
    </div>
    <div>
        우편번호
        <input type="text" readonly value="${customer.postalCode}">
    </div>
    <div>
        국가
        <input type="text" readonly value="${customer.country}">
    </div>

    <form action="/main29/sub1/delete" method="post">
        <div style="display: none">
            <input type="text" name="id" value="${customer.customerId}">
        </div>
        <div>
            <button style="background-color: indianred; border: 3px solid darkred">삭제</button>
        </div>
    </form>

</c:if>

</body>
</html>
