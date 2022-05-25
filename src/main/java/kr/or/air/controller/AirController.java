package kr.or.air.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
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
import kr.or.air.model.vo.Air;
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
	
	@RequestMapping(value="/selectAllAir.kt")
	public String selectAllAir(HttpSession session, Model model) {
		ArrayList<Air> airlist = service.selectAllAir();
		model.addAttribute("air",airlist);
		return "air/airMain";
	}
	
	@RequestMapping(value="/airSearch.kt")
	public String selectAllMemberId(HttpSession session, AirSearch air, Model model) {
		String url = "https://api.odcloud.kr/api/15043890/v1/uddi:2ed58abb-3eb5-4dfc-a32e-a69030b1cdc4?serviceKey=sooYLNGU3ovHONF7COC4tvl8FS0QrwFu0475e%2FXjisbYjnPIBr2Y8E80D8wDI%2F0JC%2BI4IjfdTjT59jfjqMwRpA%3D%3D";
		JsonParser parser = new JsonParser();
		String result;
//		System.out.println("입력받은 값: " + air);
		try {
			result = Jsoup.connect(url)							//접속할 url
								.data("page","1")				//매개변수 page 설정
								.data("perPage","200")			//매개변수 perPage 설정
								.ignoreContentType(true)		//리턴하는 데이터 타입은 상관없음
								.execute()						//실행
								.body();
			JsonElement element = parser.parse(result);
			JsonArray data = element.getAsJsonObject().get("data").getAsJsonArray();
			ArrayList<AirSchedule> startingList = new ArrayList<AirSchedule>();		//출발 스케줄리스트
			ArrayList<AirSchedule> arrivalList = new ArrayList<AirSchedule>();		//도착 스케줄리스트
			DateFormat dtFormat = new SimpleDateFormat("yyyy-MM-dd");			//날짜 초기화
			Calendar cal1 = Calendar.getInstance();								//시작날짜계산
			Calendar cal2 = Calendar.getInstance();								//종료날짜계산
			
			Date StartDate = dtFormat.parse(air.getAirStartDate());				//입력받은 출발날짜
			Date EndDate = dtFormat.parse(air.getAirEndDate());					//입력받은 도착날짜
			Calendar cal3 = Calendar.getInstance();
			Calendar cal4 = Calendar.getInstance();
			cal3.setTime(StartDate);
			cal4.setTime(EndDate);
			
//			System.out.println("출발날짜: "+cal3.getTime());
//			System.out.println("도착날짜: "+cal4.getTime());
			for(int i = 0;i<data.size();i++) {
				JsonObject oneData = (JsonObject)data.get(i);
				//출발공항이 입력받은 출발공항이고 도착공항이 입력받은 도착공항일 경우
				if(oneData.get("출발공항").getAsString().equals(air.getAirStart()) && oneData.get("도착공항").getAsString().equals(air.getAirArrive())) {
					Date date1 = dtFormat.parse(oneData.get("시작일자").getAsString());
					Date date2 = dtFormat.parse(oneData.get("종료일자").getAsString());
					cal1.setTime(date1);
					cal2.setTime(date2);
					cal1.add(Calendar.YEAR, 1);
					cal2.add(Calendar.YEAR, 1);
					String airStartDate = dtFormat.format(cal1.getTime());
					String airEndDate = dtFormat.format(cal2.getTime());
//					System.out.println("스케줄 시작 날짜: "+cal1.getTime());
//					System.out.println("스케줄 종료 날짜: "+cal2.getTime());
//					System.out.println("비교 대상 날짜: "+StartDate);
//					System.out.println(cal1.before(cal3) );
//					System.out.println(cal2.after(cal3) );
					
					if(cal1.before(cal3) && cal2.after(cal3)) {				//출발일자가 시작일자보다 크고 종료일자보다 작다면
	//					System.out.println("시작날짜"+dtFormat.format(cal1.getTime()));
	//					System.out.println("종료날짜"+dtFormat.format(cal2.getTime()));
						String airLine = oneData.get("항공사").getAsString();
						String airNumber = oneData.get("편명").getAsString();
						String airStartTime = oneData.get("출발시간").getAsString();
						String airEndTime = oneData.get("도착시간").getAsString();
						String airStart = oneData.get("출발공항").getAsString();
						String airArrive = oneData.get("도착공항").getAsString();
						AirSchedule airSchedule = new AirSchedule(airLine,airNumber,airStartTime,airEndTime,airStart,airArrive,air.getAirStartDate());
						startingList.add(airSchedule);								//출발 스케줄 리스트에 해당 스케줄을 추가 
						
//						System.out.println("조건문 진입 확인용");
					}
				}
				
				if(oneData.get("출발공항").getAsString().equals(air.getAirArrive()) && oneData.get("도착공항").getAsString().equals(air.getAirStart())) {
					Date date1 = dtFormat.parse(oneData.get("시작일자").getAsString());
					Date date2 = dtFormat.parse(oneData.get("종료일자").getAsString());
					cal1.setTime(date1);
					cal2.setTime(date2);
					cal1.add(Calendar.YEAR, 1);
					cal2.add(Calendar.YEAR, 1);
					String airStartDate = dtFormat.format(cal1.getTime());
					String airEndDate = dtFormat.format(cal2.getTime());
					
					if(cal1.before(cal4) && cal2.after(cal4)) {				//출발일자가 시작일자보다 크고 종료일자보다 작다면
	//					System.out.println("시작날짜"+dtFormat.format(cal1.getTime()));
	//					System.out.println("종료날짜"+dtFormat.format(cal2.getTime()));
						String airLine = oneData.get("항공사").getAsString();
						String airNumber = oneData.get("편명").getAsString();
						String airStartTime = oneData.get("출발시간").getAsString();
						String airEndTime = oneData.get("도착시간").getAsString();
						String airStart = oneData.get("출발공항").getAsString();
						String airArrive = oneData.get("도착공항").getAsString();
						AirSchedule airSchedule = new AirSchedule(airLine,airNumber,airStartTime,airEndTime,airStart,airArrive,air.getAirEndDate());
						arrivalList.add(airSchedule);								//출발 스케줄 리스트에 해당 스케줄을 추가 
						
//						System.out.println("조건문 진입 확인용");
					}
				}
			}
			model.addAttribute("startingList",startingList);
			model.addAttribute("startingList",arrivalList);
			System.out.println("출발리스트 상태"+startingList);
			System.out.println("도착리스트 상태"+arrivalList);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "air/airSearch";
	}
	
}
