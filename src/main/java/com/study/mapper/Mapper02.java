package com.study.mapper;

import com.study.domain.MyBean254Customers;
import com.study.domain.MyBean256ProductList;
import com.study.domain.MyBean258Employees;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

@Mapper
public interface Mapper02 {

    @Select("SELECT NOW()")
    public String selectNow();

    // 조회 결과의 컬럼명과
    // 리턴 타입의 객체 프로퍼티명이 같으면
    // 값을 바인딩 해줌.
    @Select("""
            SELECT ContactName, Address, City, Country
            FROM Customers
            WHERE CustomerID = 1
            """)
    MyBean254Customers selectOneCustomer();

    @Select("""
            SELECT CustomerId,
                   CustomerName
            FROM Customers
            WHERE CustomerID = 1
            """)
    MyBean254Customers selectOneCustomer2();

    @Select("""
                    SELECT CustomerId,
                           CustomerName,
                           ContactName,
                           Address,
                           City,
                           Country,
                           PostalCode
                    FROM Customers
                    WHERE CustomerID = 1
            """)
    MyBean254Customers selectOneCustomer3();

    @Select("""
            SELECT EmployeeId,
                   LastName,
                   FirstName,
                   BirthDate,
                   Photo,
                   Notes
            FROM Employees
            WHERE EmployeeID = 1
            """)
    MyBean258Employees selectOneEmployee1();

    @Select("""
            SELECT EmployeeId,
                   LastName,
                   FirstName,
                   Photo,
                   Notes,
                   BirthDate
            FROM Employees
            WHERE EmployeeID = #{employeeID}
            """)
    MyBean258Employees selectOneEmployee2(Integer employeeId);

    @Select("""
            SELECT CustomerID,
                   CustomerName,
                   ContactName,
                   Address,
                   City,
                   PostalCode,
                   Country
            FROM Customers
            WHERE CustomerID = #{customerID}
            """)
    MyBean254Customers selectOneCustomer4(Integer customerID);

    @Select("""
            SELECT CustomerID,
                   CustomerName,
                   ContactName,
                   Address,
                   City,
                   PostalCode,
                   Country
            FROM Customers
            """)
    List<MyBean254Customers> selectAllCustomer1();

    @Select("""
            SELECT EmployeeId,
                    LastName,
                    FirstName,
                    Photo,
                    Notes,
                    BirthDate
            FROM Employees
            ORDER BY BirthDate DESC
            """)
    List<MyBean258Employees> selectAllEmployee1();

    @Select("""
               SELECT CustomerID,
                      CustomerName,
                      ContactName,
                      Address,
                      City,
                      PostalCode,
                      Country
               FROM Customers
               WHERE Country = #{country1}
            ORDER BY Country
               """)
    List<MyBean254Customers> selectCustomersByCountry(String country1, String country2);

    @Select("""
            SELECT ProductID,
                   ProductName,
                   SupplierID,
                   CategoryID,
                   Unit,
                   Price
            FROM Products
            WHERE Price 
            BETWEEN #{from} 
            AND #{to} 
            """)
    List<MyBean256ProductList> selectAllProductsByPrice(Double from, Double to);

    @Update("""
            UPDATE Customers
            SET
                CustomerName = #{customerName},
                ContactName = #{contactName},
                Address = #{address},
                City = #{city},
                PostalCode = #{postalCode},
                Country = #{country}
            WHERE CustomerID = #{customerId}
            """)
    int updateOneCustomerById(MyBean254Customers customers);
}
