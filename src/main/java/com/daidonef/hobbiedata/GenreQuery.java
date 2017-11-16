package com.daidonef.hobbiedata;

public class GenreQuery {
	
	public static String gettingGenres(int accountID) {
		return "FROM Genre WHERE (accountid = " + accountID + ")";
	}

}
