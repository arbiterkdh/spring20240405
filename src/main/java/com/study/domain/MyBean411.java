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
}
