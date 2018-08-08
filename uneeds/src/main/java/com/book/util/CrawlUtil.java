package com.book.util;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.bson.Document;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

import com.book.domain.PriceVO;

public class CrawlUtil {
	
	public static Elements bookInfo(String url)throws Exception{
		Elements d= null;
		ResponseEntity<String> entity = null;
		try {
			// 전체 HTML
			d = Jsoup.connect(url).get().select("div.section.detail");
			// HTML을 TEXT로 파싱(태그 제거)
			//String text = Jsoup.parse(d.toString()).text();
			
			/*
			System.out.println(text);
			System.out.println("===============================");
			System.out.println(d.select("div.dsc"));
			System.out.println("===============================");
			System.out.println(d.select("div:contains(책소개)"));
			*/
			
		} catch (Exception e) {
			System.out.println("naver bookpage crawl error");
		}
			
		return d.select("div.dsc");
	}
	
	public static Map<String, PriceVO> getPrices(String isbn) throws Exception{
		// yes24 yes, kyobo kyo, aladin ald, interpark ipk
		Map<String, PriceVO> hm = new HashMap<String, PriceVO>();
	
		hm.put("yes24", getYes24(isbn));
		hm.put("kyobo", getKyobo(isbn));
		hm.put("aladin", getAladin(isbn));
		
		
		return hm;
	}
	
	public static PriceVO getYes24(String isbn)throws Exception {
		Elements d= null;
		PriceVO vo = null;
		String url=String.format("http://www.yes24.com/searchcorner/Search?query=%s", isbn);	
		try {
			// 전체 HTML
			vo = new PriceVO();
			vo.setUrl(url);	// 가격 정보 url
			d = Jsoup.connect(url).get().select("div.yesSchArea_wrapClass"); // 도서 검색
			
			String new_link = "http://www.yes24.com";
			String add = Jsoup.parse(d.select("div.goodsList_list").first().select("a[href]").first().attr("href").toString()).text();
			new_link += add;
			
			//System.out.println("link: "+new_price);
			
			//org.jsoup.nodes.Document doc = Jsoup.connect(new_link).get();	// 상세 페이지
			
			//신규 가격
			//Elements new_price = doc.select("span.nor_price").select("em.yes_m");
			Elements new_price = d.select("div.goodsList_list").first().select("p.goods_price").select("strong");
			vo.setNew_price(Jsoup.parse(new_price.toString()).text());
			
			//e북 가격
			Elements e_price = d.select("div.goodsList_list").first().select("p.goods_linkage").select("a:contains(eBook)").select("em.txt_price");
			vo.setE_price(Jsoup.parse(e_price.toString()).text());
			
			//중고 가격
			Elements used_price = d.select("div.goodsList_list:nth-child(2)").select("p.goods_price:contains(최저)").select("em.act_txt002:nth-child(1)");
			vo.setUsed_price(Jsoup.parse(used_price.toString()).text());
			
			System.out.println("yes24: "+vo.toString());
		} catch (Exception e) {
			System.out.println("yes24 crawl error");
		}
		
		return vo;
	}
	
	
	public static PriceVO getKyobo(String isbn)throws Exception {
		Element d= null;
		PriceVO vo = null;
		String url=String.format("http://www.kyobobook.co.kr/search/SearchCommonMain.jsp?vPstrKeyWord=%s&vPplace=top", isbn);	
		try {
			// 전체 HTML
			vo = new PriceVO();
			vo.setUrl(url);	// 가격 정보 url
			d = Jsoup.connect(url).get().select("div.list_search_result").first(); // 도서 검색
			
			String new_link = "http://www.kyobobook.co.kr"+Jsoup.parse(d.select("div.title").first().select("a").attr("href").toString()).text();
			//System.out.println("link: "+new_price);
			
			//새책
			//String new_price = Jsoup.parse(Jsoup.connect(new_link).get().select("span.sell_price").first().toString()).text();
			String new_price = Jsoup.parse(d.select("div.sell_price").select("strong").toString()).text();
			vo.setNew_price(new_price);
			
			//이북
			String e_price = Jsoup.parse(d.select("ul.other").select("strong").toString()).text();
			vo.setE_price(e_price.split(" ")[0]);
			
			//중고 url http://used.kyobobook.co.kr/product/prod	uctSearchList.ink?type=isbn&typeValue= {isbn}
			url = "http://used.kyobobook.co.kr/product/productSearchList.ink?type=isbn&typeValue="+isbn;
			String str = Jsoup.connect(url).get().select("div.search_detail").select("dd.lowest-price").toString();
			vo.setUsed_price(Jsoup.parse(str).text().split(" ")[0]);
			
			System.out.println("kyobo: "+vo.toString());
		} catch (Exception e) {
			System.out.println("kyobo crawl error");
		}
		
		return vo;
	}
	
