package com.daidonef.hobbiedata;

import java.util.Date;

public class Item {
	
	private int itemID;
	private int accountID;
	private String hobby;
	private String genre;
	private String item;
	private double timeSpent;
	private Date dateStarted;
	private Date lastDone;
	private double rating;
	private String description;
	
	public Item() {
		
	}
	
	public Item(int accountID, String hobbie, String item) {
		this.accountID = accountID;
		this.hobby = hobbie;
		this.item = item;
	}

	public int getItemID() {
		return itemID;
	}

	public int getAccountID() {
		return accountID;
	}

	public String getHobbie() {
		return hobby;
	}

	public String getGenre() {
		return genre;
	}

	public String getItem() {
		return item;
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

	public void setItemID(int itemID) {
		this.itemID = itemID;
	}

	public void setAccountID(int accountID) {
		this.accountID = accountID;
	}

	public void setHobbie(String hobbie) {
		this.hobby = hobbie;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	public void setItem(String item) {
		this.item = item;
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
