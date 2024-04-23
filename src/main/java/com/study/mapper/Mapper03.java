package com.study.mapper;

import com.study.domain.MyBean254Customers;
import com.study.domain.MyBean258Employees;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface Mapper03 {

    @Delete("""
            DELETE FROM Customers
            WHERE CustomerId = 1;
            """)
    int deleteOneCustomer();

    @Delete("""
            DELETE FROM Customers
            WHERE CustomerId = #{CustomerId};
            """)
    int deleteOneCustomerById(Integer CustomerId);

    @Delete("""
            DELETE FROM Employees
            WHERE EmployeeId = #{eid};
            """)
    int deleteOneEmployeeById(Integer eid);

    @Insert("""
            INSERT INTO Customers
            (CustomerName, ContactName, Address, City, PostalCode, Country)
            VALUES 
                (#{customerName}, #{contactName}, #{address}, #{city}, #{postalCode}, #{country})
            """)
    int insertCustomer(MyBean254Customers customers);

    @Insert("""
            INSERT INTO Employees
            (LastName, FirstName, BirthDate, Photo, Notes)
            VALUES 
                (#{lastName}, #{firstName}, #{birthDate}, #{photo}, #{notes})
            """)
    int insertEmployee(MyBean258Employees e);
}
