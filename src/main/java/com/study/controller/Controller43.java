package com.study.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/api/main43")
public class Controller43 {

    // ResponseEntity 상태코드를 직접 명시 응답할 때
    @GetMapping("sub1")
    @ResponseBody // ResponseEntity 응답일때는 생략 가능
    public ResponseEntity sub1() {
        return ResponseEntity.status(200).build();
    }

    @GetMapping("sub2")
    public ResponseEntity sub2() {
        return ResponseEntity.status(400).build();
    }

    @GetMapping("sub3")
    public ResponseEntity sub3() {
        return ResponseEntity.status(401).build();
    }

    @GetMapping("sub4")
    public ResponseEntity sub4() {
        return ResponseEntity.status(403).build();
    }

    @GetMapping("sub5")
    public ResponseEntity sub5() {
        return ResponseEntity.status(404).build();
    }

    @GetMapping("sub6")
    public ResponseEntity sub6() {
        return ResponseEntity.status(500).build();
    }

    @GetMapping("sub7")
    public ResponseEntity sub7() {
        return ResponseEntity.status(403).build();
    }
}
