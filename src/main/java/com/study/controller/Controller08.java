package com.study.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("main8")
public class Controller08 {
    @RequestMapping("sub1")
    public void method1(Model model) {
        model.addAttribute("name1", "value1");
        model.addAttribute("name2", "value2");

        // /WEB-INF/view/main8/sub1.jsp

    }

    @RequestMapping("sub2")
    public void method2(Model model) {
        model.addAttribute("city", "서울");
        model.addAttribute("address", "신촌");
    }

    @RequestMapping("sub4")
    public void method4(Model model) {
        model.addAttribute("car", new String[]{"tesla", "kia", "hyundai"});

    }

    @RequestMapping("sub5")
    public void method5(Model model) {
        model.addAttribute("cities", new String[]{"서울", "대구", "부산"});
        model.addAttribute("countries", new String[]{"한국", "미국", "케냐"});
    }

    @RequestMapping("sub6")
    public void method6(Model model) {
        List<String> data = List.of("java", "css", "html", "jsp");
        model.addAttribute("myList", data);

        // /main8/sub6.jsp
    }

    @RequestMapping("sub7")
    public void method7(Model model) {
        List<String> data = List.of("💕", "😍", "❤️");
        model.addAttribute("myList", data);

        List<Integer> numbers = List.of(10, 5, 0);
        model.addAttribute("yourList", numbers);
    }

    @RequestMapping("sub8")
    public void method8(Model model) {
        model.addAttribute("numbers", List.of(500.0, 3.14));
        model.addAttribute("cities", List.of("서울", "런던", "뉴욕"));
    }

    @RequestMapping("sub9")
    public void method9(Model model) {
        model.addAttribute("numbers", Map.of("Pi", 3.14, "name", "kdh"));
    }

    @RequestMapping("sub10")
    public void method10(Model model) {
        Map<String, String> names = Map.of("son", "토트넘",
                "lee", "파리",
                "kim", "뮌헨");
        model.addAttribute("names", names);
    }
}
