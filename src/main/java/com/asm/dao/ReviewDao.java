package com.asm.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.asm.entity.Review;

public interface ReviewDao extends JpaRepository<Review, Integer>{
	@Query("SELECT r.comment, u.username, u.userId, r.createdAt " +
	           "FROM Review r " +
	           "JOIN r.user u " +
	           "WHERE r.game.gameId = :gameId")
	List<Object[]> findCommentsAndUsernamesByGameId(@Param("gameId") int gameId);

}
