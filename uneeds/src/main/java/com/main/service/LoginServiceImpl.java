package com.main.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.main.persistence.LoginDAO;

@Service
public class LoginServiceImpl implements LoginService{
	
	@Inject LoginDAO loginDao;
	
	@Override
	public String getTime() {
		return loginDao.selectTime();
	}
}
