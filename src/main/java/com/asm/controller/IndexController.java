package com.asm.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.asm.dao.GameDao;
import com.asm.dao.GenreDao;
import com.asm.dao.ReviewDao;
import com.asm.dao.UserDao;
import com.asm.entity.Game;
import com.asm.entity.Genre;
import com.asm.entity.Review;
import com.asm.entity.User;

import jakarta.servlet.http.HttpSession;

@Controller
public class IndexController {
	@Autowired
	private GameDao gameDao;
	@Autowired
	private GenreDao genreDao;
	@Autowired
	private ReviewDao reviewDao;
	@Autowired
	private UserDao userDao;
	
	@PostMapping("/review")
	public String review(Model model , @ModelAttribute("review")Review review){
		if (review.getUser() == null) {
			model.addAttribute("message", "Vui lòng đăng nhập");
			return "redirect:/login/user";
		}
		reviewDao.save(review);
		int gameId = review.getGame().getGameId();
	    // Chuyển hướng về trang chi tiết của game
	    return "redirect:/detail/" + gameId;
	}
	
	
	@GetMapping("/index/home")
	public String index(Model model) {
		List<Game> list = gameDao.findAll();
		model.addAttribute("games", list);
		List<Genre> genres = genreDao.findAll();
		model.addAttribute("genres", genres);
		List<Game> listRating = gameDao.findByRatingGreaterThan(9.0f);
		model.addAttribute("gamesRating", listRating);
		return "index";
	}

	@GetMapping("/index/outshop")
	public String outshop(@RequestParam(name = "genreName", required = false) String genreName,
	                      @RequestParam(name = "page", defaultValue = "0") int page,
	                      @RequestParam(name = "size", defaultValue = "8") int size,
	                      Model model) {
	    Page<Game> gamePage;
	    if (genreName != null && !genreName.isEmpty()) {
	        gamePage = gameDao.findGamesByGenreName(genreName, PageRequest.of(page, size));
	    } else {
	        gamePage = gameDao.findAll(PageRequest.of(page, size));
	    }

	    model.addAttribute("games", gamePage.getContent());
	    model.addAttribute("genres", genreDao.findAll());
	    model.addAttribute("size", size);
	    model.addAttribute("currentPage", page);
	    model.addAttribute("totalPages", gamePage.getTotalPages());

	    return "outshop";
	}

	@RequestMapping("/detail/{gameId}")
	public String detail(Model model, @PathVariable("gameId") Integer gameId) {
		List<Genre> genres = genreDao.findAll();
		model.addAttribute("genres", genres);
		Game game = gameDao.findById(gameId).get();
		model.addAttribute("game", game);
		List<Object[]> reviews = reviewDao.findCommentsAndUsernamesByGameId(gameId);
		model.addAttribute("reviews", reviews);
 		model.addAttribute("review", new Review());
		return "detail";
	}

	@GetMapping("/index/search")
	public String seach(Model model, @RequestParam("searchKeyword") String searchKeyword) {
		Game game = gameDao.findByTitle(searchKeyword).get();
		model.addAttribute("game", game);
		List<Object[]> reviews = reviewDao.findCommentsAndUsernamesByGameId(game.getGameId());
		model.addAttribute("reviews", reviews);
 		model.addAttribute("review", new Review());
		return "detail";
	}

	/* sửa thông tin User */
	@RequestMapping("/profile/{userId}")
	public String profile(Model model, @PathVariable("userId") int userId) {
		User user = userDao.findById(userId).get();
		model.addAttribute("user", user);
		return "profile";
	}
	
	@PostMapping("/form/user/profile")
	public String profileUpdate(Model model,@ModelAttribute("user") User user,HttpSession session) {
		userDao.save(user);
		session.setAttribute("currentUser", user);
		return "redirect:/index/home";
	}
	
	/* thanh toán */
	@RequestMapping("/index/order/{userId}")
	public String order(Model model, HttpSession session,@PathVariable("userId")int userId) {
		User user = userDao.findById(userId).get();
		model.addAttribute("user", user.getFullname());
		return"order";
	}
		
}
