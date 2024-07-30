package com.asm.entity;

import java.math.BigDecimal;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class GenreRevenueReport {
	 @Id
	    @GeneratedValue(strategy = GenerationType.IDENTITY)
	    private int id;

	    private String genre;

	    private double totalRevenue;
	    private long quantity;
	    public GenreRevenueReport(String genre, BigDecimal totalRevenue,long quantity) {
	        this.genre = genre;
	        this.totalRevenue = totalRevenue.doubleValue(); // Chuyển đổi BigDecimal sang double
	        this.quantity = quantity;
	    }


}
