package com.admin_movie.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AdminMovie_Controller {
	// http://localhost:8080/uneeds/admin_movie/*
	
	//TEST
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String test(){
		return "rect_create";
	}
	
	
	//admin_movie메인
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main(){
		return "main";
	}
	
	//영화코드검색리스트
	@RequestMapping(value = "/listMovie", method = RequestMethod.GET)
	public ResponseEntity<String> listMovie(HttpServletRequest request) throws Exception {
		
		String movienm = request.getParameter("moviename").toString();
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "application/json; charset=utf-8");
		//영화진흥위원회	
		StringBuilder urlBuilder = new StringBuilder("http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieList.json"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("key","UTF-8") + "=" + "442737aee7f7c79a4358fbed3c05864d"); /*key*/
        urlBuilder.append("&" + URLEncoder.encode("movieNm","UTF-8") + "=" + URLEncoder.encode(movienm, "UTF-8")); /*영화명*/
        
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
	
	//영화상세
	@RequestMapping(value = "/mlistMoviestep1", method = RequestMethod.GET)
	public ResponseEntity<String> mlistMoviestep1(HttpServletRequest request) throws Exception {
		
		String moviecd = request.getParameter("moviecd").toString();
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "application/json; charset=utf-8");
		//영화진흥위원회	
		StringBuilder urlBuilder = new StringBuilder("http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.json"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("key","UTF-8") + "=" + "442737aee7f7c79a4358fbed3c05864d"); /*key*/
        urlBuilder.append("&" + URLEncoder.encode("movieCd","UTF-8") + "=" + URLEncoder.encode(moviecd, "UTF-8")); /*영화명*/
        
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
}
