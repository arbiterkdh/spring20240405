package com.study.mapper;

import com.study.domain.MyBean254Customers;
import com.study.domain.MyBean258Employees;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;

@Mapper
public interface Mapper07 {

    @Insert("""
            INSERT INTO Employees
            (LastName, FirstName)
            VALUES (#{lastName}, #{firstName})
            """)
    int insert(MyBean258Employees e);

    @Insert("""
            INSERT INTO Customers
            (CustomerName, ContactName)
            VALUES (#{customerName}, #{contactName})
            """)
    @Options(useGeneratedKeys = true, keyProperty = "customerId")
    void insert2(MyBean254Customers c);
}
