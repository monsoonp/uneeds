package com.admin.controller;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AdminController {
	// http://localhost:8080/uneeds/admin/*
	//관리자메인
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main(){
		return "main";
	}
}
