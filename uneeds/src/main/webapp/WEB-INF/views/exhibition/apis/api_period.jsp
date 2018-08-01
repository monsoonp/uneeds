<%@page import="java.util.Objects"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.net.URL"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
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
out.print(sb.toString());
%>