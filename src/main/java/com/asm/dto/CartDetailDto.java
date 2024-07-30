package com.asm.dto;

import java.io.Serializable;
import java.math.BigDecimal;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
@AllArgsConstructor
public class CartDetailDto implements Serializable{
    private Integer gameId;
    private String title;
    private BigDecimal price;
    private int quantity;
 
}
