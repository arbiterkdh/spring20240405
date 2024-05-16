package com.study.domain;

import lombok.Data;

import java.util.ArrayList;
import java.util.LinkedHashMap;

@Data
public class MyBean411 {
    private String name;
    private Integer age;
    private Boolean married;
    private LinkedHashMap<String, String> team;
    private ArrayList<String> item;
    private Object address;

    public String getDesc() {
        return STR."이름은 \{name}이고 나이는 \{age} 입니다.";
    }
}
