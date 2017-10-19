package com.daidonef.hobbiedata;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

public class Hobbies {
	
	private int hobbyID;
	private int accountID;
	private String hobby;
	private double timeSpent;
	private Date dateStarted;
	private Date lastDone;
	private double rating;
	private String description;
	
	public Hobbies(int userID, String hobby) {
		this.accountID = userID;
		this.hobby = hobby;
	}

	public int getHobbieID() {
		return hobbyID;
	}

	public int getUserID() {
		return accountID;
	}

	public String getHobby() {
		return hobby;
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

	public void setHobbieID(int hobbieID) {
		this.hobbyID = hobbieID;
	}

	public void setUserID(int userID) {
		this.accountID = userID;
	}

	public void setHobby(String hobby) {
		this.hobby = hobby;
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
	
	//Stores all hobbies for an account holder
	public static List<Hobbies> accessHobbies(Account account, Model model, HttpSession session) {
		
		List<Hobbies> hobbies = HobbiesDAO.getHobbies(HobbiesQuery.gettingHobbies(account.getAccountID()));
		
		session.setAttribute("hobbies", hobbies);
		model.addAttribute("hobbies", hobbies);
		
		return hobbies;
	}
	
}
