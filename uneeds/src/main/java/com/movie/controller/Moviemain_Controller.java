package com.movie.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class Moviemain_Controller {
	
	//전일 box-office 검사
	@RequestMapping(value = "/listTopMovie", method = RequestMethod.GET)
	public ResponseEntity<String> listMovie(HttpServletRequest request) throws Exception {
		Calendar cal = Calendar.getInstance(); 
		//현재 년도, 월, 일
		int year = cal.get ( cal.YEAR );
		int month = cal.get ( cal.MONTH ) + 1 ;
		int date = cal.get ( cal.DATE )-1 ;
		String targetdt="";
		targetdt+= String.valueOf(year);
		
		if(String.valueOf(month).length()==1){
			targetdt+="0"+String.valueOf(month);
		}else{
			targetdt+= String.valueOf(month);
		}
		
		targetdt+=String.valueOf(date);
		
		//System.out.println(targetdt);

		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "application/json; charset=utf-8");
		//영화진흥위원회	
		StringBuilder urlBuilder = new StringBuilder("http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("key","UTF-8") + "=" + "442737aee7f7c79a4358fbed3c05864d"); /*key*/
        urlBuilder.append("&" + URLEncoder.encode("targetDt","UTF-8") + "=" + URLEncoder.encode(targetdt, "UTF-8")); /*날짜*/
        
        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json; charset=utf-8");
        System.out.println("Response code: " + conn.getResponseCode());
        
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        
        StringBuilder sb = new StringBuilder();
        StringBuffer res = new StringBuffer();
        String line;
        while ((line = rd.readLine()) != null) {
        	res.append(line);
        }
        
        rd.close();
        conn.disconnect();
        System.out.println(sb.toString());
        System.out.println(res.toString());
        return new ResponseEntity<String>(res.toString(), responseHeaders, HttpStatus.CREATED);
	}
	
	@RequestMapping(value = "/craw_news", method = RequestMethod.GET)
	public @ResponseBody Map<String, List<String>> craw_news(HttpServletRequest request) throws Exception {
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "application/json; charset=utf-8");
		
		String urlpath = "https://entertain.naver.com/movie";
		
		String select_title=".tit_area a";
		String select_content=".tit_area p";
		String select_from=".tit_area span";
		String select_img=".news_lst2 li img";
		Connection conn = Jsoup.connect(urlpath).header("Content-Type", "text/html; charset=utf-8");
		
		
		Elements emts_title =(Elements) conn.get().select(select_title);
		Elements emts_content =(Elements) conn.get().select(select_content);
		Elements emts_from =(Elements) conn.get().select(select_from);
		Elements emts_img =(Elements) conn.get().select(select_img);
		
		// HTML을 TEXT로 파싱
		//String text = Jsoup.parse(emts.toString()).text();
		//System.out.println(text);
		
		
		Map<String, List<String>> map_news = new HashMap<>();
		//제목
		List<String> list_title = new ArrayList<>();
		
		List<String> list_href = new ArrayList<>();
		
		for (Element e : emts_title) {
			String title=Jsoup.parse(e.toString()).text();
			
			list_href.add(e.attr("href").toString());
			
			list_title.add(title);
		}
		map_news.put("titles", list_title);
		map_news.put("hrefs", list_href);
		
		//내용
		List<String> list_content = new ArrayList<>();
		for (Element e : emts_content) {
			list_content.add(e.text().toString());
		}
		map_news.put("contents", list_content);
		
		//어디서 몇분전
		List<String> list_from = new ArrayList<>();
		List<String> list_from2 = new ArrayList<>();
		
		for (Element e : emts_from) {
			String[] froms =e.text().split(" ");
			list_from.add(froms[0]);
			list_from2.add(froms[1]);
		}
		map_news.put("froms", list_from);
		map_news.put("froms2", list_from2);
		
		List<String> list_img = new ArrayList<>();
		
		for (Element e : emts_img) {
			list_img.add(e.attr("src").toString());
			
		}
		map_news.put("imgs", list_img);
		

		return map_news;
	}
	
	
	//craw_조회순랭킹
	@RequestMapping(value = "/craw_searchrank", method = RequestMethod.GET)
	public @ResponseBody Map<String, List<String>> craw_searchrank(HttpServletRequest request) throws Exception {
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "application/json; charset=utf-8");

		Calendar cal = Calendar.getInstance(); 
		//현재 년도, 월, 일
		int year = cal.get ( cal.YEAR );
		int month = cal.get ( cal.MONTH ) + 1 ;
		int date = cal.get ( cal.DATE )-1 ;
		String targetdt="";
		targetdt+= String.valueOf(year);
		
		if(String.valueOf(month).length()==1){
			targetdt+="0"+String.valueOf(month);
		}else{
			targetdt+= String.valueOf(month);
		}
		targetdt+=String.valueOf(date);
		
		String urlpath = "https://movie.naver.com/movie/sdb/rank/rmovie.nhn?sel=cnt&date="+targetdt;
		String select_searchtitle=".tit3 a";
		String select_rangeac = ".range";
		String select_ac=".ac img";
		
		Connection conn = Jsoup.connect(urlpath).header("Content-Type", "text/html; charset=utf-8");
		Elements emts_searchtitle =(Elements) conn.get().select(select_searchtitle);
		Elements emts_rangeac =(Elements) conn.get().select(select_rangeac);
		Elements emts_ac =(Elements) conn.get().select(select_ac);
		
		
		Map<String, List<String>> map_ranking = new HashMap<>();
		//검색순제목
		List<String> list_searchtitle = new ArrayList<>();
		List<String> list_rangeac = new ArrayList<>();
		List<String> list_ac = new ArrayList<>();
		
		for (Element e : emts_searchtitle) {
			list_searchtitle.add(e.attr("title").toString());
		}
		map_ranking.put("search_rank", list_searchtitle);
		
		//변동폭업다운
		for (Element e : emts_ac) {
			if(e.attr("alt").equals("na")||e.attr("alt").equals("up")||e.attr("alt").equals("down")){
				list_ac.add(e.attr("alt").toString());
			}
		}
		map_ranking.put("s_ac", list_ac);
		
		//변동폭
		for (Element e : emts_rangeac) {
			list_rangeac.add(Jsoup.parse(e.toString()).text());
		}
		map_ranking.put("s_rangeac", list_rangeac);

		
		//영화인 인기검색어
		String urlpath2 = "https://movie.naver.com/movie/sdb/rank/rpeople.nhn";
		String select_searchpeople=".title a";

		Connection conn2 = Jsoup.connect(urlpath2).header("Content-Type", "text/html; charset=utf-8");
		Elements emts_searchpeople =(Elements) conn2.get().select(select_searchpeople);
		Elements emts_prangeac =(Elements) conn2.get().select(select_rangeac);
		Elements emts_pac =(Elements) conn2.get().select(select_ac);
		
		
		List<String> list_searchpeople = new ArrayList<>();
		for (Element e : emts_searchpeople) {
			list_searchpeople.add(e.text());
		}
		map_ranking.put("search_people", list_searchpeople);
		
		List<String> list_prangeac = new ArrayList<>();
		//영화인 변동폭
		for (Element e : emts_prangeac) {
			list_prangeac.add(e.text());
		}
		map_ranking.put("p_rangeac", list_prangeac);
		
		
		List<String> list_pac = new ArrayList<>();
		//변동폭업다운
		for (Element e : emts_pac) {
			if(e.attr("alt").equals("na")||e.attr("alt").equals("up")||e.attr("alt").equals("down")){
				list_pac.add(e.attr("alt").toString());
			}
		}
		map_ranking.put("p_ac", list_pac);
		
		return map_ranking;
	}
}
