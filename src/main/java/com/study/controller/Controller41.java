package com.study.controller;

import com.study.service.Service05;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.sql.DataSource;
import java.util.Map;

@Controller
@RequestMapping("/api/main41")
@RequiredArgsConstructor
public class Controller41 {

    private final DataSource dataSource;
    private final Service05 service;

    @PostMapping("sub1")
    public void sub1(@RequestBody Map<String, Object> map) {
        // @RequestBody
        // 역직렬화(파싱, 디코딩) JSON -> Map
        System.out.println("map = " + map);
        System.out.println("Controller41.sub1");
    }

    @PostMapping("sub2")
    public void sub2(@RequestBody Map<String, Object> map) {
        System.out.println("map = " + map);
    }

    @PostMapping("sub3")
    public void sub3(@RequestBody Map<String, Object> map) {
        System.out.println("map = " + map);
    }

    @PostMapping("sub4")
    public void sub4(@RequestBody Map<String, Object> map) {
        service.add(map);
        System.out.println("map = " + map);
    }

    @PostMapping("sub5")
    public void sub5(@RequestBody Map<String, Object> map) {
        System.out.println("map = " + map);
        Object name = map.get("name");
        System.out.println("name = " + name.getClass());
        Object age = map.get("age");
        System.out.println("age = " + age.getClass());
        Object married = map.get("married");
        System.out.println("married = " + married.getClass());
        Object team = map.get("team");
        System.out.println("team = " + team.getClass());
        Object item = map.get("item");
        System.out.println("item = " + item.getClass());
    }
}
