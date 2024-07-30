package com.asm.dao;


import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.asm.entity.Game;
import com.asm.entity.GenreRevenueReport;

public interface GameDao extends JpaRepository<Game, Integer>{
	 Optional<Game> findByTitle(String title);
	 List<Game> findByRatingGreaterThan(float rating);
	 @Query("SELECT g FROM Game g JOIN g.genres gen WHERE gen.name = :genreName")
	 Page<Game> findGamesByGenreName(@Param("genreName") String genreName, Pageable pageable);
	 @Query("SELECT g FROM Game g WHERE g.title LIKE %:keywords%")
	 List<Game>findByKeywords(@Param("keywords") String keywords);
	 @Query("SELECT new com.asm.entity.GenreRevenueReport(genre.name, SUM(g.price), COUNT(g)) FROM Game g JOIN g.genres genre GROUP BY genre.name")
	 List<GenreRevenueReport> calculateGenreRevenueReport();
}
