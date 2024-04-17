package com.study.domain;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class MyBean255ProductList {
    private int productId;
    private String productName;
    private int supplierId;
    private int categoryId;
    private String unit;
    private double price;
}
