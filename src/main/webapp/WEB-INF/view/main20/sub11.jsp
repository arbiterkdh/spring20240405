<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/main20/sub12">
    <input type="text" name="type">
    <br>
    <textarea name="content"></textarea>
    <br>
    <select name="city" id="">
        <option value="london">런던</option>
        <option value="seoul">서울</option>
        <option value="chicago">시카고</option>
    </select>
    <br>
    <input type="submit">
</form>
<hr>
<form action="/main20/sub13">
    <div>
        <div>
            <input type="radio" name="city" value="seoul" id="">
            서울
        </div>
        <div>
            <input type="radio" name="city" value="london" id="">
            런던
        </div>
        <div>
            <input type="radio" name="city" value="incheon" id="">
            인천
        </div>
        <input type="submit">
    </div>
</form>

<form action="/main20/sub14">
    <div>
        <input type="checkbox" name="foods" value="pizza" id="">
        피자
    </div>
    <div>
        <input type="checkbox" name="foods" value="noodle" id="">
        국수
    </div>
    <div>
        <input type="checkbox" name="foods" value="burger" id="">
        햄버거
    </div>
    <input type="submit">
</form>

<form action="/main20/sub15">


    <div>
        <select name="type" id="">
            <option value="football">축구</option>
            <option value="baseball">야구</option>
            <option value="basketball">농구</option>
        </select>
    </div>
    <div>
        <input type="radio" name="phone" id="" value="iphone">
        아이폰
    </div>
    <div>
        <input type="radio" name="phone" id="" value="galaxy">
        갤럭시
    </div>
    <div>
        <input type="radio" name="phone" id="" value="nokia">
        노키아
    </div>
    <div>
        <input type="checkbox" name="book" id="" value="java">
        자바
    </div>
    <div>
        <input type="checkbox" name="book" id="" value="spring">
        스프링
    </div>
    <div>
        <input type="checkbox" name="book" id="" value="react">
        리액트
    </div>
    <div>
        <input type="submit">
    </div>
</form>
</body>
</html>
