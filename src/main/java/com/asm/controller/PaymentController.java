package com.asm.controller;

import com.asm.dto.CartDto;
import com.asm.service.PaymentService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import java.io.Console;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class PaymentController {
	@Autowired
	private PaymentService paymentService;

	@RequestMapping("/vnpaycreate")
	public String createPayment(HttpServletRequest req, HttpSession session, Model model,@ModelAttribute("cart") CartDto cart) throws Exception {
		String paymentUrl = paymentService.createPayment(req,cart);
		model.addAttribute("paymentUrl", paymentUrl);
		System.out.println(cart);
		return "pay/vnpay_pay";
	}
}
