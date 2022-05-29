package kr.or.hostel.controller;


import java.util.Arrays;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.google.gson.Gson;

import kr.or.hostel.model.service.HostelService;
import kr.or.hostel.model.vo.Hostel;
import kr.or.member.model.vo.Member;

@Controller
public class HostelController {
@Autowired
private HostelService service;

@RequestMapping(value = "/hostelMain.kt")
public String hostelMain() {

	return "hostel/hostelMain";
}

@RequestMapping(value = "/insertHostelForm.kt")
public String insertHostelForm() {

	return "hostel/insertHostelForm";
}
@RequestMapping(value = "/insertHostelForm1.kt")
public String insertHostelForm1() {

	return "hostel/hostelInsert1";
}

@RequestMapping(value = "/insertHostel.kt")
public String insertHostel(Hostel h, String[] roomOptions,String [] hostelPrices,String[] standardBooknums,String[] maxBooknums,String[] roomNames) {
	System.out.println("호텔정보:"+h);
	System.out.println("----------------옵션정보------------");
	System.out.println("방이름:"+Arrays.toString(roomNames));
	System.out.println("옵션상세정보:"+Arrays.toString(roomOptions));
	System.out.println("가격:"+Arrays.toString(hostelPrices));
	System.out.println("기준인원:"+Arrays.toString(standardBooknums));
	System.out.println("최대인원:"+Arrays.toString(maxBooknums));

	int result = service.insertHostel(h,roomOptions,hostelPrices,standardBooknums,maxBooknums,roomNames);
	if(result>0) {
		System.out.println("Hostel 기본 테이블 인서트성공");
	}else {
		System.out.println("인서트 실패");
	}
	return "redirect:/insertHostelForm1.kt";
}

}
