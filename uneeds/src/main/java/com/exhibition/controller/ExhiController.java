package com.exhibition.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.Objects;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Handles requests for the application home page.
 */
@Controller
public class ExhiController {
	
	private static final Logger logger = LoggerFactory.getLogger(ExhiController.class);
	
	
	   @RequestMapping(value = "/")
	   public String main(Locale locale, Model model) {
	      return "bootshome";
	      
	   }
	
	   @RequestMapping(value = "/realm")
	   public String realm(Locale locale, Model model) {
	      return "realm";
	      
	   }
	   @RequestMapping(value = "/blog_search")
	   public String top_100(Locale locale, Model model) {
	      return "blog_search";
	      
	   } 

	   // 네이버 블로그 검색
	   @RequestMapping(value= "/api_blog", method = RequestMethod.GET)
	   public ResponseEntity<String> api_blog(HttpServletRequest request) throws Exception{
		   HttpHeaders responseHeader = new HttpHeaders();
		      responseHeader.add("Content-type", "application/json; charset=utf-8");

		String text = request.getParameter("text");
		text = URLEncoder.encode(Objects.isNull(text) ? "an" : text, "UTF-8");

//		System.out.println(text);
		
		String clientId = "JbK5WIkyuNSphDFKqd6o";// 애플리케이션 클라이언트 아이디값";
		String clientSecret = "ybwgEIEvnL";// 애플리케이션 클라이언트 시크릿값";

		String apiURL = "https://openapi.naver.com/v1/search/blog?query=" + text; // json 결과
		// String apiURL = "https://openapi.naver.com/v1/search/blog.xml?query="+ text;
		// // xml 결과
		URL url = new URL(apiURL);
		HttpURLConnection con = (HttpURLConnection) url.openConnection();
		con.setRequestMethod("GET");
		con.setRequestProperty("X-Naver-Client-Id", clientId);
		con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
		int responseCode = con.getResponseCode();
		BufferedReader br;
		if (responseCode == 200) { // 정상 호출
			br = new BufferedReader(new InputStreamReader(con.getInputStream()));
		} else { // 에러 발생
			br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
		}
		String inputLine;
		StringBuffer res = new StringBuffer();
		while ((inputLine = br.readLine()) != null) {
			res.append(inputLine);
		}
		br.close();
		System.out.println(res.toString());
		
		return new ResponseEntity<String>(res.toString(), responseHeader, HttpStatus.CREATED);

	   }

