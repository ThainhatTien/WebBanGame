package com.asm.controller.admin;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import com.asm.dao.GameDao;
import com.asm.dao.GenreDao;
import com.asm.dao.UserDao;
import com.asm.entity.Game;
import com.asm.entity.Genre;
import com.asm.entity.GenreRevenueReport;
import com.asm.entity.User;
import jakarta.servlet.http.HttpSession;

@Controller
public class HomeAdminController {
	@Autowired
	private UserDao userDao;
	@Autowired
	private GameDao gameDao;
	@Autowired
	private GenreDao genreDao;
	@Autowired
	HttpSession session;

	@GetMapping("/index/user/admin")
	public String index(Model model, HttpSession session) {
		List<User> list = userDao.findAll();
		model.addAttribute("user", new User());
		model.addAttribute("users", list);
		return "admin/index";
	}

	@GetMapping("/index/game/admin")
	public String displayMovie(Model model, HttpSession session) {
		List<Game> list = gameDao.findAll();
		List<Genre> genres = genreDao.findAll();
		model.addAttribute("genres", genres);
		model.addAttribute("game", new Game());
		model.addAttribute("games", list);
		return "admin/gamemanager";
	}

	@GetMapping("/index/genre/admin")
	public String displayGenre(Model model, HttpSession session) {
		List<Genre> list = genreDao.findAll();
		model.addAttribute("genre", new Genre());
		model.addAttribute("genres", list);
		return "admin/genremanager";
	}
	
	@GetMapping("/index/revenue/admin")
	public String showGenreRevenueReport(Model model) {
	    List<GenreRevenueReport> genreRevenueReports = gameDao.calculateGenreRevenueReport();
	    model.addAttribute("genreRevenueReports", genreRevenueReports);
	    return "admin/gamebygenre";
	}
}
