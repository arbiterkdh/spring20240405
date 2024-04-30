<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Title</title>
    <style>
        table, tr, th, td {
            border-collapse: collapse;
            border: 1px solid black;
            padding: 3px;
        }

        th {
            font-size: 1.2rem;
        }
    </style>
</head>
<body>
<h2>월별 구매 금액 리스트</h2>
<div>
    <form action="">
        <div>
            <select name="year">
                <option value="1996" ${year == 1996 ? 'selected' : ''}>1996</option>
                <option value="1997" ${year == 1997 ? 'selected' : ''}>1997</option>
                <option value="1998" ${year == 1998 ? 'selected' : ''}>1998</option>
            </select>
            년
            <select name="month">
                <option value="1" ${month == 1 ? 'selected' : ''}>1</option>
                <option value="2" ${month == 2 ? 'selected' : ''}>2</option>
                <option value="3" ${month == 3 ? 'selected' : ''}>3</option>
                <option value="4" ${month == 4 ? 'selected' : ''}>4</option>
                <option value="5" ${month == 5 ? 'selected' : ''}>5</option>
                <option value="6" ${month == 6 ? 'selected' : ''}>6</option>
                <option value="7" ${month == 7 ? 'selected' : ''}>7</option>
                <option value="8" ${month == 8 ? 'selected' : ''}>8</option>
                <option value="9" ${month == 9 ? 'selected' : ''}>9</option>
                <option value="10" ${month == 10 ? 'selected' : ''}>10</option>
                <option value="11" ${month == 11 ? 'selected' : ''}>11</option>
                <option value="12" ${month == 12 ? 'selected' : ''}>12</option>
            </select>
            월
        </div>
        <div style="margin-top: 5px;">
            <input style="width: 60px" type="submit" value="조 회">
        </div>
    </form>
</div>
<hr>
<c:if test="${empty purchaseList}">
    조회 결과가 없습니다.
    <div>
        1996년 7월 ~ 1998년 5월 사이로 검색해주세요.
    </div>
</c:if>
<c:if test="${not empty purchaseList}">

    <table>

        <thead>
        <tr>
            <th>#</th>
            <th>고객명</th>
            <th>${year} 년 ${month}월 누적 구매 금액</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${purchaseList}" var="purchase" varStatus="stat">
        <tr>
            <td>${stat.count}</td>
            <td>${purchase.customerName}</td>
            <td style="text-align: right">${purchase.purchase}</td>
        </tr>
        </tbody>
        </c:forEach>
    </table>
</c:if>

</body>
</html>
