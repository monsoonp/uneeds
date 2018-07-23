package com.main.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

//메인 controller
@Controller
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	
	
	// http://localhost:8080/uneeds/
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "uneeds_main";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		return "uneeds_login";
	}
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join() {
		return "uneeds_join";
	}
	
	
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String totalLogin(HttpServletRequest req, @RequestParam String id, @RequestParam String site) {
		HttpSession session= req.getSession();
		session.setAttribute("login", "logined");
		session.setAttribute("id", id);
		session.setAttribute("site", site);
		
		String referer = req.getHeader("Referer");
		return referer;
	}
	
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String totalLogout(HttpServletRequest req) {
		HttpSession session= req.getSession();
		session.invalidate();
		
		String referer = req.getHeader("Referer");
		return "redirect:"+referer;
	}
	
}
