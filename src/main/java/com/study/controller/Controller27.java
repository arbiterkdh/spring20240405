package com.study.controller;

import com.study.domain.MyBean254Customers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.sql.DataSource;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

@Controller
@RequestMapping("main27")
public class Controller27 {
    @Autowired
    private DataSource dataSource;

    @GetMapping("sub1")
    public String sub1(Integer page, Model model) throws Exception {
        int offset = (page - 1) * 10;
        String sql = """
                SELECT *
                FROM Customers
                ORDER BY CustomerID
                LIMIT ?, 10
                """;

        PreparedStatement ps = dataSource.getConnection().prepareStatement(sql);
        ps.setInt(1, offset);
        ResultSet rs = ps.executeQuery();
        var list = new ArrayList<MyBean254Customers>();

        try (ps; rs;) {
            while (rs.next()) {
                MyBean254Customers customer = new MyBean254Customers();
                customer.setCustomerId(rs.getInt(1));
                customer.setCustomerName(rs.getString(2));
                customer.setContactName(rs.getString(3));
                customer.setAddress(rs.getString(4));
                customer.setCity(rs.getString(5));
                customer.setPostalCode(rs.getString(6));
                customer.setCountry(rs.getString(7));
                list.add(customer);

            }

            model.addAttribute("customerList", list);
        }

        return "main27/sub1";
    }
}
