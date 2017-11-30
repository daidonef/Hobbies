package com.daidonef.hobbiedata;

public class ItemQuery {
	
	public static String gettingItems(int accountID) {
		return "FROM Item WHERE (accountid = " + accountID + ")";
	}

}
