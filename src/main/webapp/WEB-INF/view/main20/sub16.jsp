<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<form action="/main20/sub17" method="post">
    <div>
        아이디
        <input type="text" name="id">
    </div>
    <div>
        패스워드
        <input type="password" name="password">
    </div>
    <div>
        자기소개
        <textarea name="" id="" cols="30" rows="10"></textarea>
    </div>
    <div>
        <input type="submit">
    </div>
</form>

<hr>

<%-- todo : form 요소 만들기
        요청 경로 : /main20/sub18
        요청 방식 : post
        request parameter : name, city, address

        /main20/sub18 요청 경로에서 일하는 메소드 작성
        위에서 전송한 name, city, address 받아서 출력
        --%>
<form action="/main20/sub18" method="post">

    <div>
        <div>
            이름 :
            <input type="text" name="name">
        </div>
        <div>
            도시 :
            <input type="text" name="city">
        </div>
        <div>
            주소 :
            <input type="text" name="address">
        </div>
        <div>
            <input type="submit">
        </div>
    </div>
</form>


</body>
</html>
