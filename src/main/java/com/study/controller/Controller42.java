package com.study.controller;

import com.study.domain.MyBean411;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/api/main42")
public class Controller42 {

    @GetMapping("sub1")
    @ResponseBody
    public String sub1() {

        return "어떤 데이터";
    }

    @GetMapping("sub2")
    @ResponseBody
    public String sub2() {
        return "some data";
    }

    @GetMapping("sub3")
    @ResponseBody
    public Map<String, Object> sub3() {
        return Map.of("name", "흥민",
                "age", 35,
                "married", true,
                "info", Map.of(
                        "team", "tottenham",
                        "location", "london"),
                "item", List.of("축구공", "운동화", "유니폼"));
    }

    @GetMapping("sub4")
    @ResponseBody
    public Map<String, Object> sub4() {
        return Map.of("name", "son", "age", 35, "married", false);
    }

    @GetMapping("sub5")
    @ResponseBody
    public MyBean411 sub5() {
        MyBean411 myBean411 = new MyBean411();
        myBean411.setAge(35);
        myBean411.setMarried(true);
        myBean411.setName("이강인");

        return myBean411;
    }

}
