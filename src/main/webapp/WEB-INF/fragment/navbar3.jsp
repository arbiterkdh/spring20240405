<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<div style="display: flex; justify-content: space-between">
    <div>
        <a class="${current eq 'sub3' ? 'active' : ""}" href="/main17/sub3">sub3</a>
        <a class="${current eq 'sub4' ? 'active' : ""}" href="/main17/sub4">sub4</a>
        <a class="${current eq 'sub5' ? 'active' : ""}" href="/main17/sub5">sub5</a>
    </div>
    <div>
        <c:if test="${not empty sessionScope.username}" var="loggedIn">
            ${sessionScope.username} 님

            <a href="/main17/sub9">logout</a>
        </c:if>
        <c:if test="${not loggedIn}">
            guest 님
        </c:if>
    </div>
</div>
