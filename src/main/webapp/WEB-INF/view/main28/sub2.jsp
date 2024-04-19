<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <style>
        .box {
            width: 300px;
        }

        .pBox {
            width: 100px;
            height: 10px;
        }

        .inputBox {
            width: 200px;
        }

        text {
            width: 100px;
        }
    </style>
    <title>Title</title>
</head>
<body>
<c:if test="${not empty message}">
    <div style=" padding: 20px; background-color: indianred">
            ${message}
    </div>
</c:if>
<form action="" method="post">
    <div class="box">
        <div>
            <p class="pBox">성</p>
            <input class="inputBox" type="text" name="lastName">
        </div>
        <div>
            <p class="pBox">이름</p>
            <input class="inputBox" type="text" name="firstName">
        </div>
        <div>
            <p class="pBox">생년월일</p>
            <input class="inputBox" type="date" name="birthDate">
        </div>
        <div>
            <p class="pBox">사진</p>
            <input class="inputBox" type="file" name="photo">
        </div>
        <div>
            <p class="pBox">메모</p>
            <textarea class="inputBox" name="notes" cols="40" rows="10" style="resize: none"></textarea>
        </div>
        <div>
            <p class="pBox">
                <input type="submit" value="등록">
            </p>
        </div>
    </div>
</form>

</body>
</html>
