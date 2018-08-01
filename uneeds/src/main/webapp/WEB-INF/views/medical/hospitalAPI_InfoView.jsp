<%@page import="java.util.Objects"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.net.URL"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
 pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<% /* 주소별 병원목록 */

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

 out.print(sb.toString());
%>