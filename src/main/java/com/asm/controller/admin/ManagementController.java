package com.asm.controller.admin;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.asm.dao.GameDao;
import com.asm.dao.GenreDao;
import com.asm.dao.UserDao;
import com.asm.entity.Game;
import com.asm.entity.Genre;
import com.asm.entity.User;

import jakarta.servlet.ServletContext;

@Controller
public class ManagementController {
	@Autowired
	private UserDao userDao;
	@Autowired
	private GameDao gameDao;
	@Autowired
	private GenreDao genreDao;
	@Autowired
	ServletContext app;

	/* User */
	@RequestMapping("/admin/user/{userid}")
	public String editUser(Model model, @PathVariable("userid") Integer userid) {
		User user = userDao.findById(userid).get();
		model.addAttribute("user", user);
		List<User> list = userDao.findAll();
		model.addAttribute("users", list);
		return "admin/index";
	}

	@RequestMapping("/admin/user/update")
	public String updateUser(User user) {
		userDao.save(user);
		return "redirect:/index/user/admin";
	}

	@RequestMapping("/admin/user/delete/{userid}")
	public String deleteUser(@PathVariable("userid") Integer userid) {
		userDao.deleteById(userid);
		return "redirect:/index/user/admin";
	}

	/* Game */

	@RequestMapping("/admin/game/{gameId}")
	public String editGame(Model model, @PathVariable("gameId") Integer gameId) {
		Game game = gameDao.findById(gameId).get();
		model.addAttribute("game", game);
		List<Game> list = gameDao.findAll();
		model.addAttribute("games", list);

		// Add genres list to the model
		List<Genre> genres = genreDao.findAll();
		model.addAttribute("genres", genres);

		// Log the genres list for debugging
		System.out.println("Genres: " + genres);

		return "admin/gamemanager";
	}

	@RequestMapping("/admin/game/update")
	public String updateGame(Game game) {
		gameDao.save(game);
		return "redirect:/index/game/admin";
	}

	@RequestMapping("/admin/game/reset")
	public String resetGame() {
		return "redirect:/index/game/admin";
	}

	@RequestMapping("/admin/game/delete/{gameId}")
	public String deleteGame(@PathVariable("gameId") Integer gameId) {
		gameDao.deleteById(gameId);
		return "redirect:/index/game/admin";
	}

	/* Genre */

	@RequestMapping("/admin/genre/{genreId}")
	public String editGenre(Model model, @PathVariable("genreId") Integer genreId) {
		Genre genre = genreDao.findById(genreId).get();
		model.addAttribute("genre", genre);
		List<Genre> list = genreDao.findAll();
		model.addAttribute("genres", list);
		return "admin/genremanager";
	}

	@RequestMapping("/admin/genre/update")
	public String updateGenre(Genre genre) {
		genreDao.save(genre);
		return "redirect:/index/genre/admin";
	}

	@RequestMapping("/admin/genre/reset")
	public String resetGenre() {
		return "redirect:/index/genre/admin";
	}

	@RequestMapping("/admin/genre/delete/{genreId}")
	public String deleteGenre(@PathVariable("genreId") Integer genreId) {
		genreDao.deleteById(genreId);
		return "redirect:/index/genre/admin";
	}
}
