package kr.or.air.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.jsoup.Connection;
import org.jsoup.Connection.Response;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import kr.or.air.model.service.AirService;
import kr.or.air.model.vo.AirPayment;
import kr.or.air.model.vo.AirReserve;
import kr.or.air.model.vo.AirSchedule;
import kr.or.air.model.vo.AirSearch;

@Controller
public class AirController {
	@Autowired
	private AirService service;
	
	@RequestMapping(value="/AirMain.kt")
	public String MainPage(HttpSession session) {
		return "air/airMain";
	}
	
	@RequestMapping(value="/payComplete.kt")
	public String payComplete(HttpSession session, AirReserve airReserve, AirPayment airPayment) {
		
		return "air/airMain";
	}
	
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/airSearch.kt")
	public String selectAllAirAPI(HttpSession session, AirSearch air, Model model) {
		String url = "https://api.odcloud.kr/api/15043890/v1/uddi:2ed58abb-3eb5-4dfc-a32e-a69030b1cdc4?serviceKey=sooYLNGU3ovHONF7COC4tvl8FS0QrwFu0475e%2FXjisbYjnPIBr2Y8E80D8wDI%2F0JC%2BI4IjfdTjT59jfjqMwRpA%3D%3D";
		JsonParser parser = new JsonParser();
		String result;
		try {
			result = Jsoup.connect(url)							//접속할 url
								.data("page","1")				//매개변수 최초페이지 설정
								.data("perPage","6159")			//매개변수 마지막페이지 설정
								.ignoreContentType(true)		//리턴하는 데이터 타입은 상관없음
								.execute()						//실행
								.body();						//body의 내용을 문자열로
			JsonElement element = parser.parse(result);			//문자열을 Json 형식으로 변환
			JsonArray data = element.getAsJsonObject().get("data").getAsJsonArray();	//JsonElement에서 data값 만을 조회하여 Json 배열로변환
			ArrayList<AirSchedule> startingList = new ArrayList<AirSchedule>();		//출발 스케줄리스트
			ArrayList<AirSchedule> arrivalList = new ArrayList<AirSchedule>();		//도착 스케줄리스트
			DateFormat dtFormat = new SimpleDateFormat("yyyy-MM-dd");			//날짜 초기화
			Calendar cal1 = Calendar.getInstance();								//시작날짜계산
			Calendar cal2 = Calendar.getInstance();								//종료날짜계산
			Calendar cal3 = Calendar.getInstance();
			Calendar cal4 = Calendar.getInstance();
			Date StartDate = dtFormat.parse(air.getAirStartDate());				//입력받은 출발날짜
			cal3.setTime(StartDate);
			Date EndDate = null;
			if(!air.getAirEndDate().equals("")) {
				EndDate = dtFormat.parse(air.getAirEndDate());					//입력받은 도착날짜
				cal4.setTime(EndDate);
			}
			
			int dayNum1 = cal3.get(Calendar.DAY_OF_WEEK);						//입력받은 출발날짜 요일
			int dayNum2 = cal4.get(Calendar.DAY_OF_WEEK);						//입력받은 도착날짜 요일
			String day1 = weekString(dayNum1);
			String day2 = weekString(dayNum2);
			
			Date today = new Date();
			DateFormat tiFormat = new SimpleDateFormat("HH:mm");
			
			for(int i = 0;i<data.size();i++) {
				JsonObject oneData = (JsonObject)data.get(i);
				//출발공항이 입력받은 출발공항이고 도착공항이 입력받은 도착공항일 경우
				if(oneData.get("출발공항").getAsString().equals(air.getAirStart()) && oneData.get("도착공항").getAsString().equals(air.getAirArrive())) {
					Date date1 = dtFormat.parse(oneData.get("시작일자").getAsString());			//스케줄 시작일자(해당 스케줄이 그날 이후부터 있는 것)
					Date date2 = dtFormat.parse(oneData.get("종료일자").getAsString());			//스케줄 종료일자(해당 스케줄이 그날 이후부터 사라지는 것)
					cal1.setTime(date1);
					cal2.setTime(date2);
					cal1.add(Calendar.YEAR, 1);												//스케줄 시작날짜와 종료날짜에 1년씩 추가(2021년도 스케줄이므로)
					cal2.add(Calendar.YEAR, 1);
					//출발일자가 시작일자 이후이고 종료일자 이전이며 요일이 맞을 경우	
					if(cal1.before(cal3) && cal2.after(cal3) && oneData.get("운항요일").getAsString().contains(day1)) {	
						String airStartTime;
						if(oneData.get("출발시간").getAsString().length()==4) {
							airStartTime = "0"+oneData.get("출발시간").getAsString();	
						}else {
							airStartTime = oneData.get("출발시간").getAsString();	
						}
						//출발날짜와 오늘날짜와 같지않거나, 출발시간이 지금 이후일 경우
						if(!dtFormat.format(today).equals(dtFormat.format(StartDate))||(dtFormat.format(today).equals(dtFormat.format(StartDate)) && airStartTime.compareTo(tiFormat.format(today))>0)) {
							AirSchedule airSchedule = insertSchedule(oneData, air.getAirStartDate());
							startingList.add(airSchedule);							
						}
					}
				}
				if(!air.getAirEndDate().equals("")) {
					//귀환 스케줄리스트에 추가
					if(oneData.get("출발공항").getAsString().equals(air.getAirArrive()) && oneData.get("도착공항").getAsString().equals(air.getAirStart())) {
						Date date1 = dtFormat.parse(oneData.get("시작일자").getAsString());
						Date date2 = dtFormat.parse(oneData.get("종료일자").getAsString());
						cal1.setTime(date1);
						cal2.setTime(date2);
						cal1.add(Calendar.YEAR, 1);
						cal2.add(Calendar.YEAR, 1);
						
						if(cal1.before(cal4) && cal2.after(cal4) && oneData.get("운항요일").getAsString().contains(day2)){	
							String airStartTime;
							if(oneData.get("출발시간").getAsString().length()==4) {
								airStartTime = "0"+oneData.get("출발시간").getAsString();			
							}else {
								airStartTime = oneData.get("출발시간").getAsString();	
							}
							if(!dtFormat.format(today).equals(dtFormat.format(EndDate))||(dtFormat.format(today).equals(dtFormat.format(EndDate)) && airStartTime.compareTo(tiFormat.format(today))>0)) {
								AirSchedule airSchedule = insertSchedule(oneData, air.getAirEndDate());
								arrivalList.add(airSchedule);							
							}
						}
					}
				}
			}
			Collections.sort(startingList);
			Collections.sort(arrivalList);
			model.addAttribute("startingList",startingList);
			model.addAttribute("arrivalList",arrivalList);
			model.addAttribute("AirSearch",air);
			System.out.println("출발리스트 상태"+startingList);
			System.out.println("도착리스트 상태"+arrivalList);
		} catch (IOException e) {
			e.printStackTrace();
		}	catch (ParseException e) {
			e.printStackTrace();
		}
		return "air/airSearch";
	}
	public String weekString(int dayNum) {
		String day = "" ;
		switch(dayNum){
		case 1:
			day = "일"; break ;
		case 2:
			day = "월"; break ;
		case 3:
			day = "화"; break ;
		case 4:
			day = "수"; break ;
		case 5:
			day = "목"; break ;
		case 6:
			day = "금"; break ;
		case 7:
			day = "토"; break ;
		}
		return day;
	}
	public AirSchedule insertSchedule(JsonObject oneData, String airDate) {
		String airLine = oneData.get("항공사").getAsString();
		String airNumber = oneData.get("편명").getAsString();
		String airStartTime;
		String airEndTime;
		if(oneData.get("출발시간").getAsString().length()==4) {
			airStartTime = "0"+oneData.get("출발시간").getAsString();			
		}else {
			airStartTime = oneData.get("출발시간").getAsString();	
		}
		if(oneData.get("도착시간").getAsString().length()==4) {
			airEndTime = "0"+oneData.get("도착시간").getAsString();			
		}else {
			airEndTime = oneData.get("도착시간").getAsString();	
		}
		String airStart = oneData.get("출발공항").getAsString();
		String airArrive = oneData.get("도착공항").getAsString();
		AirSchedule airSchedule;
		return airSchedule = new AirSchedule(airLine,airNumber,airStartTime,airEndTime,airStart,airArrive,airDate);
	}
	@RequestMapping(value="/airReserve.kt")
	public String selectAllAir(HttpSession session, Model model, AirReserve airReserve) {
		model.addAttribute("airReserve",airReserve);
		return "air/airSelectGrade";
	}
}