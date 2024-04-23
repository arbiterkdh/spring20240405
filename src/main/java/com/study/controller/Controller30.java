package com.study.controller;

import com.study.domain.MyBean254Customers;
import com.study.domain.MyBean258Employees;
import com.study.mapper.Mapper01;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@Controller
@RequestMapping("main30")
public class Controller30 {
    @Autowired
    private DataSource dataSource;

    // 직접 만든 객체(dependency)
//    private Mapper01 mapper = new Mapper01();

    // Inversion Of Control(IOC)
    // Dependency Injection(DI)
    @Autowired
    private Mapper01 mapper;

    @GetMapping("sub1")
    public void method1(Integer id, Model model) throws SQLException {
        MyBean254Customers c = mapper.getCustomerById(id);
        model.addAttribute("customer", c);
    }

    @PostMapping("sub1/update")
    public String update1(MyBean254Customers customer, RedirectAttributes rttr) throws SQLException {
        String sql = """
                UPDATE Customers
                SET CustomerName = ?,
                    ContactName  = ?,
                    Address      = ?,
                    City         = ?,
                    PostalCode   = ?,
                    Country      = ?
                WHERE CustomerID = ?
                """;
        Connection conn = dataSource.getConnection();
        PreparedStatement pstmt = conn.prepareStatement(sql);

        try (conn; pstmt;) {
            pstmt.setString(1, customer.getCustomerName());
            pstmt.setString(2, customer.getContactName());
            pstmt.setString(3, customer.getAddress());
            pstmt.setString(4, customer.getCity());
            pstmt.setString(5, customer.getPostalCode());
            pstmt.setString(6, customer.getCountry());
            pstmt.setInt(7, customer.getCustomerId());

            int rowCount = pstmt.executeUpdate();
            if (rowCount > 0) {
                rttr.addFlashAttribute("message", customer.getCustomerId() + "번 고객의 정보가 수정되었습니다.");
            } else {
                rttr.addFlashAttribute("message", "고객 정보 수정에 실패했습니다.");
            }
        }
        rttr.addAttribute("customerId", customer.getCustomerId());

        return "redirect:/main30/sub1";
    }

    // todo : 직원 조회 및 수정

    @GetMapping("sub2")
    public void method2(Integer id, Model model) throws SQLException {
        if (id != null) {
            String sql = """
                    SELECT *
                    FROM Employees
                    WHERE EmployeeID = ?
                    """;

            Connection conn = dataSource.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();

            try (conn; pstmt; rs;) {
                if (rs.next()) {
                    MyBean258Employees e = new MyBean258Employees();
                    e.setEmployeeId(rs.getInt(1));
                    e.setLastName(rs.getString(2));
                    e.setFirstName(rs.getString(3));
                    e.setBirthDate(rs.getString(4));
                    e.setPhoto(rs.getString(5));
                    e.setNotes(rs.getString(6));

                    model.addAttribute("employee", e);
                }
            }
        }
    }

    @PostMapping("sub2/update")
    public String update2(MyBean258Employees e, RedirectAttributes rttr) throws SQLException {
        String sql = """
                UPDATE Employees
                SET    LastName =  ?,
                       FirstName = ?,
                       BirthDate = ?,
                       Photo =     ?,
                       Notes =     ?
                WHERE EmployeeID = ?
                """;

        Connection conn = dataSource.getConnection();
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, e.getLastName());
        pstmt.setString(2, e.getFirstName());
        pstmt.setString(3, e.getBirthDate());
        pstmt.setString(4, e.getPhoto());
        pstmt.setString(5, e.getNotes());
        pstmt.setInt(6, e.getEmployeeId());

        try (conn; pstmt;) {
            int rowCount = pstmt.executeUpdate();
            if (rowCount > 0) {
                rttr.addFlashAttribute("message", e.getEmployeeId() + "번 직원의 정보가 수정됐습니다.");
            } else {
                rttr.addFlashAttribute("message", "직원 정보 수정에 실패했습니다.");
            }
        }
        rttr.addAttribute("employeeId", e.getEmployeeId());

        return "redirect:/main30/sub2";
    }
}
