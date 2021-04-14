package com.company.abandonment.common;


import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.springframework.stereotype.Component;

@Component
public class AbandonmentAPI {
		//api 리스트
	    public String getAban(String pageNo, String uprCd) throws IOException {
	    	StringBuilder urlBuilder = new StringBuilder("http://openapi.animal.go.kr/openapi/service/rest/abandonmentPublicSrvc/abandonmentPublic"); /*URL*/
	        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=8tY1eYWe6lr01%2Fy4I1nRYPMeVaVSYb9Q63Ov8Q0%2BOHG25bo1w6WUYCV3uFxg%2B8%2BlMnvBhuqC79W1QUlkINNqTQ%3D%3D"); /*Service Key*/
	        urlBuilder.append("&upkind=417000");
	        if(uprCd != null && uprCd != "") {
	        	urlBuilder.append("&upr_cd=").append(uprCd);	        
	        }
	        urlBuilder.append("&numOfRows=9");
	        urlBuilder.append("&pageNo=").append(pageNo);
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
			return sb.toString();
	    }	    
	    
	    
	    //시도 리스트
	    public String getAbanSido() throws IOException {
	    	StringBuilder urlBuilder = new StringBuilder("http://openapi.animal.go.kr/openapi/service/rest/abandonmentPublicSrvc/sido"); /*URL*/
	        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=8tY1eYWe6lr01%2Fy4I1nRYPMeVaVSYb9Q63Ov8Q0%2BOHG25bo1w6WUYCV3uFxg%2B8%2BlMnvBhuqC79W1QUlkINNqTQ%3D%3D"); /*Service Key*/
	        urlBuilder.append("&numOfRows=17");
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
	        return sb.toString();
	    }
	    
	    
}