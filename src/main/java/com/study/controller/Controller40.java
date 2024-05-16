package com.study.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class Controller40 {

    @GetMapping("/api/someurl")
    public void method1() {
        System.out.println("Controller40.method1");
    }

    @PostMapping("/api/someurl")
    public void method2() {
        System.out.println("Controller40.method2");
    }

    // get, post /api/some-url2
    // 요청 처리 메소드 작성

    @GetMapping("/api/some-url2")
    public void method3() {
        System.out.println("Controller40.method3");
    }

    @PostMapping("/api/some-url2")
    public void method4() {
        System.out.println("Controller40.method4");
    }

    @GetMapping("")
    public void method5() {
        System.out.println("Controller40.method5");
    }
}
