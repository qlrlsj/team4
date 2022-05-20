package kr.or.hostel.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.google.gson.Gson;

import kr.or.hostel.model.service.HostelService;
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

}