	 //카테고리별
	   @RequestMapping(value= "/api_realm", method = RequestMethod.GET)
	   public ResponseEntity<String> api_realm(HttpServletRequest request) throws Exception{
	      
			  HttpHeaders responseHeader = new HttpHeaders();
		      responseHeader.add("Content-type", "application/xml; charset=utf-8");

		      String realMCode = request.getParameter("realMCode");
		      realMCode = URLEncoder.encode(Objects.isNull(realMCode) ? "A000" : realMCode, "UTF-8");

	      StringBuilder urlBuilder = new StringBuilder("http://www.culture.go.kr/openapi/rest/publicperformancedisplays/realm"); /*URL*/
	      urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=NS%2BhDAAQ3RHaCNy%2BNXn1wyTfSx4NMxymVXFsWXj8j49UyH34WOqXuAmhfwnsc%2BtHY%2B7%2B2fkbenrvnydmxbnLbw%3D%3D"); /*Service Key*/
	      // urlBuilder.append("&" + URLEncoder.encode("sido","UTF-8") + "=" + URLEncoder.encode("서울", "UTF-8")); /**/
	      // urlBuilder.append("&" + URLEncoder.encode("gugun","UTF-8") + "=" + URLEncoder.encode("동작구", "UTF-8")); /**/
	      // urlBuilder.append("&" + URLEncoder.encode("place","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /**/
	      // urlBuilder.append("&" + URLEncoder.encode("gpsxfrom","UTF-8") + "=" + URLEncoder.encode("129.101", "UTF-8")); /*경도 범위검색 중 하한*/
	      // urlBuilder.append("&" + URLEncoder.encode("gpsyfrom","UTF-8") + "=" + URLEncoder.encode("35.142", "UTF-8")); /*위도 범위검색 중 하한*/
	      // urlBuilder.append("&" + URLEncoder.encode("gpsxto","UTF-8") + "=" + URLEncoder.encode("129.101", "UTF-8")); /*경도 범위검색 중 상한*/
	      // urlBuilder.append("&" + URLEncoder.encode("gpsyto","UTF-8") + "=" + URLEncoder.encode("35.142", "UTF-8")); /*위도 범위검색 중 상한*/
	      // urlBuilder.append("&" + URLEncoder.encode("keyword","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /**/
	      // urlBuilder.append("&" + URLEncoder.encode("sortStdr","UTF-8") + "=" + URLEncoder.encode("2", "UTF-8")); /*1:등록일, 2:공연명, 3:지역*/
	      // urlBuilder.append("&" + URLEncoder.encode("ComMsgHeader","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /**/
	      // urlBuilder.append("&" + URLEncoder.encode("RequestTime","UTF-8") + "=" + URLEncoder.encode("20100810:23003422", "UTF-8")); /*Optional 필드*/
	      // urlBuilder.append("&" + URLEncoder.encode("CallBackURI","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*Optional 필드*/
	      // urlBuilder.append("&" + URLEncoder.encode("MsgBody","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /**/
	      urlBuilder.append("&" + URLEncoder.encode("realmCode","UTF-8") + "=" + URLEncoder.encode(realMCode, "UTF-8")); /*코드*/
	      /* A000 연극 / B000 음악(콘서드, 뮤지컬 등) / C000 무용 / D000 미술 /E000 건축 / G000 영상 / H000 문학 / I000 문화정책 / J000 축제문화공간 / L000 기타 */
	      urlBuilder.append("&" + URLEncoder.encode("cPage","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /**/
	      urlBuilder.append("&" + URLEncoder.encode("rows","UTF-8") + "=" + URLEncoder.encode("100", "UTF-8")); /**/
	      // urlBuilder.append("&" + URLEncoder.encode("from","UTF-8") + "=" + URLEncoder.encode("20100101", "UTF-8")); /**/
	      // urlBuilder.append("&" + URLEncoder.encode("to","UTF-8") + "=" + URLEncoder.encode("20101201", "UTF-8")); /**/
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
	      String line;
	      while ((line = rd.readLine()) != null) {
	          sb.append(line);
	      }
	      rd.close();
	      conn.disconnect();
	      System.out.println(sb.toString());

	      return new ResponseEntity<String>(sb.toString(), responseHeader, HttpStatus.CREATED);
	      
	   }
	   
	   
	   // 지역별
	   @RequestMapping(value= "/api_area", method = RequestMethod.GET)
	   public ResponseEntity<String> api_area(HttpServletRequest request) throws Exception{
	      
		  HttpHeaders responseHeader = new HttpHeaders();
	      responseHeader.add("Content-type", "application/xml; charset=utf-8");
	      
	      String sido = request.getParameter("sido");
	      sido = Objects.isNull(sido) ? "서울" : sido;

	      String gugun = request.getParameter("gugun");
	      gugun = Objects.isNull(gugun) ? "강남구" : gugun;

	      	StringBuilder urlBuilder = new StringBuilder("http://www.culture.go.kr/openapi/rest/publicperformancedisplays/area"); /*URL*/
	      	urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=NS%2BhDAAQ3RHaCNy%2BNXn1wyTfSx4NMxymVXFsWXj8j49UyH34WOqXuAmhfwnsc%2BtHY%2B7%2B2fkbenrvnydmxbnLbw%3D%3D"); /*Service Key*/
//	       	urlBuilder.append("&" + URLEncoder.encode("ComMsgHeader","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /**/
//	           urlBuilder.append("&" + URLEncoder.encode("RequestTime","UTF-8") + "=" + URLEncoder.encode("20100810:23003422", "UTF-8")); /*Optional 필드*/
//	           urlBuilder.append("&" + URLEncoder.encode("CallBackURI","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*Optional 필드*/
//	           urlBuilder.append("&" + URLEncoder.encode("MsgBody","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /**/
	          urlBuilder.append("&" + URLEncoder.encode("sido","UTF-8") + "=" + URLEncoder.encode(sido, "UTF-8")); /**/
	          urlBuilder.append("&" + URLEncoder.encode("gugun","UTF-8") + "=" + URLEncoder.encode(gugun, "UTF-8")); /**/
//	           urlBuilder.append("&" + URLEncoder.encode("from","UTF-8") + "=" + URLEncoder.encode("20100101", "UTF-8")); /**/
//	           urlBuilder.append("&" + URLEncoder.encode("to","UTF-8") + "=" + URLEncoder.encode("20101201", "UTF-8")); /**/
//	           urlBuilder.append("&" + URLEncoder.encode("place","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /**/
//	           urlBuilder.append("&" + URLEncoder.encode("gpsxfrom","UTF-8") + "=" + URLEncoder.encode("129.101", "UTF-8")); /*경도 범위검색 중 하한*/
//	           urlBuilder.append("&" + URLEncoder.encode("gpsyfrom","UTF-8") + "=" + URLEncoder.encode("35.142", "UTF-8")); /*위도 범위검색 중 하한*/
//	           urlBuilder.append("&" + URLEncoder.encode("gpsxto","UTF-8") + "=" + URLEncoder.encode("129.101", "UTF-8")); /*경도 범위검색 중 상한*/
//	           urlBuilder.append("&" + URLEncoder.encode("gpsyto","UTF-8") + "=" + URLEncoder.encode("35.142", "UTF-8")); /*위도 범위검색 중 상한*/
//	           urlBuilder.append("&" + URLEncoder.encode("cPage","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /**/
	          urlBuilder.append("&" + URLEncoder.encode("rows","UTF-8") + "=" + URLEncoder.encode("100", "UTF-8")); /**/
//	           urlBuilder.append("&" + URLEncoder.encode("keyword","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /**/
//	           urlBuilder.append("&" + URLEncoder.encode("sortStdr","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*1:등록일, 2:공연명, 3:지역*/
	           URL url = new URL(urlBuilder.toString());
	              HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	              conn.setRequestMethod("GET");
	              conn.setRequestProperty("Content-type", "application/json");
	              System.out.println("Response code: " + conn.getResponseCode());
	              BufferedReader rd;
	              if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
	                  rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	              } else {
	                  rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
	              }
	              StringBuilder sb = new StringBuilder();
	              String line;
	              while ((line = rd.readLine()) != null) {
	                  sb.append(line);
	              }
	              rd.close();
	              conn.disconnect();
	              System.out.println(sb.toString());

	      return new ResponseEntity<String>(sb.toString(), responseHeader, HttpStatus.CREATED);
	   }
	   
	   // 지역별
	   @RequestMapping(value= "/api_period", method = RequestMethod.GET)
	   public ResponseEntity<String> api_period(HttpServletRequest request) throws Exception{
	      
		  HttpHeaders responseHeader = new HttpHeaders();
	      responseHeader.add("Content-type", "application/xml; charset=utf-8");
	      
	      String from = request.getParameter("from");
	      from = Objects.isNull(from) ? "20180101" : from;

	      String to = request.getParameter("to");
	      to = Objects.isNull(to) ? "20181231" : to;

	      StringBuilder urlBuilder = new StringBuilder("http://www.culture.go.kr/openapi/rest/publicperformancedisplays/period"); /*URL*/
	      urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=NS%2BhDAAQ3RHaCNy%2BNXn1wyTfSx4NMxymVXFsWXj8j49UyH34WOqXuAmhfwnsc%2BtHY%2B7%2B2fkbenrvnydmxbnLbw%3D%3D"); /*Service Key*/
	      // urlBuilder.append("&" + URLEncoder.encode("keyword","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /**/
	      // urlBuilder.append("&" + URLEncoder.encode("sortStdr","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*1:등록일, 2:공연명, 3:지역*/
	      // urlBuilder.append("&" + URLEncoder.encode("ComMsgHeader","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /**/
	      // urlBuilder.append("&" + URLEncoder.encode("RequestTime","UTF-8") + "=" + URLEncoder.encode("20100810:23003422", "UTF-8")); /*Optional 필드*/
	      // urlBuilder.append("&" + URLEncoder.encode("CallBackURI","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*Optional 필드*/
	      // urlBuilder.append("&" + URLEncoder.encode("MsgBody","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /**/
	      urlBuilder.append("&" + URLEncoder.encode("from","UTF-8") + "=" + URLEncoder.encode(from, "UTF-8")); /**/
	      urlBuilder.append("&" + URLEncoder.encode("to","UTF-8") + "=" + URLEncoder.encode(to, "UTF-8")); /**/
	      urlBuilder.append("&" + URLEncoder.encode("cPage","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /**/
	      urlBuilder.append("&" + URLEncoder.encode("rows","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /*3~100*/
	      urlBuilder.append("&" + URLEncoder.encode("place","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /**/
	      urlBuilder.append("&" + URLEncoder.encode("gpsxfrom","UTF-8") + "=" + URLEncoder.encode("129.101", "UTF-8")); /*경도 범위검색 중 하한*/
	      urlBuilder.append("&" + URLEncoder.encode("gpsyfrom","UTF-8") + "=" + URLEncoder.encode("35.142", "UTF-8")); /*위도 범위검색 중 하한*/
	      urlBuilder.append("&" + URLEncoder.encode("gpsxto","UTF-8") + "=" + URLEncoder.encode("129.101", "UTF-8")); /*경도 범위검색 중 상한*/
	      urlBuilder.append("&" + URLEncoder.encode("gpsyto","UTF-8") + "=" + URLEncoder.encode("35.142", "UTF-8")); /*위도 범위검색 중 상한*/
	      URL url = new URL(urlBuilder.toString());
	      HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	      conn.setRequestMethod("GET");
	      conn.setRequestProperty("Content-type", "application/json");
	      System.out.println("Response code: " + conn.getResponseCode());
	      BufferedReader rd;
	      if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
	          rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	      } else {
	          rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
	      }
	      StringBuilder sb = new StringBuilder();
	      String line;
	      while ((line = rd.readLine()) != null) {
	          sb.append(line);
	      }
	      rd.close();
	      conn.disconnect();
	      System.out.println(sb.toString());

	      return new ResponseEntity<String>(sb.toString(), responseHeader, HttpStatus.CREATED);
	   }
	   
}
