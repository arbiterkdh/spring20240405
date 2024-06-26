package com.study.mapper;

import com.study.domain.MyBean258Employees;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface Mapper08 {

    @Select("""
            <script>
            SELECT * 
            FROM Employees
            WHERE LastName = 'abc'
               <if test="false">
                OR FirstName = 'def'
                </if>
            </script>            
            """)
    List<MyBean258Employees> query1();

    @Select("""
            <script>
                SELECT * FROM my_table
                <if test="lastName != null">
                -- lastName 이 null 이 아닐 떄 포함되는 어떤 코드
                </if>
                <if test="lastName == null">
                -- lastName 이 null 일 때 포함되는 어떤 코드
                </if>
            </script>
            """)
    Object query2(MyBean258Employees e);

    @Select("""
            <script>
            SELECT * FROM my_table
                 <if test="firstName == 'lee'">
                 -- firstName 이 lee 일 때 포함되는 코드
                 </if>
                 <if test="firstName != 'lee'">
                 -- firstName 이 lee 가 아닐 때 포함되는 코드
                 </if>
            </script>
            """)
    Object query3(MyBean258Employees e);

    @Select("""
            <script>
            SELECT * FROM my_table
            <if test="firstName == null">
            -- firstName 이 null 일 때 포함되는 코드
            </if>
            <if test="firstName != null">
            -- firstName 이 null 아닐 때 포함되는 코드
            </if>
            <if test="firstName == 'kim'">
            -- firstName 이 kim 일 떄 포함되는 코드
            </if>
            <if test="firstName == 'lee'">
            -- firstName 이 lee 일 때 포함되는 코드
            </if>
            </script>
            """)
    Object query4(MyBean258Employees e);

    @Select("""
            <script>
                SELECT *
                FROM my_table
                    <trim prefix="WHERE" prefixOverrides="OR">
                        <if test="lastName != null">
                        OR    LastName = #{lastName}
                        </if>
                        <if test="firstName != null">
                        OR    FirstName = #{firstName}
                        </if>
                    </trim>
                </script>
            """)
    Object query5(MyBean258Employees e);


    @Select("""
            <script>
            <bind name="patternKeyword" value="'%' + keyword + '%'" />
            SELECT * FROM Employees
            WHERE notes LIKE #{patternKeyword}
            </script>
            """)
    List<MyBean258Employees> query6(String keyword);

    @Select("""
            <script>
            <![CDATA[
            SELECT * FROM Products
            WHERE Price < 5
            ]]>
            </script>
            """)
    Object query7();
}
