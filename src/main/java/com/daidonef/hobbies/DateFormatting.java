package com.daidonef.hobbies;

import java.util.Date;

public class DateFormatting {
	
	private int day;
	private int month;
	private int year;
	private String dateStr;
	private Date date;
	
	public DateFormatting() {
		
	}
	
	public DateFormatting(int day, int month, int year) {
		this.day = day;
		this.month = month;
		this.year = year;
		dateStr = month + "-" + day + "-" + year;
		addingDate();
	}
	
	public DateFormatting(String dateStr) {
		this.dateStr = dateStr;
		splitingDate();
		addingDate();
	}
	
	public int getDay() {
		return day;
	}

	public int getMonth() {
		return month;
	}

	public int getYear() {
		return year;
	}

	public String getDateStr() {
		return dateStr;
	}

	public Date getDate() {
		return date;
	}

	public void setDay(int day) {
		this.day = day;
	}

	public void setMonth(int month) {
		this.month = month;
	}

	public void setYear(int year) {
		this.year = year;
	}

	public void setDateStr(String dateStr) {
		this.dateStr = dateStr;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public void splitingDate () {
		String[] yearMonthDay = dateStr.split("-");
		if (yearMonthDay.length == 3) {
			year = Integer.parseInt(yearMonthDay[0]) - 1900;
			month = Integer.parseInt(yearMonthDay[1]) - 1;
			day = Integer.parseInt(yearMonthDay[2]);
		} else {
			
		}
	}
	
	public void addingDate() {
		date = new Date (year, month, day);
	}

}
