package com.asm.dto;

import java.io.Serializable;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PayMentDto implements Serializable{
	/*

	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String status;
	private String message;
	private String URL;
}
