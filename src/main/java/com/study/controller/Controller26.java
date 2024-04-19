package com.study.controller;

import com.study.domain.MyBean254Customers;
import com.study.domain.MyBean256ProductList;
import com.study.domain.MyBean261Orders;
import com.study.domain.MyBean263Category;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;

@Controller
@RequestMapping("main26")
public class Controller26 {

    @Autowired
    private DataSource dataSource;

    @GetMapping("sub1")
    public String sub1(String start, String end, Model model) throws SQLException {
        // todo : 메소드 작성하세요.
        //  between 활용
        var list = new ArrayList<MyBean261Orders>();
        String sql = "SELECT * FROM Orders WHERE OrderDate BETWEEN ? AND ?";

        Connection con = dataSource.getConnection();
        PreparedStatement pstmt = con.prepareStatement(sql);
        pstmt.setString(1, start);
        pstmt.setString(2, end);
        ResultSet rs = pstmt.executeQuery();

        try (con; pstmt; rs;) {
            while (rs.next()) {
                MyBean261Orders obj = new MyBean261Orders();
                obj.setId(rs.getInt(1));
                obj.setCustomerId(rs.getInt(2));
                obj.setEmployeeId(rs.getInt(3));
                obj.setDate(rs.getString(4));
                obj.setShipperId(rs.getInt(5));
                list.add(obj);
            }
        }
        model.addAttribute("orderList", list);
        model.addAttribute("start", start);
        model.addAttribute("end", end);

        return "main26/sub1OrderList";
    }

    @GetMapping("sub2")
    public String method2(String[] country, Model model) throws SQLException {
        Connection con = dataSource.getConnection();

        if (country != null && country.length > 0) {
            String questionMarks = "";
            for (int i = 0; i < country.length; i++) {
                questionMarks = questionMarks + "?";
                if (i != country.length - 1) {
                    questionMarks = questionMarks + ",";
                }
            }
            var customerList = new ArrayList<MyBean254Customers>();
            String customerSql = STR."SELECT * FROM Customers WHERE Country IN (\{questionMarks})";
            PreparedStatement pstmt = con.prepareStatement(customerSql);
            for (int i = 0; i < country.length; i++) {
                pstmt.setString((i + 1), country[i]);
            }
            ResultSet resultSet = pstmt.executeQuery();
            try (pstmt; resultSet) {
                while (resultSet.next()) {
                    MyBean254Customers data = new MyBean254Customers();
                    data.setCustomerId(resultSet.getInt(1));
                    data.setCustomerName(resultSet.getString(2));
                    data.setContactName(resultSet.getString(3));
                    data.setAddress(resultSet.getString(4));
                    data.setCity(resultSet.getString(5));
                    data.setPostalCode(resultSet.getString(6));
                    data.setCountry(resultSet.getString(7));
                    customerList.add(data);
                }
            }
            model.addAttribute("customerList", customerList);
        }


        String sql = "SELECT DISTINCT Country FROM Customers";
        var countryList = new ArrayList<String>();
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery(sql);

        try (con; stmt; rs;) {
            while (rs.next()) {
                countryList.add(rs.getString(1));
            }
        }
        model.addAttribute("countryList", countryList);

        return "main25/sub4CustomerList";
    }

    @GetMapping("sub3")
    public String method3(String[] categoryId, Model model) throws Exception {
        Connection conn = dataSource.getConnection();

        if (categoryId != null && categoryId.length > 0) {
            String questionMarks = "";
            for (int i = 0; i < categoryId.length; i++) {
                questionMarks = questionMarks + "?";
                if (i != categoryId.length - 1) {
                    questionMarks = questionMarks + ",";
                }
            }
            String sql = STR."""
            SELECT *
            FROM Products
            WHERE CategoryId IN (\{questionMarks})
            ORDER BY CategoryId, Price
            """;
            PreparedStatement pstmt = conn.prepareStatement(sql);
            for (int i = 0; i < categoryId.length; i++) {
                pstmt.setString((i + 1), categoryId[i]);
            }
            ResultSet resultSet = pstmt.executeQuery();
            var productList = new ArrayList<MyBean256ProductList>();

            try (pstmt; resultSet) {
                while (resultSet.next()) {
                    MyBean256ProductList list = new MyBean256ProductList();
                    list.setProductId(resultSet.getInt(1));
                    list.setProductName(resultSet.getString(2));
                    list.setSupplierId(resultSet.getInt(3));
                    list.setCategoryId(resultSet.getInt(4));
                    list.setUnit(resultSet.getString(5));
                    list.setPrice(resultSet.getDouble(6));

                    productList.add(list);
                }
            }
            model.addAttribute("prevCategoryId", categoryId);
            model.addAttribute("productList", productList);

        }


        String categorySql = "SELECT * FROM Categories";
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery(categorySql);
        var categoryList = new ArrayList<MyBean263Category>();
        try (conn; rs; stmt;) {
            while (rs.next()) {
                MyBean263Category cat = new MyBean263Category();
                cat.setId(rs.getInt(1));
                cat.setName(rs.getString(2));

                categoryList.add(cat);
            }
            model.addAttribute("categoryList", categoryList);
        }

        return "main25/sub6ProductList";
    }
}
