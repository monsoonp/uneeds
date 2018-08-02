package com.admin_movie.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.movie.domain.DiscountVO;
import com.movie.service.DiscountService;


@Controller
public class Amv_discountCode_Controller {
	
	@Inject
	private DiscountService dservice;
	
	//할인코드리스트-ajax
	@RequestMapping(value="list_Discount", method=RequestMethod.GET)
	public @ResponseBody List<DiscountVO> list_Discount() throws Exception{
		return dservice.listall_discount();
	}
	
	//할인코드등록-ajax
	@RequestMapping(value="insert_Discount", method=RequestMethod.POST)
	public String insert_Discount(DiscountVO dvo) throws Exception{
		dservice.insert_discount(dvo);
		return "redirect:main";
	}
	
	//할인코드삭제-ajax
	@RequestMapping(value="delete_Discount", method=RequestMethod.POST)
	public String delete_Discount(DiscountVO dvo) throws Exception{
		dservice.delete_discount(dvo);
		return "redirect:main";
	}
	
	//할인코드 할인율 수정-ajax
	@RequestMapping(value="update_Discount", method=RequestMethod.POST)
	public String update_Discount(DiscountVO dvo) throws Exception{
		dservice.update_discount(dvo);
		return "redirect:main";
	}
	
}
