package com.asm.dto;

import java.io.Serializable;
import java.util.HashMap;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Data

public class CartDto implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Integer userId;
	private Integer totalAmount;
	private HashMap<Integer, CartDetailDto> detail = new HashMap<>();

	@Override
	public String toString() {
		return "CartDto{" + "userId=" + userId + ", totalAmount=" + totalAmount + ", detail=" + detail + '}';
	}
}
