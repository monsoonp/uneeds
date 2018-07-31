package com.medical.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import java.util.Locale;
import java.util.Objects;

import javax.servlet.http.HttpServletRequest;

import org.bson.Document;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.medical.domain.MedicalVO;
import com.medical.mongos.MongoUtil;
import com.mongodb.client.MongoCollection;

/**
 * Handles requests for the application home page.
 */
@Controller
public class MedicalController {
	
	private static final Logger logger = LoggerFactory.getLogger(MedicalController.class);

	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
		
	@RequestMapping(value = "/main_view")
	public String view(Locale locale, Model model) {
		return "main_view";
		
	}
	
	
	// insert_medical
	@RequestMapping(value = "/insert_medical", method = RequestMethod.POST)
	public String insertBigbirds(MedicalVO m, RedirectAttributes rattr, HttpServletRequest r){
		
		try {
			r.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		MongoCollection<Document> col = MongoUtil.getCollection("medical", "detail");
		Document doc = new Document("dutyAddr",m.getAddr()).append("dutyName",m.getName()).append("dutyMapimg",m.getMaping()).append("dutyTel1",m.getNumber()).append("dutyTime1s", m.getMs_time()).append("dutyTime1c", m.getMc_time()).append("dutyTime2s", m.getTs_time()).append("dutyTime2c", m.getTc_time()).append("dutyTime3s", m.getWs_time()).append("dutyTime3c", m.getWc_time()).append("dutyTime4s", m.getThs_time()).append("dutyTime4c", m.getThc_time()).append("dutyTime5s", m.getFs_time()).append("dutyTimeFc", m.getFc_time()).append("dutyTime6s", m.getSs_time()).append("dutyTime6c", m.getSc_time()).append("hpid", m.getMedicalid()).append("wgs84Lat", m.getMap_x()).append("wgs84Lon", m.getMap_y());
		
		col.insertOne(doc);
		return "list";
	}
	
	// medical_view page
	@RequestMapping(value= "/medicalViewPage", method = RequestMethod.GET)
	public String medicalView() throws Exception {
		return "medical_view";
	}
	
	//hospital_view page
	@RequestMapping(value= "hospitalViewPage", method = RequestMethod.GET)
	public String hospitaclView() throws Exception {
		return "hospital_Kindview";
	}
	
	// select sido
	@RequestMapping(value= "/hospitalSidoCode", method = RequestMethod.GET)
	public ResponseEntity<String> hospitalSidoCode(HttpServletRequest request) throws Exception{
		StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/B551182/codeInfoService/getAddrCodeList"); /*URL*/
		urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=h1WoDyOi4e8rhTTYSuSJmN5H5sMOoJZhuTOsYTgxzzOEJaarD%2FrWJBttt15QA9Dw5h9Tj4%2BslQNc7eTa49aOOg%3D%3D"); /*Service Key*/
		urlBuilder.append("&" + URLEncoder.encode("ServiceKey","UTF-8") + "=" + URLEncoder.encode("h1WoDyOi4e8rhTTYSuSJmN5H5sMOoJZhuTOsYTgxzzOEJaarD%2FrWJBttt15QA9Dw5h9Tj4%2BslQNc7eTa49aOOg%3D%3D", "UTF-8")); /*공공데이터포털에서 받은 인증키*/
		urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
		urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("100", "UTF-8")); /*한 페이지 결과 수*/
		urlBuilder.append("&" + URLEncoder.encode("addrTp","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*1:시도, 2:시군구, 3:읍면동*/
		urlBuilder.append("&" + URLEncoder.encode("sidoCd","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*addrTp 2일 경우 입력*/
		urlBuilder.append("&" + URLEncoder.encode("sidoCdNm","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*addrTp 3일 경우 시도명 입력*/
		urlBuilder.append("&" + URLEncoder.encode("sgguCdNm","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*addrTp 3일 경우 시도명 입력*/
		
		HttpHeaders responseHeader = new HttpHeaders();
		responseHeader.add("Content-type", "application/xml; charset=utf-8");

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
	
	//select sigun
	@RequestMapping(value= "/hospitalSigunCode", method = RequestMethod.GET)
	public ResponseEntity<String> hospitalSigunCode(HttpServletRequest request) throws Exception{
		StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/B551182/codeInfoService/getAddrCodeList"); /*URL*/
		urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=h1WoDyOi4e8rhTTYSuSJmN5H5sMOoJZhuTOsYTgxzzOEJaarD%2FrWJBttt15QA9Dw5h9Tj4%2BslQNc7eTa49aOOg%3D%3D"); /*Service Key*/
		urlBuilder.append("&" + URLEncoder.encode("ServiceKey","UTF-8") + "=" + URLEncoder.encode("h1WoDyOi4e8rhTTYSuSJmN5H5sMOoJZhuTOsYTgxzzOEJaarD%2FrWJBttt15QA9Dw5h9Tj4%2BslQNc7eTa49aOOg%3D%3D", "UTF-8")); /*공공데이터포털에서 받은 인증키*/
		urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
		urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("50", "UTF-8")); /*한 페이지 결과 수*/

		HttpHeaders responseHeader = new HttpHeaders();
		responseHeader.add("Content-type", "application/json; charset=utf-8");
		urlBuilder.append("&" + URLEncoder.encode("addrTp","UTF-8") + "="+ URLEncoder.encode("2", "UTF-8")); /*1:시도, 2:시군구, 3:읍면동*/
		
		String addrCd = request.getParameter("addrCd");
		addrCd = Objects.isNull(addrCd) ? "110000" : addrCd;
		urlBuilder.append("&" + URLEncoder.encode("sidoCd","UTF-8") + "=" + URLEncoder.encode(addrCd, "UTF-8")); /*addrTp 2일 경우 입력*/

		urlBuilder.append("&" + URLEncoder.encode("sidoCdNm","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*addrTp 3일 경우 시도명 입력*/
		urlBuilder.append("&" + URLEncoder.encode("sgguCdNm","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*addrTp 3일 경우 시도명 입력*/

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
	
	
	//select dong
	@RequestMapping(value= "/hospitalDongCode", method = RequestMethod.GET)
	public ResponseEntity<String> hospitalDongCode(HttpServletRequest request) throws Exception{
	StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/B551182/codeInfoService/getAddrCodeList"); /*URL*/
	urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=h1WoDyOi4e8rhTTYSuSJmN5H5sMOoJZhuTOsYTgxzzOEJaarD%2FrWJBttt15QA9Dw5h9Tj4%2BslQNc7eTa49aOOg%3D%3D"); /*Service Key*/
	urlBuilder.append("&" + URLEncoder.encode("ServiceKey","UTF-8") + "=" + URLEncoder.encode("h1WoDyOi4e8rhTTYSuSJmN5H5sMOoJZhuTOsYTgxzzOEJaarD%2FrWJBttt15QA9Dw5h9Tj4%2BslQNc7eTa49aOOg%3D%3D", "UTF-8")); /*공공데이터포털에서 받은 인증키*/
	urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
	urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("50", "UTF-8")); /*한 페이지 결과 수*/

	urlBuilder.append("&" + URLEncoder.encode("addrTp","UTF-8") + "=" + URLEncoder.encode("3", "UTF-8")); /*1:시도, 2:시군구, 3:읍면동*/
	urlBuilder.append("&" + URLEncoder.encode("sidoCd","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*addrTp 2일 경우 입력*/

	HttpHeaders responseHeader = new HttpHeaders();
	responseHeader.add("Content-type", "application/json; charset=utf-8");
	
	String sido = request.getParameter("sido");
	String sigun = request.getParameter("sigun");

	sido = Objects.isNull(sido) ? "서울" : sido;
	sigun = Objects.isNull(sido) ? "강남구" : sigun;
	System.out.println(sido);

	urlBuilder.append("&" + URLEncoder.encode("sidoCdNm","UTF-8") + "=" + URLEncoder.encode(sido, "UTF-8")); /*addrTp 3일 경우 시도명 입력*/
	urlBuilder.append("&" + URLEncoder.encode("sgguCdNm","UTF-8") + "=" + URLEncoder.encode(sigun, "UTF-8")); /*addrTp 3일 경우 시도명 입력*/

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
	
	
	
	//hospital kinds list
	@RequestMapping(value= "/hospitalKindsCode", method = RequestMethod.GET)
	public ResponseEntity<String> hospitalKindsCode(HttpServletRequest request) throws Exception{
		StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/B551182/codeInfoService/getMdlrtSbjectCodeList"); /*URL*/
		urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=h1WoDyOi4e8rhTTYSuSJmN5H5sMOoJZhuTOsYTgxzzOEJaarD%2FrWJBttt15QA9Dw5h9Tj4%2BslQNc7eTa49aOOg%3D%3D"); /*Service Key*/
		urlBuilder.append("&" + URLEncoder.encode("ServiceKey","UTF-8") + "=" + URLEncoder.encode("h1WoDyOi4e8rhTTYSuSJmN5H5sMOoJZhuTOsYTgxzzOEJaarD%2FrWJBttt15QA9Dw5h9Tj4%2BslQNc7eTa49aOOg%3D%3D", "UTF-8")); /*공공데이터포털에서 받은 인증키*/
		urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
		urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("100", "UTF-8")); /*한 페이지 결과 수*/
		
		HttpHeaders responseHeader = new HttpHeaders();
		responseHeader.add("Content-type", "application/json; charset=utf-8");

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
	
	// hospital info view
	@RequestMapping(value= "/hospitalInfoView", method = RequestMethod.GET)
	public ResponseEntity<String> hospitalInfoView(HttpServletRequest request) throws Exception{
		HttpHeaders responseHeader = new HttpHeaders();
		responseHeader.add("Content-type", "application/xml; charset=utf-8");
		
		String sido = request.getParameter("sido");
		sido = Objects.isNull(sido) ? "110000" : sido;
		String sigun = request.getParameter("sigun");
		sigun = Objects.isNull(sigun) ? " " : sigun;
		String dong = request.getParameter("dong");
		dong = Objects.isNull(dong) ? " " : dong;

		String kinds = request.getParameter("kind");
		kinds = Objects.isNull(kinds) ? "21" : kinds;
		
		StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/B551182/hospInfoService/getHospBasisList"); /*URL*/
		urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=h1WoDyOi4e8rhTTYSuSJmN5H5sMOoJZhuTOsYTgxzzOEJaarD%2FrWJBttt15QA9Dw5h9Tj4%2BslQNc7eTa49aOOg%3D%3D"); /*Service Key*/
		urlBuilder.append("&" + URLEncoder.encode("ServiceKey","UTF-8") + "=" + URLEncoder.encode("h1WoDyOi4e8rhTTYSuSJmN5H5sMOoJZhuTOsYTgxzzOEJaarD%2FrWJBttt15QA9Dw5h9Tj4%2BslQNc7eTa49aOOg%3D%3D", "UTF-8")); /*공공데이터포털에서 받은 인증키*/
		urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
		urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /*한 페이지 결과 수*/
		
		urlBuilder.append("&" + URLEncoder.encode("sidoCd","UTF-8") + "=" + URLEncoder.encode(sido, "UTF-8")); /*시도코드*/
		urlBuilder.append("&" + URLEncoder.encode("sgguCd","UTF-8") + "=" + URLEncoder.encode(sigun, "UTF-8")); /*시군구코드*/

		urlBuilder.append("&" + URLEncoder.encode("emdongNm","UTF-8") + "=" + URLEncoder.encode(dong, "UTF-8")); /*읍면동명*/
		urlBuilder.append("&" + URLEncoder.encode("yadmNm","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*병원명 (UTF-8 인코딩 필요)*/

		urlBuilder.append("&" + URLEncoder.encode("zipCd","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*2010:종합병원, 2030:병원, 2040:요양병원, 2050:치과, 2060:한방, 2070:의원, 2080:보건기관, 2090:조산원*/

		urlBuilder.append("&" + URLEncoder.encode("clCd","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*종별코드*/
		urlBuilder.append("&" + URLEncoder.encode("dgsbjtCd","UTF-8") + "=" + URLEncoder.encode(kinds, "UTF-8")); /*진료과목코드*/

		urlBuilder.append("&" + URLEncoder.encode("xPos","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*x좌표(소수점 15)*/
		urlBuilder.append("&" + URLEncoder.encode("yPos","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*y좌표(소수점 15)*/
		urlBuilder.append("&" + URLEncoder.encode("radius","UTF-8") + "=" + URLEncoder.encode("3000", "UTF-8")); /*단위 : 미터(m)*/

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
	
	//medical list
	@RequestMapping(value= "/medicalList", method = RequestMethod.GET)
	public ResponseEntity<String> medicalList(HttpServletRequest request) throws Exception{
		HttpHeaders responseHeader = new HttpHeaders();
		responseHeader.add("Content-type", "application/xml; charset=utf-8");
		StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/B552657/ErmctInsttInfoInqireService/getParmacyListInfoInqire"); /*URL*/
		urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=h1WoDyOi4e8rhTTYSuSJmN5H5sMOoJZhuTOsYTgxzzOEJaarD%2FrWJBttt15QA9Dw5h9Tj4%2BslQNc7eTa49aOOg%3D%3D"); /*Service Key*/


		String sido = request.getParameter("sido");
		sido = Objects.isNull(sido) ? "서울" : sido;

		String sigun = request.getParameter("sigun");
		sigun = Objects.isNull(sido) ? "강남구" : sigun;

		urlBuilder.append("&" + URLEncoder.encode("Q0","UTF-8") + "=" + URLEncoder.encode(sido, "UTF-8")); /*주소(시도)*/
		urlBuilder.append("&" + URLEncoder.encode("Q1","UTF-8") + "=" + URLEncoder.encode(sigun, "UTF-8")); /*주소(시군구)*/

		urlBuilder.append("&" + URLEncoder.encode("QT","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*월~일요일, 공휴일: 1~8*/
		urlBuilder.append("&" + URLEncoder.encode("QN","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*기관명*/
		urlBuilder.append("&" + URLEncoder.encode("ORD","UTF-8") + "=" + URLEncoder.encode("NAME", "UTF-8")); /*순서*/
		urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지 번호*/
		urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /*목록 건수*/
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
	
	//hospital infomation detail view
		@RequestMapping(value= "/hospitalDetailView", method = RequestMethod.GET)
		public String hospitalDetailView(HttpServletRequest request, Model m) throws Exception{
			
			HttpHeaders responseHeader = new HttpHeaders();
			responseHeader.add("Content-type", "application/json; charset=utf-8");
			String ykiho = request.getParameter("ykiho");
			 ykiho = Objects.isNull(ykiho) ? "" : ykiho;
			
			 System.out.println(ykiho);
			
			StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/B551182/medicInsttDetailInfoService/getDetailInfo"); /*URL*/
			urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=h1WoDyOi4e8rhTTYSuSJmN5H5sMOoJZhuTOsYTgxzzOEJaarD%2FrWJBttt15QA9Dw5h9Tj4%2BslQNc7eTa49aOOg%3D%3D"); /*Service Key*/
			urlBuilder.append("&" + URLEncoder.encode("ServiceKey","UTF-8") + "=" + URLEncoder.encode("h1WoDyOi4e8rhTTYSuSJmN5H5sMOoJZhuTOsYTgxzzOEJaarD%2FrWJBttt15QA9Dw5h9Tj4%2BslQNc7eTa49aOOg%3D%3D", "UTF-8")); /*공공데이터포털에서 받은 인증키*/
			urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
			urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /*한 페이지 결과 수*/

			urlBuilder.append("&" + URLEncoder.encode("ykiho","UTF-8") + "=" + URLEncoder.encode(ykiho, "UTF-8")); /*암호화된 요양기호*/

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
			sb.toString();
			m.addAttribute("list", sb);
			System.out.println(sb.toString());
			
			 return "detail_view";
		}
	
	
}
