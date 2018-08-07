package com.book.util;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

public class NaverSearch {

	// 검색페이지 query, 페이지 번호
	public StringBuffer booksearch(String text, int start) {
		String clientId = "dhxVzayDoaI1Ff2KDolt";//애플리케이션 클라이언트 아이디값";
        String clientSecret = "QStSv4TdXn";//애플리케이션 클라이언트 시크릿값";
        StringBuffer response = null;
        try {
            //String text = "https://developers.naver.com/notice";
        	String query = text;
        	query = URLEncoder.encode(query, "UTF-8");
            String apiURL = String.format("https://openapi.naver.com/v1/search/book?query=%s&display=10&start=%s", query, start);
            
            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("GET");
            con.setRequestProperty("X-Naver-Client-Id", clientId);
            con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
            // get request
            
            int responseCode = con.getResponseCode();
            BufferedReader br;
            if(responseCode==200) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else {  // 에러 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }
            String inputLine;
            response = new StringBuffer();
            while ((inputLine = br.readLine()) != null) {
                response.append(inputLine);
            }
            br.close();
            //System.out.println(response.toString());	//결과값
        } catch (Exception e) {
            System.out.println(e);
        }
        // StringBuffer 값
		return response;
    
	}
	
	// 상세페이지 isbn으로 검색
	public StringBuffer booksearch(String isbn) {
		String clientId = "dhxVzayDoaI1Ff2KDolt";//애플리케이션 클라이언트 아이디값";
        String clientSecret = "QStSv4TdXn";//애플리케이션 클라이언트 시크릿값";
        StringBuffer response = null;
        try {
            //String text = "https://developers.naver.com/notice";
        	String query = isbn;
        	query = URLEncoder.encode(query, "UTF-8");
            String apiURL = String.format("https://openapi.naver.com/v1/search/book?query=%s&display=1&isbn=%s", query, query);
            
            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("GET");
            con.setRequestProperty("X-Naver-Client-Id", clientId);
            con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
            // get request
            
            int responseCode = con.getResponseCode();
            BufferedReader br;
            if(responseCode==200) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else {  // 에러 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }
            String inputLine;
            response = new StringBuffer();
            while ((inputLine = br.readLine()) != null) {
                response.append(inputLine);
            }
            br.close();
            //System.out.println(response.toString());	//결과값
        } catch (Exception e) {
            System.out.println(e);
        }
        // StringBuffer 값
		return response;
    
	}
}
