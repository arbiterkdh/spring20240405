package com.study.mapper;

import com.study.domain.MyBean254Customers;
import org.springframework.stereotype.Component;

import java.sql.*;

// Inversion Of Control (IOC)
@Component
public class Mapper01 {

    public MyBean254Customers getCustomerById(Integer id) throws SQLException {
        // connection
        // preparedStatement
        // resultSet
        // 객체 만들고
        // 리턴
        if (id != null) {

            String sql = """
                                    
                        SELECT *
                    FROM Customers
                    WHERE CustomerId = ?
                    """;

            Connection conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/w3schools", "root", "1234");
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();

            try (conn; pstmt; rs;) {
                if (rs.next()) {
                    MyBean254Customers c = new MyBean254Customers();
                    c.setCustomerId(rs.getInt(1));
                    c.setCustomerName(rs.getString(2));
                    c.setContactName(rs.getString(3));
                    c.setAddress(rs.getString(4));
                    c.setCity(rs.getString(5));
                    c.setPostalCode(rs.getString(6));
                    c.setCountry(rs.getString(7));

                    return c;
                }
            }
        }
        return null;
    }
}
