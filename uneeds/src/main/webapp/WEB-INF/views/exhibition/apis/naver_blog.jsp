<%@page import="java.util.Objects"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.net.URL"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%
String stext = request.getParameter("text");
stext = Objects.isNull(stext) ? "검색어" : stext;

String clientId = "JbK5WIkyuNSphDFKqd6o";//애플리케이션 클라이언트 아이디값";
        String clientSecret = "ybwgEIEvnL";//애플리케이션 클라이언트 시크릿값";
        try {
            String text = URLEncoder.encode(stext, "UTF-8");
            String apiURL = "https://openapi.naver.com/v1/search/blog?query="+ text; // json 결과
            //String apiURL = "https://openapi.naver.com/v1/search/blog.xml?query="+ text; // xml 결과
            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("GET");
            con.setRequestProperty("X-Naver-Client-Id", clientId);
            con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
            int responseCode = con.getResponseCode();
            BufferedReader br;
            if(responseCode==200) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else {  // 에러 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }
            String inputLine;
            StringBuffer res = new StringBuffer();
            while ((inputLine = br.readLine()) != null) {
                res.append(inputLine);
            }
            br.close();
            System.out.println(res.toString());

            out.print(res.toString());

        } catch (Exception e) {
            System.out.println(e);
        }

%>