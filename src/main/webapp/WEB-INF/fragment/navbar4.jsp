<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<style>
    .active {
        border: 1px solid black;
        background: yellow;

    }
</style>
<div style="display: flex; justify-content: space-between">
    <div>

        <a class="${current eq 'sub6' ? 'active' : ''}" href="/main17/sub6">sub6</a>
        <a class="${current eq 'sub7' ? 'active' : ''}" href="/main17/sub7">sub7</a>
        <a class="${current eq 'sub8' ? 'active' : ''}" href="/main17/sub8">sub8</a>
    </div>
    <div>
        <c:if test="${not empty sessionScope.username}" var="loggedIn">
            ${sessionScope.username} 님
            <a href="/main17/sub10">logout</a>
        </c:if>
        <c:if test="${not loggedIn}">
            guest 님
        </c:if>
    </div>
</div>

