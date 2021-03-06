package com.daidonef.hobbiedata;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.daidonef.hobbies.DateFormatting;

public class Hobbies {
	
	private int hobbyID;
	private int accountID;
	private String hobby;
	private double timeSpent;
	private Date dateStarted;
	private Date lastDone;
	private double rating;
	private String description;
	
	public Hobbies() {
		
	}
	
	public Hobbies(int accountID, String hobby) {
		this.accountID = accountID;
		this.hobby = hobby;
	}

	public int getHobbyID() {
		return hobbyID;
	}

	public int getAccountID() {
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

	public void setHobbyID(int hobbyID) {
		this.hobbyID = hobbyID;
	}

	public void setAccountID(int userID) {
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
	
	public static void addHobbies(HttpServletRequest request, HttpSession session) {
		
		if (noHobby(request, session)) {
			Hobbies hobby = new Hobbies(((Account)session.getAttribute("account")).getAccountID(), 
					request.getParameter("hobby"));
			hobby = addInfoHobby(hobby, request);
			HobbiesDAO.addHobbies(hobby);
		}
	}
	
	private static boolean noHobby(HttpServletRequest request, HttpSession session){
		
		List<Hobbies> hobbies = (ArrayList<Hobbies>) session.getAttribute("hobbies");
		
		for (Hobbies hobby : hobbies) {
			if (hobby.getHobby().equals(request.getParameter("hobby"))) {
				return false;
			}
		}
		return true;
	}
	
	private static Hobbies addInfoHobby(Hobbies hobby, HttpServletRequest request) {
		
		if (request.getParameter("timeSpent") != null) {
			hobby.setTimeSpent(Double.parseDouble(request.getParameter("timeSpent")));
		}
		if (request.getParameter("dateStarted") != null) {
			DateFormatting dateFormat = new DateFormatting(request.getParameter("dateStarted"));
			hobby.setDateStarted(dateFormat.getDate());
		}
		if (request.getParameter("lastDone") != null) {
			DateFormatting dateFormat = new DateFormatting(request.getParameter("lastDone"));
			hobby.setLastDone(dateFormat.getDate());
		}
		if (request.getParameter("rating") != null) {
			hobby.setRating(Double.parseDouble(request.getParameter("rating")));
		}
		if (request.getParameter("description") != null) {
			hobby.setDescription(request.getParameter("description"));
		}
		
		return hobby;
	}
	
}
