package com.book.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.book.service.testServiceImpl;

@Controller("BookController")
//@RequestMapping(value="/book")
public class BookController {
	
	@Inject
	private testServiceImpl tservice;
	private static final Logger logger = LoggerFactory.getLogger(BookController.class);
	
	@RequestMapping(value="", method=RequestMethod.GET)
	public ModelAndView bookHome(Locale locale) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		ModelAndView mav = new ModelAndView();
		Date date = new Date();
		
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		
		mav.addObject("serverTime", formattedDate);
		mav.addObject("time", tservice.getTime());
		mav.setViewName("bookmain");

		return mav;
		
	}
	
	@RequestMapping(value="search", method=RequestMethod.GET)
	public ModelAndView bookSearch() {
		logger.info("Welcome search! The client url is {}.", "/book/search");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("booksearch");
		
		return mav;
	}
	
	@RequestMapping(value="seller", method=RequestMethod.GET)
	public String bookSeller() {
		return "bookseller";
	}
	
	@RequestMapping(value="store", method=RequestMethod.GET)
	public ModelAndView bookShop() {
		logger.info("Welcome shop! The client url is {}.", "/book/shop");
	
		ModelAndView mav = new ModelAndView();
		mav.setViewName("bookshop");
		return mav;
	}
	
}
