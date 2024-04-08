package com.study.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
}
