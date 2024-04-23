<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h3>고객 정보 조회 및 수정</h3>
<form>
    <input type="text" name="customer" value="${customer.customerId}">
    <button>조회</button>
</form>
<hr>
<c:if test="${not empty message}">
    <div style="padding: 20px; background-color: orange">${message}</div>
</c:if>
<c:if test="${empty customer}">조회 결과가 없습니다.</c:if>
<c:if test="${not empty customer}">
    <form action="/main32/sub7/update" method="post">
        <div>
            이름
            <input type="text" value="${customer.customerName}" name="customerName">
        </div>
        <div>
            계약명
            <input type="text" value="${customer.contactName}" name="contactName">
        </div>
        <div>
            주소
            <input type="text" value="${customer.address}" name="address">
        </div>
        <div>
            도시
            <input type="text" value="${customer.city}" name="city">
        </div>
        <div>
            우편번호
            <input type="text" value="${customer.postalCode}" name="postalCode">
        </div>
        <div>
            국가
            <input type="text" value="${customer.country}" name="country">
        </div>
        <input style="display: none" type="text" name="customerId" value="${customer.customerId}">
        <input type="submit" value="수정">
    </form>
</c:if>
</body>
</html>
