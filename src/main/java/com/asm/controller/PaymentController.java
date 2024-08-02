package com.asm.controller;

import com.asm.config.Config;
import com.asm.dto.CartDto;
import com.asm.service.PaymentService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

@Controller
public class PaymentController {
	@Autowired
	private PaymentService paymentService;

	@RequestMapping("/vnpaycreate")
	public String createPayment(HttpServletRequest req, HttpSession session, Model model, @ModelAttribute("cart") CartDto cart) throws Exception {
		String paymentUrl = paymentService.createPayment(req, cart);
		model.addAttribute("paymentUrl", paymentUrl);
		return "vnpay_jsp/vnpay_pay"; // Đường dẫn tới tệp JSP vnpay_pay.jsp
	}

	@RequestMapping("/vnpayreturn")
	public String returnPayment(HttpServletRequest req, Model model) {
		Map<String, String> fields = new HashMap<>();
		for (Enumeration<String> params = req.getParameterNames(); params.hasMoreElements();) {
			String fieldName = params.nextElement();
			String fieldValue = req.getParameter(fieldName);
			if (fieldValue != null && fieldValue.length() > 0) {
				fields.put(fieldName, fieldValue);
			}
		}

		String vnp_SecureHash = req.getParameter("vnp_SecureHash");
		fields.remove("vnp_SecureHashType");
		fields.remove("vnp_SecureHash");

		String signValue = Config.hashAllFields(fields);
		String transactionStatus = req.getParameter("vnp_TransactionStatus");

		model.addAttribute("fields", fields);
		model.addAttribute("isValidSignature", signValue.equals(vnp_SecureHash));
		model.addAttribute("transactionStatus", transactionStatus);
		return "vnpay_jsp/vnpay_return"; // Đường dẫn tới tệp JSP vnpay_return.jsp
	}

	/*@RequestMapping("/vnpay_ipn")
	@ResponseBody
	public String handleIPN(HttpServletRequest req) throws Exception {
		// Xử lý IPN từ VNPAY (nếu có)
		String ipnResult = paymentService.handleIPN(req);
		return ipnResult;
	}*/
}
