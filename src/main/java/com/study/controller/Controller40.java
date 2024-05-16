package com.study.controller;

import com.study.domain.MyBean001;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

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

    @GetMapping("/api/some-url3")
    public void method6(@RequestParam("id") Integer id,
                        @RequestParam("name") String name,
                        @RequestParam("email") String email) {
        System.out.println("id = " + id);
        System.out.println("name = " + name);
        System.out.println("email = " + email);
    }

    @PostMapping("/api/some-url3")
    public void method7(@RequestParam("id") Integer id,
                        @RequestParam("city") String city,
                        @RequestParam("country") String country) {
        System.out.println("id = " + id);
        System.out.println("city = " + city);
        System.out.println("country = " + country);
    }

    // /api/some-url4 get, post 요청 처리 메소드 작성

    @GetMapping("/api/some-url4")
    public void method8(@RequestParam("id") Integer id,
                        String name,
                        String email) {
        System.out.println("id = " + id);
        System.out.println("name = " + name);
        System.out.println("email = " + email);
    }

    @PostMapping("/api/some-url4")
    public void method9(MyBean001 myBean001) {
        System.out.println("myBean001 = " + myBean001.getId());
        System.out.println("myBean001 = " + myBean001.getCity());
        System.out.println("myBean001 = " + myBean001.getCountry());
    }


    @GetMapping("")
    public void method5() {
        System.out.println("Controller40.method5");
    }
}
