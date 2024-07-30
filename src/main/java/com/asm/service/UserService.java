package com.asm.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.asm.dao.UserDao;
import com.asm.entity.User;
@Service
public class UserService {

	@Autowired
	private UserDao userDao;
	
	public User checkLogin(String username, String password) {
		return userDao.findByUsernameAndPassword(username, password);
	}
	
	public User checkLoginAdmin(String username,String password) {
		return userDao.findAdminByUsernameAndPassword(username, password);
	}

	public Optional<User> findById(Integer id) {
        return userDao.findById(id);
	}
}