	public static PriceVO getAladin(String isbn)throws Exception {
		Element d= null;
		PriceVO vo = null;
		String url=String.format("http://www.aladin.co.kr/search/wsearchresult.aspx?SearchTarget=All&SearchWord=%s", isbn);	
		try {
			// 전체 HTML
			vo = new PriceVO();
			vo.setUrl(url);	// 가격 정보 url
			d = Jsoup.connect(url).get().select("div.ss_book_box").first(); // 도서 검색
			
			
			//새책
			String new_price = Jsoup.parse(d.select("span.ss_p2").toString()).text();
			vo.setNew_price(new_price);
			
			//이북
			String e_price = Jsoup.parse(d.select("li:contains(전자책)").toString()).text();
			vo.setE_price(e_price.split(": ")[1]);
			
			//중고 url http://used.kyobobook.co.kr/product/prod	uctSearchList.ink?type=isbn&typeValue= {isbn}
			url = "http://www.aladin.co.kr/search/wsearchresult.aspx?SearchTarget=Used&KeyWord="+isbn;
			
			String str = Jsoup.connect(url).get().
					select("div.ss_book_box").select("td:contains(회원중고)").select("tr:contains(회원중고)").
					select("table:nth-child(1)").select("table:nth-child(1)").select("td:contains(회원중고)").
					select("tr:nth-child(4)").toString();
			
			vo.setUsed_price(Jsoup.parse(str).text().split(" ")[3]);
			
			System.out.println("aladin: "+vo.toString());
		} catch (Exception e) {
			System.out.println("aladin crawl error");
		}
		
		return vo;
	}
	
	
	
	//테스트
	public static List<Document> testCrawl(String url) throws Exception {
		// 초기
		//List<String> list = null;

		// PAGE CRAWLING
		try {
			// 전체 HTML
			Elements d = Jsoup.connect("http://news.naver.com/").get().select("a[href]");
			// HTML을 TEXT로 파싱(태그 제거)
			String text = Jsoup.parse(d.toString()).text();
			// logger.error("test1 : " + text);
			// 제거 배열
			String[] stripChars = { ":", ";", ",", ".", "-", "_", "^", "~", "(", ")", "[", "]", "'", "?", "|", ">", "<",
					"!", "\"", "{", "}", "/", "*", "&", "+", "$", "@", "%", "`", "#", "=", "·", "…", "’", "‘", "“", "”",
					"→" };
			// 불필요한 기호 제거
			for (String s : stripChars) {
				// logger.error("- " + s);
				text = text.replace(s, " ");
			}

			System.out.println("text2"+text);

			// HashMap에 단어별 빈도수
			// 뉴스, 3
			// 사회, 2
			String[] words = text.split(" ");
			Map<String, Integer> counts = new HashMap<>();

			// 빈도수 출력
			Integer count = 1;
			String strTemp = null;
			// 1개이상의 수에 대한 패턴
			final Pattern pattern = Pattern.compile("\\d+", Pattern.MULTILINE);
			Matcher matcher = null;
			for (String s : words) {
				// 키워드가 수인경우 제외
				matcher = pattern.matcher(s);
				strTemp = matcher.replaceAll("");
				if (strTemp.equals("")) {
					continue;
				}
				// 새로 추가하는 경우 1, 기존인 경우 기+1
				count = counts.get(s);
				if (!Objects.isNull(count)) {
					count += 1;
				} else {
					count = 1;
				}
				// UPDATE
				counts.put(s, count);
			}
			// MAP 출력 / List로 변환
			Calendar c = Calendar.getInstance();
			c.add(Calendar.HOUR_OF_DAY, 9);
			List<Document> news = new ArrayList<>();
			Document n=new Document();
			for (String key : counts.keySet()) {
				/*
				n = new NewsKeyword();
				n.append("id", key);
				n.append("count", counts.get(key));
				n.append("date", c.getTime());
				n.append("date", c.getTime());
				news.add(n);
				*/
				System.out.println(key + " : " + counts.get(key));
				
			}
			

		} catch (Exception e) {
			
		}

		return null;
		
	}
	
}