<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="attr1" value="page value2" scope="page"/>
<div>
    <div>
        attr1 의 value : ${attr1}
        <%--        page value2 --%>
    </div>
    <div>
        attr1 의 request value : ${requestScope.attr1}
        <%--        request value1 --%>
    </div>

</div>