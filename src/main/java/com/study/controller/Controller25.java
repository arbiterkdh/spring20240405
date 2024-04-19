package com.study.controller;

import com.study.domain.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;

@Controller
@RequestMapping("main25")
public class Controller25 {
    @Autowired
    private DataSource dataSource;

    @GetMapping("sub1")
    public void method1(Model model,
                        @RequestParam(value = "name", required = false) String searchName) throws Exception {
        var list = new ArrayList<MyBean251>();
        String sql = STR."""
                SELECT *
                FROM Employees
                WHERE LastName = '\{searchName}'
                """;
        Statement stmt = dataSource.getConnection().createStatement();
        ResultSet rs = stmt.executeQuery(sql);
        try (stmt; rs;) {
            while (rs.next()) {
                String id = rs.getString(1);
                String lastName = rs.getString(2);
                String firstName = rs.getString(3);
                String birthDate = rs.getString(4);
                String photo = rs.getString(5);
                String notes = rs.getString(6);

                MyBean251 obj =
                        new MyBean251(id, lastName, firstName, birthDate, photo, notes);
                list.add(obj);
            }
        }
        model.addAttribute("employees", list);
    }

    @GetMapping("sub2")
    public void method2(@RequestParam(value = "name", required = false) String search, Model model) throws Exception {
        // todo : name 요청 파라미터와 일치하는 상품명으로 상품 (Products) 조회
        //  예) SELECT * FROM Products WHERE ProductName = 'Chais'
        var list = new ArrayList<MyBean252>();
        String sql = STR."""
                SELECT *
                FROM Products
                WHERE ProductName = '\{search}'
                """;

        Statement stmt = dataSource.getConnection().createStatement();
        ResultSet rs = stmt.executeQuery(sql);
        try (stmt; rs;) {
            while (rs.next()) {
                String id = rs.getString(1);
                String name = rs.getString(2);
                String unit = rs.getString(5);
                String price = rs.getString(6);
                list.add(new MyBean252(id, name, unit, price));
            }
        }
        model.addAttribute("products", list);
    }

    @GetMapping("sub3")
    public void method3(String search, Model model) throws Exception {
        var list = new ArrayList<MyBean252>();
        String sql = """
                SELECT *
                FROM Products
                WHERE ProductName = ?
                """;

        Connection con = dataSource.getConnection();
        PreparedStatement pstmt = con.prepareStatement(sql);
        // 첫번째 파라미터 : 물음표 위치
        // 두번째 파라미터 : 넣을 값
        pstmt.setString(1, search);
        ResultSet rs = pstmt.executeQuery();
        try (rs) {
            while (rs.next()) {
                String id = rs.getString(1);
                String name = rs.getString(2);
                String unit = rs.getString(5);
                String price = rs.getString(6);
                list.add(new MyBean252(id, name, unit, price));
            }
        }
        model.addAttribute("products", list);
    }

    // todo : 고객 이름을 입력 받아서 고객 정보 조회
    //  sub4 메소드와 sub4.jsp 작성
    //  예)SELECT * FROM Customers WHERE CustomerName = ?

    @GetMapping("sub4")
    public String method4(String name, Model model) throws Exception {
        var list = new ArrayList<MyBean254Customers>();
        String sql = """
                SELECT *
                FROM Customers
                WHERE CustomerName = ?
                """;
        PreparedStatement pstmt = dataSource.getConnection().prepareStatement(sql);
        pstmt.setString(1, name);
        ResultSet rs = pstmt.executeQuery();

        try (pstmt; rs;) {
            while (rs.next()) {
                int customerId = rs.getInt(1);
                String customerName = rs.getString(2);
                String contactName = rs.getString(3);
                String address = rs.getString(4);
                String city = rs.getString(5);
                String postalCode = rs.getString(6);
                String country = rs.getString(7);
                list.add(new MyBean254Customers(
                        customerId, customerName, contactName, address, city, postalCode, country));
            }
        }
        model.addAttribute("customerList", list);
        model.addAttribute("search", name);
        return "main25/sub4CustomerList";
    }

