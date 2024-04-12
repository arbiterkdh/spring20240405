<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<style>
    .menu-item {
        border: 1px solid black;
        background-color: yellow;
    }

</style>
<div>
    <a href="/main15/sub5">
        <span class="${current3 eq 'sub5' ? 'menu-item' : ''}">sub5</span>
    </a>
    <a href="/main15/sub6">
        <span class="${current3 eq 'sub6' ? 'menu-item' : ''}">sub6</span>
    </a>
</div>