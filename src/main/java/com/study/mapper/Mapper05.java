package com.study.mapper;

import lombok.Data;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface Mapper05 {
    @Data
    static class EmployeeIncome {
        private Integer employeeId;
        private String lastName;
        private String firstName;
        private Double income;
    }

    @Data
    static class CustomerPurchase {
        private String customerName;
        private Double purchase;
    }

    @Select("""
                    SELECT e.EmployeeID,
                           e.LastName,
                           e.FirstName,
                           SUM(od.Quantity * p.Price) AS income
                    FROM Orders o JOIN Employees e ON o.EmployeeID = e.EmployeeID
                                  JOIN OrderDetails od ON o.OrderID = od.OrderID
                                  JOIN Products p ON od.ProductID = p.ProductID
                    WHERE o.OrderDate BETWEEN #{from} AND #{to}
                    GROUP BY e.EmployeeID
                    ORDER BY income DESC
            """)
    List<EmployeeIncome> selectIncomeList(String from, String to);

    @Select("""
                        SELECT c.CustomerName,
                               SUM(p.Price * od.Quantity) AS purchase
                        FROM Products p JOIN OrderDetails od
                                        JOIN Orders o
                                        JOIN Customers c
                        ON  p.ProductID = od.ProductID
                        AND od.OrderID = o.OrderID
                        AND o.CustomerID = c.CustomerID
                        WHERE o.OrderDate LIKE #{date}
                        GROUP BY c.CustomerName
                        ORDER BY purchase DESC
            """)
    List<CustomerPurchase> customerPurchaseList(String date);

}
