package com.asm.controller;

import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.asm.dao.UserDao;
import com.asm.entity.User;
import com.asm.service.SendMailService;
import com.asm.service.UserService;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class LoginController {
	@Autowired
	UserService userService;
	@Autowired
	SendMailService emailService;
	@Autowired
	UserDao userDao;

	/* Đăng nhập Admin */

	@GetMapping("/login/admin")
	public String displayAdmin(Model model) {
		model.addAttribute("user", new User());
		return "admin/login";
	}

	@PostMapping("/form/admin/login")
	public String loginAdmin(Model model, @ModelAttribute("user") User user, HttpSession session) {
		user = userService.checkLoginAdmin(user.getUsername(), user.getPassword());
		if (user != null) {
			session.setAttribute("currentUser", user);
			return "redirect:/index/user/admin";
		} else {
			model.addAttribute("message", "Login Failed");
			return "admin/login";
		}
		
	}

	/* Đăng xuất admin */

	@RequestMapping("/form/admin/logout")
	public String logoutAdmin(HttpSession session) {
		session.removeAttribute("currentUser");
		return "redirect:/login/admin";
	}

	/* Đăng nhập User */
	@GetMapping("/login/user")
	public String displayUser(Model model) {
		model.addAttribute("user", new User());
		return "login";
	}

	@PostMapping("/form/user/login")
	public String loginUser(Model model, @ModelAttribute("user") User user, HttpSession session, BindingResult result) {
		// Kiểm tra đăng nhập
		user = userService.checkLogin(user.getUsername(), user.getPassword());
		// Kiểm tra lỗi
		if (user == null) {
			// Đăng nhập không thành công
			model.addAttribute("message", "Login Failed");
			return "login";
		}
		// Đăng nhập thành công, thiết lập session và chuyển hướng đến trang chính
		session.setAttribute("currentUser", user);
		return "redirect:/index/home";
	}

	@RequestMapping("/logout")
	public String logoutUser(HttpSession session) {
		session.removeAttribute("cart");
		session.removeAttribute("currentUser");
		return "redirect:/index/home";
	}

	/* Đăng ký User */
	@GetMapping("/signup/user")
	public String displaySignUpUser(Model model, HttpSession session) {
		model.addAttribute("user", new User());
		return "register";
	}

	@PostMapping("/form/user/signup")
	public String signUpUser(Model model, @Valid @ModelAttribute("user") User user, HttpSession session,
				BindingResult result) {
		// Kiểm tra lỗi và xử lý
		if (user.getFullname().isEmpty()||user.getEmail().isEmpty()||user.getPassword().isEmpty()
				||user.getUsername().isEmpty()) {
			model.addAttribute("message", "Sign Up Failed");
			return "register";
		} else {
			// Xử lý khi không có lỗi
			userDao.save(user);
			session.setAttribute("currentUser", user);
			return "redirect:/index/home";
		}
	}


	/* Lấy lại mật khẩu */

	@GetMapping("/user/forgotpass")
	public String forgotpass(Model model) {
		return "forgospass";
	}

	@PostMapping("/form/user/forgotpass")
	public String Sendmail(Model model, @RequestParam("email") String email) {

		String randomPassword = generateRandomPassword();
		userDao.updatePassword(email, randomPassword);
		emailService.sendEmail(email, "Your New Password", "New Pass " + randomPassword);

		System.out.println("New Password: " + randomPassword);
		model.addAttribute("user", new User());
		return "login";
	}

	private String generateRandomPassword() {
		Random random = new Random();
		int password = random.nextInt(9000) + 1000; // Generates a random number between 1000 and 9999
		return String.valueOf(password);
	}

	/* Đăng ký Admin */
	@GetMapping("/signup/admin")
	public String displaySignUpAdmin() {
		return "/admin/signup";
	}

	@PostMapping("/form/admin/singup")
	public String signUpAdmin(Model model, @RequestParam("username") String username,
			@RequestParam("password_1") String password_1, @RequestParam("password_2") String password_2,
			@ModelAttribute("user") User user) {
		if (!password_1.equals(password_2)) {
			model.addAttribute("message", "Different passwords");
			return "admin/signup";
		} else if (username.isEmpty() && password_1.isEmpty() && password_2.isEmpty()) {
			model.addAttribute("message", "Cannot be left blank");
			return "admin/signup";
		} else {
			model.addAttribute("message_user", user.getUsername());
			return "admin/index";
		}
	}
}
