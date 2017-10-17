package com.daidonef.hobbiedata;

public class AccountQuery {
	
	public static String gettingAccounts(String un) {
		return "FROM Account WHERE (username = '" + un + "')";
	}

}
