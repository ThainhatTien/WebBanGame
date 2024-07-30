package com.asm.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.asm.entity.Genre;

public interface GenreDao extends JpaRepository<Genre, Integer>{

}
