package com.asm.controller;

import com.asm.dao.GenreDao;
import com.asm.dto.CartDto;
import com.asm.entity.Genre;
import com.asm.service.CartService;
import com.asm.service.UserService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import jakarta.servlet.http.HttpSession;

@Controller
public class CartController {
	@Autowired
	private GenreDao genreDao;

	@Autowired
	private CartService cartService;

	@Autowired
	UserService userService;

	@RequestMapping("/cart")
	public String getCart(HttpSession session, Model model) {
		List<Genre> genres = genreDao.findAll();
		model.addAttribute("genres", genres);
		CartDto cart = (CartDto) session.getAttribute("cart");
		if (cart == null) {
			cart = cartService.createCart(null);
			session.setAttribute("cart", cart);
		}
		model.addAttribute("cart", cart);
		return "cart";
	}

	@PostMapping("/cart/add/{userId}/{gameId}/{quantity}")
	public String addToCart(@PathVariable(value = "userId", required = false) Integer userId,
			@PathVariable("gameId") Integer gameId, @PathVariable("quantity") int quantity, HttpSession session,
			RedirectAttributes redirectAttributes) {
		CartDto cart = (CartDto) session.getAttribute("cart");
		if (cart == null) {
			cart = cartService.createCart(userId);
		}

		cartService.addToCart(cart, userId, gameId, quantity); // Thêm sản phẩm vào giỏ hàng hiện tại
		session.setAttribute("cart", cart);

		// Sử dụng flash attribute để truyền thông điệp
		redirectAttributes.addFlashAttribute("message", "Đã thêm vào giỏ hàng thành công");

		return "redirect:/cart";
	}

	@PostMapping("/cart/updateQuantity")
	public CartDto updateItemQuantity(@RequestParam("gameId") Integer gameId, @RequestParam("quantity") int quantity,
			HttpSession session) {
		CartDto cart = (CartDto) session.getAttribute("cart");
		if (cart != null) {
			cartService.updateItemQuantity(cart, gameId, quantity);
			session.setAttribute("cart", cart);
		}
		return cart;
	}

	@PostMapping("/cart/removeItem")
	public CartDto removeItemFromCart(@RequestParam("gameId") Integer gameId, HttpSession session) {
		CartDto cart = (CartDto) session.getAttribute("cart");
		if (cart != null) {
			cartService.removeItemFromCart(cart, gameId);
			session.setAttribute("cart", cart);
		}
		return cart;
	}

	@GetMapping("/checkout/{userId}")
	public String checkout(HttpSession session, Model model,
			@PathVariable("userId") Integer userId, 
			 RedirectAttributes redirectAttributes) {
		CartDto cart = (CartDto) session.getAttribute("cart");
		if (cart != null) {
			cartService.checkout(cart, userId);
			/* session.removeAttribute("cart"); */
			redirectAttributes.addFlashAttribute("cart", cart);
		}
		return "redirect:/vnpaycreate";
	}
	
}
