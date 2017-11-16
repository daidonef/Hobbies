package com.daidonef.hobbiedata;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.jasypt.util.password.StrongPasswordEncryptor;
import org.springframework.ui.Model;

public class Account {
	
	private int accountID;
	private String userName;
	private String firstName;
	private String lastName;
	private String email;
	private String password;
	
	public Account() {
		
	}
	
	public Account(String userName, String firstName, String lastName, String email, String password) {
		this.userName = userName;
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.password = password;
	}

	public int getAccountID() {
		return accountID;
	}

	public String getUserName() {
		return userName;
	}

	public String getFirstName() {
		return firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public String getEmail() {
		return email;
	}

	public String getPassword() {
		return password;
	}

	public void setAccountID(int accountID) {
		this.accountID = accountID;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	public static String accessAccount(List<Account> accounts, Model model, HttpServletRequest request,
			HttpSession session) {
		
		if (isNotAccount(accounts, model)) {
			return "login";
		}
		
		Account account = accounts.get(0);
		
		if (isPassword(account, model, request, session)) {
			
			//Stores hobbies of account user in sessions "hobbies" and model "hobbies".
			Hobbies.accessHobbies(account, model, session);
			////Stores genres of account user in sessions "genres" and model "genres".
			Genre.accessGenres(account, model, session);
			
			return "hobbies";
		}
		
		return "login";
		
	}
	
	private static boolean isNotAccount(List<Account> accounts, Model model) {
		
		if (accounts.size() == 0) {
			model.addAttribute("wrongUserName", "Wrong username.  Please try again!");
			return true;
		}
		return false;
	}
	
	private static boolean isPassword(Account account, Model model, HttpServletRequest request,
			HttpSession session) {
		
		StrongPasswordEncryptor passwordEncryptor = new StrongPasswordEncryptor();
		
		if (passwordEncryptor.checkPassword(request.getParameter("password"), account.getPassword())) {
			session.setAttribute("account", account);
			return true;
		}
		
		model.addAttribute("wrongPassword", "Wrong password.  Please try again!");
		return false;
	}
	
	public static String addAccount(List<Account> accounts, Model model, HttpServletRequest request, 
			HttpSession session) {
		
		if (doesUserNameExist(accounts)) {
			model.addAttribute("userNameExist", "Username already exist choose another.");
			return "createaccount";
		}
		
		StrongPasswordEncryptor passwordEncryptor = new StrongPasswordEncryptor();
		String password = passwordEncryptor.encryptPassword(request.getParameter("password"));
		
		Account account = new Account(request.getParameter("userName"), request.getParameter("firstName"), 
				request.getParameter("lastName"), request.getParameter("email"), password);
		
		account.setAccountID(AccountDAO.addAccount(account));
		session.setAttribute("account", account);
		
		return "hobbies";
	}
	
	public static boolean doesUserNameExist(List<Account> accounts) {
		
		if (accounts.size() == 0) {
			return false;
		}
		return true;
	}

}
