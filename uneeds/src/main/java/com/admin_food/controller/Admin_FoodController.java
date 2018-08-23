package com.admin_food.controller;

import java.io.UnsupportedEncodingException;

import java.lang.ProcessBuilder.Redirect;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.StreamSupport;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.bson.Document;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.food.domain.Food_dataVo;
import com.food.domain.Food_reservationVo;
import com.food.domain.Food_searchPageMaker;
import com.food.domain.Food_searchPageMaker_kid;
import com.food.domain.Food_searchVo;
import com.food.mongos.MongoUtil;
import com.food.persistence.Food_MydataDAO;
import com.food.service.Food_MongodataService;
import com.food.service.Food_MydataService;
import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoIterable;

@Controller
public class Admin_FoodController {
	private static final Logger logger = LoggerFactory.getLogger(Admin_FoodController.class);

	@Inject
	Food_MongodataService fds;
	
	@Inject
	Food_MydataDAO dao;
	
	@Inject
	private Food_MydataService fs;
		
	@RequestMapping(value="main", method=RequestMethod.GET)
	public String admin_main() {
		return "main";
	}
	
	@RequestMapping(value="reservationtotal", method=RequestMethod.GET)
	public @ResponseBody List<Food_reservationVo> reservationTotal(Food_reservationVo rvo, Model m) {
		return dao.reservationFoodTotal(rvo);
	}
}
