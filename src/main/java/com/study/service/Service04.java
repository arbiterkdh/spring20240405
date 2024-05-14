package com.study.service;

import com.study.domain.MyBean258Employees;
import com.study.mapper.Mapper08;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
//@RequiredArgsConstructor
@Transactional(rollbackFor = Exception.class)
public class Service04 {
    @Autowired
    private Mapper08 mapper;


    public void action1() {
        mapper.query1();
    }

    public void action2() {
        MyBean258Employees e = new MyBean258Employees();
//        e.setLastName("흥민");
        mapper.query2(e);
    }

    public void action3() {
        MyBean258Employees e = new MyBean258Employees();
        e.setFirstName("kim");
        mapper.query3(e);
    }

    public void action4() {
        MyBean258Employees e = new MyBean258Employees();
//        e.setFirstName("kim");
        e.setFirstName("lee");

        mapper.query4(e);
    }

    public void action5() {
        MyBean258Employees e = new MyBean258Employees();
        e.setLastName("son");
        e.setFirstName("hm");
        mapper.query5(e);
    }

    public void action6(String keyword) {
        List<MyBean258Employees> e = mapper.query6(keyword);
        e.forEach(System.out::println);
    }

    public void action7() {
        mapper.query7();
    }
}
