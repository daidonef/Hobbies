package com.daidonef.hobbies;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.daidonef.hobbiedata.Account;
import com.daidonef.hobbiedata.AccountDAO;
import com.daidonef.hobbiedata.AccountQuery;
import com.daidonef.hobbiedata.Genre;
import com.daidonef.hobbiedata.Hobbies;
import com.daidonef.hobbiedata.Item;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		
		return "home";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(Model model, HttpServletRequest request) {
		
		request.getSession(true).invalidate();
		
		return "login";
	}
	
	@RequestMapping(value = "/createaccount", method = RequestMethod.POST)
	public String createAccount(Model model, HttpServletRequest request) {
		
		request.getSession(true).invalidate();
		
		return "createaccount";
	}
	
	@RequestMapping(value = "/hobbies", method = RequestMethod.POST)
	public String hobbies(Model model, HttpServletRequest request) {
		
		HttpSession session = request.getSession(true);
		List<Account> accounts = AccountDAO.getAccount(AccountQuery.gettingAccounts(
				request.getParameter("userName")));
		
		//If user is not login will return to login page, it is login then return to hobbies
		if (session.getAttribute("account") == null) {
			if (request.getParameter("firstName") != null) {
				return Account.addAccount(accounts, model, request, session);
			}
			return Account.accessAccount(accounts, model, request, session);
		}
		
		if (request.getParameter("hobby") != null) {
			Hobbies.addHobbies(request, session);
			Hobbies.accessHobbies((Account) session.getAttribute("account"), model, 
					session);
		}
		
		if (request.getParameter("genre") != null) {
			Genre.addGenre(request, session);
			Genre.accessGenres((Account) session.getAttribute("account"), model, session);
		}
		
		//Need to test adding and accessing items.
		if (request.getParameter("item") != null) {
			Item.addItem(request, session);
			Item.accessItem((Account) session.getAttribute("account"), model, session);
		}
		
		//Need methods for adding and accessing locations.
		
		model.addAttribute("hobbies", session.getAttribute("hobbies"));
		model.addAttribute("genres", session.getAttribute("genres"));
		model.addAttribute("items", session.getAttribute("items"));
		
		return "hobbies";
	}
	
}
