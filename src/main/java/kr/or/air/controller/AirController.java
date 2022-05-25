package kr.or.air.controller;

import java.io.IOException;
import java.util.ArrayList;

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
	public String selectAllMemberId(HttpSession session, AirSearch air) {
		String url = "https://api.odcloud.kr/api/15043890/v1/uddi:2ed58abb-3eb5-4dfc-a32e-a69030b1cdc4?serviceKey=sooYLNGU3ovHONF7COC4tvl8FS0QrwFu0475e%2FXjisbYjnPIBr2Y8E80D8wDI%2F0JC%2BI4IjfdTjT59jfjqMwRpA%3D%3D";
		//Connection result = Jsoup.connect(url).data("key",key).data("page","1").data("perPage","6158");
		JsonParser parser = new JsonParser();
		String result;
		try {
			result = Jsoup.connect(url)							//접속할 url
								.data("page","1")				//매개변수 page 설정
								.data("perPage","50")			//매개변수 perPage 설정
								.ignoreContentType(true)		//리턴하는 데이터 타입은 상관없음
								.execute()						//실행
								.body();
			
			
			System.out.println(result);
			JsonElement element = parser.parse(result);
			JsonArray data = element.getAsJsonObject().get("data").getAsJsonArray();
			for(int i = 0;i<data.size();i++) {
				JsonObject oneData = (JsonObject)data.get(i);
				String rlwhd = oneData.get("기종").getAsString();
				System.out.println(rlwhd);
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}						//실행결과를 문자열 형태로 반환
		ArrayList<AirSearch> list = null;
		//list.add(air);
		//return new Gson().toJson(list);
		return "air/airMain";
	}
	
}