    @GetMapping("sub5")
    public String method5(String name, Model model) throws Exception {
        var list = new ArrayList<MyBean254Customers>();
        String sql = """
                SELECT * FROM Customers
                WHERE CustomerName LIKE ?
                """;
        String keyword = "%" + name + "%";

        PreparedStatement pstmt = dataSource.getConnection().prepareStatement(sql);
        pstmt.setString(1, keyword);
        ResultSet rs = pstmt.executeQuery();
        try (pstmt; rs;) {
            while (rs.next()) {
                int customerId = rs.getInt(1);
                String customerName = rs.getString(2);
                String contactName = rs.getString(3);
                String address = rs.getString(4);
                String city = rs.getString(5);
                String postalCode = rs.getString(6);
                String country = rs.getString(7);
                list.add(new MyBean254Customers(
                        customerId, customerName, contactName, address, city, postalCode, country));
            }
        }
        model.addAttribute("customerList", list);
        model.addAttribute("search", name);
        return "main25/sub4CustomerList";
    }

    @GetMapping("sub6")
    public String method6(String name, Model model) throws SQLException {
        var list = new ArrayList<MyBean256ProductList>();
        String sql = """
                SELECT * FROM Products
                WHERE ProductName LIKE ?
                """;
        String keyword = "%" + name + "%";

        PreparedStatement pstmt = dataSource.getConnection().prepareStatement(sql);
        pstmt.setString(1, keyword);
        ResultSet rs = pstmt.executeQuery();

        try (pstmt; rs;) {
            while (rs.next()) {

                int productId = rs.getInt(1);
                String productName = rs.getString(2);
                int supplierName = rs.getInt(3);
                int categoryId = rs.getInt(4);
                String unit = rs.getString(5);
                double price = rs.getDouble(6);
                list.add(new MyBean256ProductList(
                        productId, productName, supplierName, categoryId, unit, price));
            }
        }
        model.addAttribute("productList", list);
        model.addAttribute("search", name);

        return "main25/sub6ProductList";
    }

    // 조회 문자열이 contactName 또는 customerName 에 포함된 고객들 조회
    @GetMapping("sub7")
    public String method7(String name, Model model) throws SQLException {
        var list = new ArrayList<MyBean254Customers>();
        String sql = """
                SELECT * FROM Customers
                WHERE CustomerName LIKE ?
                OR ContactName LIKE ?
                """;

        String keyword = "%" + name + "%";
        PreparedStatement pstmt = dataSource.getConnection().prepareStatement(sql);
        pstmt.setString(1, keyword);
        pstmt.setString(2, keyword);
        ResultSet rs = pstmt.executeQuery();
        try (pstmt; rs;) {
            while (rs.next()) {
                int customerId = rs.getInt(1);
                String customerName = rs.getString(2);
                String contactName = rs.getString(3);
                String address = rs.getString(4);
                String city = rs.getString(5);
                String postalCode = rs.getString(6);
                String country = rs.getString(7);
                list.add(new MyBean254Customers(
                        customerId, customerName, contactName, address, city, postalCode, country));
            }
        }
        model.addAttribute("customerList", list);
        model.addAttribute("search", name);
        return "main25/sub4CustomerList";
    }

    // todo :
    //  조회 문자열이 last name 또는 first name 에 포함된 직원들 조회 메소드 작성

    @GetMapping("sub8")
    public String method8(String name, Model model) throws SQLException {
        var list = new ArrayList<MyBean258Employees>();
        String sql = "SELECT * FROM Employees WHERE LastName LIKE ? OR FirstName LIKE ?";

        String keyword = "%" + name + "%";
        PreparedStatement pstmt = dataSource.getConnection().prepareStatement(sql);
        pstmt.setString(1, keyword);
        pstmt.setString(2, keyword);
        ResultSet rs = pstmt.executeQuery();

        try (pstmt; rs;) {
            while (rs.next()) {
                int employeeId = rs.getInt(1);
                String lastName = rs.getString(2);
                String firstName = rs.getString(3);
                String birthDate = rs.getString(4);
                String photo = rs.getString(5);
                String notes = rs.getString(6);
                list.add(new MyBean258Employees(
                        employeeId, lastName, firstName, birthDate, photo, notes
                ));
            }
        }
        model.addAttribute("employees", list);
        model.addAttribute("search", name);
        return "main25/sub8EmployeeList";
    }
}
