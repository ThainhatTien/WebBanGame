package com.asm.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.IdClass;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "game_genres")
public class GameGenre {
	@Id
	@ManyToOne
	@JoinColumn(name = "game_id")
	private Game game;

	@Id
	@ManyToOne
	@JoinColumn(name = "genre_id")
	private Genre genre;

	// Getters và Setters
}
