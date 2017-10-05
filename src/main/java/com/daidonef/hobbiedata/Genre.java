package com.daidonef.hobbiedata;

import java.util.Date;

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
	
	public Genre(int userID, String hobbie, String genre) {
		this.accountID = userID;
		this.hobby = hobbie;
		this.genre = genre;
	}

	public int getGenreID() {
		return genreID;
	}

	public int getUserID() {
		return accountID;
	}

	public String getHobbie() {
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

	public void setUserID(int userID) {
		this.accountID = userID;
	}

	public void setHobbie(String hobbie) {
		this.hobby = hobbie;
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

}
