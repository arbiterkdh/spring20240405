package com.study.core;

import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.stereotype.Component;

@SpringBootApplication
public class Application16 {
    public static void main(String[] args) {
        BeanFactory bf = SpringApplication.run(Application16.class, args);
        bf.getBean(MyClass161.class).action();

    }

}

@Component
@RequiredArgsConstructor
class MyClass161 {
    private final MyInterface161 field;

    public void action() {
        field.someMethod();
    }
}

interface MyInterface161 {
    public void someMethod();
}

@Component
class MyClass163 implements MyInterface161 {
    public void someMethod() {
        System.out.println("some action222222222222222222222222222222");
    }
}

//@Component
class MyClass162 implements MyInterface161 {
    public void someMethod() {
        System.out.println("some action11111111111111111111111111111111");
    }
}
