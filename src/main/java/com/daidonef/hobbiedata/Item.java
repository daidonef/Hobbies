package com.daidonef.hobbiedata;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.daidonef.hobbies.DateFormatting;

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
	
	public Item(int accountID, String hobby, String item) {
		this.accountID = accountID;
		this.hobby = hobby;
		this.item = item;
	}

	public int getItemID() {
		return itemID;
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

	public void setHobby(String hobby) {
		this.hobby = hobby;
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
	
	public static List<Item> accessItem(Account account, Model model, HttpSession session) {
		
		List<Item> items = ItemDAO.getItem(ItemQuery.gettingItems(account.getAccountID()));
		
		session.setAttribute("items", items);
		model.addAttribute("items", items);
		
		return items;
	}
	
	public static void addItem(HttpServletRequest request, HttpSession session) {
		
		if (noItem(request, session)) {
			Item item = new Item(((Account)session.getAttribute("account")).getAccountID(),
					request.getParameter("hobbyI"), request.getParameter("genreI"));
			item = addInfoItem(item, request);
			ItemDAO.addItem(item);
		}
		
	}
	
	private static boolean noItem(HttpServletRequest request, HttpSession session) {
		
		List<Item> items = (ArrayList<Item>) session.getAttribute("items");
		
		for (Item item : items) {
			if (item.getItem().equals(request.getParameter("item"))) {
				return false;
			}
		}
		return true;
	}
	
	private static Item addInfoItem(Item item, HttpServletRequest request) {
		
		if (request.getParameter("timeSpentI") != null) {
			item.setTimeSpent(Double.parseDouble(request.getParameter("timeSpentI")));
		}
		if (request.getParameter("dateStartedI") != null) {
			DateFormatting dateFormat = new DateFormatting(request.getParameter("dateStartedI"));
			item.setDateStarted(dateFormat.getDate());
		}
		if (request.getParameter("lastDoneI") != null) {
			DateFormatting dateFormat = new DateFormatting(request.getParameter("lastDoneI"));
			item.setLastDone(dateFormat.getDate());
		}
		if (request.getParameter("ratingI") != null) {
			item.setRating(Double.parseDouble(request.getParameter("ratingI")));
		}
		if (request.getParameter("descriptionI") != null) {
			item.setDescription(request.getParameter("descriptionI"));
		}
		
		return item;
	}
	
}
