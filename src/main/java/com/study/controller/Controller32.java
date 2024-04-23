package com.study.controller;

import com.study.domain.MyBean254Customers;
import com.study.domain.MyBean258Employees;
import com.study.mapper.Mapper02;
import com.study.mapper.Mapper03;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequiredArgsConstructor
@RequestMapping("main32")
public class Controller32 {
    private final Mapper03 mapper;
    private final Mapper02 mapper02;

    @RequestMapping("sub1")
    public void method1() {
        int rowCount = mapper.deleteOneCustomer();
        System.out.println(rowCount + " rows deleted");
    }

    @RequestMapping("sub2")
    public void method2(Integer id) {
        int rowCount = mapper.deleteOneCustomerById(id);
        System.out.println(rowCount + " rows deleted");
    }

    // todo :
    //  /main32/sub3?eid=2
    //  2번 직원 삭제하는 메소드와 mapper 에 메소드 작성하기
    @GetMapping("sub3")
    public void method3(Integer eid) {
        int rowCount = mapper.deleteOneEmployeeById(eid);
        System.out.println(rowCount + " rows deleted");
    }

    // name=흥민&contactName=캡틴&city=런던&country=한국&address=토트넘
    @GetMapping("sub4")
    public void method4(MyBean254Customers customers) {
        mapper.insertCustomer(customers);

    }

    // todo : 직원 입력 코드 작성하기
    @GetMapping("sub5")
    public void method5(MyBean258Employees e) {
        mapper.insertEmployee(e);
    }

    @GetMapping("sub6")
    public void method6(@RequestParam(value = "id", required = false) Integer eid,
                        Model model) {
        if (eid != null) {
            MyBean258Employees e = mapper02.selectOneEmployee2(eid);
            model.addAttribute("employee", e);
        }

    }

    // todo : 고객 조회 후 수정

    @GetMapping("sub7")
    public void method7(@RequestParam(value = "customer", required = false) Integer id,
                        Model model) {
        MyBean254Customers customers = mapper02.selectOneCustomer4(id);
        model.addAttribute("customer", customers);
    }

    @PostMapping("sub7/update")
    public String method8(MyBean254Customers customers, RedirectAttributes rttr) {
        int rowCount = mapper02.updateOneCustomerById(customers);

        if (rowCount > 0) {
            rttr.addFlashAttribute("message", rowCount + "명의 고객 정보가 수정됐습니다.");
            rttr.addAttribute("customer", customers.getCustomerId());
        } else {
            rttr.addFlashAttribute("message", "고객 정보가 수정되지 않았습니다.");
        }
        return "redirect:/main32/sub7";
    }
}
