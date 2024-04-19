package com.study.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MyBean256ProductList {
    private int productId;
    private String productName;
    private int supplierId;
    private int categoryId;
    private String unit;
    private double price;
}
