package com.daidonef.hobbiedata;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.daidonef.hobbies.DateFormatting;

public class Genre {
	
	private int genreID;
	private int accountID;
	private String hobby;
	private String genre;
	private double timeSpent;
	private Date dateStarted;
	private Date lastDone;
	private double rating;
	private String description;
	
	public Genre() {
		
	}
	
	public Genre(int accountID, String hobby, String genre) {
		this.accountID = accountID;
		this.hobby = hobby;
		this.genre = genre;
	}

	public int getGenreID() {
		return genreID;
	}

	public int getAccountID() {
		return accountID;
	}

	public String getHobby() {
		return hobby;
	}

	public String getGenre() {
		return genre;
	}

	public double getTimeSpent() {
		return timeSpent;
	}

	public Date getDateStarted() {
		return dateStarted;
	}

	public Date getLastDone() {
		return lastDone;
	}

	public double getRating() {
		return rating;
	}

	public String getDescription() {
		return description;
	}

	public void setGenreID(int genreID) {
		this.genreID = genreID;
	}

	public void setAccountID(int accountID) {
		this.accountID = accountID;
	}

	public void setHobby(String hobby) {
		this.hobby = hobby;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	public void setTimeSpent(double timeSpent) {
		this.timeSpent = timeSpent;
	}

	public void setDateStarted(Date dateStarted) {
		this.dateStarted = dateStarted;
	}

	public void setLastDone(Date lastDone) {
		this.lastDone = lastDone;
	}

	public void setRating(double rating) {
		this.rating = rating;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	
	public static List<Genre> accessGenres(Account account, Model model, HttpSession session) {
		
		List<Genre> genres = GenreDAO.getGenre(GenreQuery.gettingGenres(account.getAccountID()));
		
		session.setAttribute("genres", genres);
		model.addAttribute("genres", genres);
		
		return genres;
	}
	
	public static void addGenre(HttpServletRequest request, HttpSession session) {
		
		if (noGenre(request, session)) {
			Genre genre = new Genre(((Account)session.getAttribute("account")).getAccountID(),
					request.getParameter("hobbyG"), request.getParameter("genre"));
			genre = addInfoGenre(genre, request);
			GenreDAO.addGenre(genre);
		}
		
	}
	
	private static boolean noGenre(HttpServletRequest request, HttpSession session) {
		
		List<Genre> genres = (ArrayList<Genre>) session.getAttribute("genres");
		
		for (Genre genre : genres) {
			if (genre.getGenre().equals(request.getParameter("genre"))) {
				return false;
			}
		}
		return true;
	}
	
	private static Genre addInfoGenre(Genre genre, HttpServletRequest request) {
		
		if (request.getParameter("timeSpentG") != null) {
			genre.setTimeSpent(Double.parseDouble(request.getParameter("timeSpentG")));
		}
		if (request.getParameter("dateStartedG") != null) {
			DateFormatting dateFormat = new DateFormatting(request.getParameter("dateStartedG"));
			genre.setDateStarted(dateFormat.getDate());
		}
		if (request.getParameter("lastDoneG") != null) {
			DateFormatting dateFormat = new DateFormatting(request.getParameter("lastDoneG"));
			genre.setLastDone(dateFormat.getDate());
		}
		if (request.getParameter("ratingG") != null) {
			genre.setRating(Double.parseDouble(request.getParameter("ratingG")));
		}
		if (request.getParameter("descriptionG") != null) {
			genre.setDescription(request.getParameter("descriptionG"));
		}
		
		return genre;
	}

}
