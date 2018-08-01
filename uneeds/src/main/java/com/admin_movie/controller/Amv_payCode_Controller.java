package com.admin_movie.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.movie.domain.PayVO;

import com.movie.service.PayService;


@Controller
public class Amv_payCode_Controller {
	
	@Inject
	private PayService pservice;
	
	//결제코드리스트-ajax
	@RequestMapping(value="list_Pay", method=RequestMethod.GET)
	public @ResponseBody List<PayVO> list_Pay() throws Exception{
		return pservice.listall_pay();
	}
	
	//결제코드등록-ajax
	@RequestMapping(value="insert_Pay", method=RequestMethod.POST)
	public String insert_Pay(PayVO pvo) throws Exception{
		pservice.insert_pay(pvo);
		return "redirect:main";
	}
	
	//결제코드삭제-ajax
	@RequestMapping(value="delete_Pay", method=RequestMethod.POST)
	public String delete_Pay(PayVO pvo) throws Exception{
		pservice.delete_pay(pvo);
		return "redirect:main";
	}
	
	//결제코드 할인율 수정-ajax
	@RequestMapping(value="update_Pay", method=RequestMethod.POST)
	public String update_Pay(PayVO pvo) throws Exception{
		pservice.update_pay(pvo);
		return "redirect:main";
	}
	
}
