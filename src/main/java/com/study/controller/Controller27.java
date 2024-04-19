package com.study.controller;

import com.study.domain.MyBean254Customers;
import com.study.domain.MyBean258Employees;
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
@RequestMapping("main27")
public class Controller27 {
    @Autowired
    private DataSource dataSource;

    @GetMapping("sub1")
    public String sub1(@RequestParam(defaultValue = "1") Integer page, Model model) throws Exception {
        int offset = (page - 1) * 10;
        String sql = """
                SELECT *
                FROM Customers
                ORDER BY CustomerID
                LIMIT ?, 10
                """;
        Connection conn = dataSource.getConnection();

        // 페이지 정보 산출
        // 총 레코드 수 조회
        String countSql = "SELECT COUNT(*) FROM Customers";
        Statement stmt = conn.createStatement();
        ResultSet rs1 = stmt.executeQuery(countSql);
        int total = 0;
        try (rs1; stmt;) {
            if (rs1.next()) {
                total = rs1.getInt(1);
            }
        }
        // 마지막 페이지 번호
        int lastPageNumber = (total - 1) / 10 + 1;
        model.addAttribute("lastPageNumber", lastPageNumber);

        // 페이지 링크의 begin, end 산출
        int endPageNumber = (((page - 1) / 10) + 1) * 10;
        int beginPageNumber = endPageNumber - 9;

        // endPageNumber 가 최종페이지를 넘을 순 없다.
        endPageNumber = Math.min(endPageNumber, lastPageNumber);

        model.addAttribute("endPageNumber", endPageNumber);
        model.addAttribute("beginPageNumber", beginPageNumber);

        // 다음 버튼 클릭 시 이동해야 하는 페이지 nextPageNumber 산출
        int nextPageNumber = beginPageNumber + 10;
        if (nextPageNumber <= lastPageNumber) {
            model.addAttribute("nextPageNumber", nextPageNumber);
        }

        // 이전 버튼 클릭 시 이동해야 하는 페이지 prevPageNumber 산출
        int prevPageNumber = beginPageNumber - 10;
        if (prevPageNumber >= 1) {
            model.addAttribute("prevPageNumber", prevPageNumber);
        }

        // 현재 페이지
        model.addAttribute("currentPage", page);

        // 고객 레코드 조회

        PreparedStatement ps = conn.prepareStatement(sql);
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


    // todo : 직원 테이블 조회 (paging 처리)
    //  메소드와 jsp 작성
    @GetMapping("sub2")
    public String sub2(@RequestParam(defaultValue = "1") Integer page, Model model) throws SQLException {
        String countSql = STR."""
                    SELECT * 
                    FROM Employees
                    ORDER BY EmployeeID
                    LIMIT ?, 10
                """;
        Connection conn = dataSource.getConnection();

        String sql = "SELECT COUNT(*) FROM Employees";
        int offset = (page - 1) * 10;
        int total = 0;
        Statement stmt = conn.createStatement();
        ResultSet rs1 = stmt.executeQuery(sql);
        try (rs1; stmt;) {
            if (rs1.next()) {
                total = rs1.getInt(1);
            }
        }
        int lastPageNumber = (total - 1) / 10 + 1;
        lastPageNumber = Math.min(lastPageNumber, total);
        model.addAttribute("lastPageNumber", lastPageNumber);


        int beginPageNumber = ((page - 1) / 10) * 10 + 1;
        model.addAttribute("beginPageNumber", beginPageNumber);

        int prevPage = beginPageNumber - 1;
        if (page > 10) {
            model.addAttribute("prevPage", prevPage);
        }

        int endPageNumber = ((page - 1) / 10) * 10 + 10;
        endPageNumber = Math.min(endPageNumber, lastPageNumber);
        model.addAttribute("endPageNumber", endPageNumber);

        int nextPage = endPageNumber + 1;
        if (nextPage <= lastPageNumber / 10 * 10 + 1) {
            model.addAttribute("nextPage", nextPage);
        }
        model.addAttribute("currentPage", page);
        model.addAttribute("pageNumbers", page);


        PreparedStatement pstmt = conn.prepareStatement(countSql);
        pstmt.setInt(1, offset);
        ResultSet rs = pstmt.executeQuery();
        var list = new ArrayList<MyBean258Employees>();
        try (conn; rs; pstmt;) {
            while (rs.next()) {
                MyBean258Employees employees = new MyBean258Employees();
                employees.setEmployeeId(rs.getInt(1));
                employees.setLastName(rs.getString(2));
                employees.setFirstName(rs.getString(3));
                employees.setBirthDate(rs.getString(4));
                employees.setPhoto(rs.getString(5));
                employees.setNotes(rs.getString(6));

                list.add(employees);
            }
        }
        model.addAttribute("employeeList", list);

        return "main27/sub2";
    }
}





