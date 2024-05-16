package com.study.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface Mapper09 {

    @Select("""
            SELECT CustomerName
            FROM Customers
            WHERE CustomerId = #{customerId}
            """)
    String selectCustomerById(Integer customerId);

    @Insert("""
            INSERT INTO kdh
            (singer, song)
            VALUES (#{singer}, #{song})
            """)
    int insert(String singer, String song);

}
