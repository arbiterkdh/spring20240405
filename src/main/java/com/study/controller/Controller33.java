package com.study.controller;

import com.study.domain.MyBean331;
import com.study.domain.MyBean332;
import com.study.domain.MyBean333;
import com.study.mapper.Mapper04;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

@Controller
@RequestMapping("main33")
@RequiredArgsConstructor
public class Controller33 {

    private final Mapper04 mapper;

    @GetMapping("sub1")
    public void method1() {
        List<MyBean331> obj = mapper.select1();
        obj.forEach(System.out::println);
    }

    @GetMapping("sub2")
    public void method2() {
        List<MyBean332> obj = mapper.select2();
        obj.forEach(System.out::println);
    }

    // todo : 세번째 메소드 작성
    //  mapper.select3() 호출한 결과
    //  List<MyBean333> 타입으로 받아서 출력
    //  SELECT * FROM my_table10

    @GetMapping("sub3")
    public void method3() {
        List<MyBean333> obj = mapper.select3();
        obj.forEach(System.out::println);
    }

    @GetMapping("sub4")
    public void method4() {
        mapper.insert1("hello world", "54321", "876.54", "2024-01-01", "2024-02-02 14:14:14");
    }

    @GetMapping("sub5")
    public void method5() {
        String strVal = "hello mybatis";
        Integer intVal = 7890;
        Double dblVal = 3.14;
        LocalDate localVal = LocalDate.now();
        LocalDateTime localDateTimeVal = LocalDateTime.now();
        mapper.insert2(strVal, intVal, dblVal, localVal, localDateTimeVal);
    }

    @GetMapping("sub8")
    public void method8() {
        MyBean333 obj = new MyBean333();
        obj.setTitle("킹왕짱");
        obj.setName("백예린");
        obj.setAge(26);
        obj.setPrice(9999999.999);
        obj.setPublished(LocalDate.now());
        obj.setInserted(LocalDateTime.parse("2017-04-15T12:13:14"));
        mapper.insert5(obj);
    }

    @GetMapping("sub9")
    public void method9(Model model) {
        List<MyBean332> list = mapper.select2();
        model.addAttribute("datas", list);
    }

    @PostMapping("sub9")
    public void insert9(String str,
                        String intVal,
                        String realVal,
                        String dateVal,
                        String dateTimeVal) {
        mapper.insert1(str, intVal, realVal, dateVal, dateTimeVal);
    }

    @GetMapping("sub10")
    public String select10(Model model) {
        List<MyBean332> list = mapper.select2();
        model.addAttribute("datas", list);

        return "/main33/sub9";
    }

    @PostMapping("sub10")
    public String insert10(String str,
                           Integer intVal,
                           Double realVal,
                           LocalDate dateVal,
                           LocalDateTime dateTimeVal) {
        mapper.insert2(str, intVal, realVal, dateVal, dateTimeVal);
        return "redirect:/main33/sub10";

    }

    @GetMapping("sub11")
    public void select11(Model model) {
        List<MyBean332> list = mapper.select2();
        model.addAttribute("datas", list);

//        return "/main33/sub11";
    }

    @PostMapping("sub11")
    public String insert11(MyBean332 data) {
        System.out.println("data = " + data);
        mapper.insert4(data);
        return "redirect:/main33/sub11";
    }

    @GetMapping("sub12")
    public void select12(Model model) {
        List<MyBean333> list = mapper.select3();
        model.addAttribute("properties", list);
    }

    @PostMapping("sub12")
    public String insert12(MyBean333 data) {
        mapper.insert5(data);

        return "redirect:/main33/sub12";
    }
}
