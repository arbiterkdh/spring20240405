package com.study.domain;

public class MyBean091 {
    // name, age 속성(property)이 있음

    // property 명은 getter, setter 의 메소드명으로부터 결정
    // get, set 을 제거하고 앞글자를 소문자로 바꾼 것
    public String getName() {
        return "흥민쏜";
    }

    public Integer getAge() {
        return 30;
    }
}
