package com.study.service;

import com.study.domain.MyBean254Customers;
import com.study.domain.MyBean258Employees;
import com.study.mapper.Mapper07;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(rollbackFor = Exception.class)
@RequiredArgsConstructor
public class Service03 {

    private final Mapper07 mapper;

    public void insertData() {
        MyBean258Employees e = new MyBean258Employees();
        e.setLastName("박");
        e.setFirstName("지성");
        mapper.insert(e);
    }

    public void insertData2() {
        MyBean254Customers c = new MyBean254Customers();
        // todo : 새 고객데이터 입력하고
        //  다음 출력 코드에서 새 고객의 키가 출력되도록
        //  코드 작성
        c.setCustomerName("백예린");
        c.setContactName("goat");
        mapper.insert2(c);

        System.out.println(c.getCustomerId());
        System.out.println(c);
    }
}
