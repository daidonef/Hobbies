package com.daidonef.hobbiedata;

public class HobbiesQuery {
	
	public static String gettingHobbies(int accountID) {
		return "FROM Hobbies WHERE (accountid = " + accountID + ")";
	}

}
