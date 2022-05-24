package kr.or.ticket.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.or.ticket.model.service.TicketService;
import kr.or.ticket.model.vo.LocalCategory;
import kr.or.ticket.model.vo.TicketCategory;

@Controller
public class TicketController {
	@Autowired
	private TicketService service;
	
	@RequestMapping(value="/ticketMain.kt")
	public String TicketMain() {
		return "ticket/ticketMain";
	}
	
	@RequestMapping(value="/insertTicketPage.kt")
	public String insertTicketPage(Model model) {
		ArrayList<TicketCategory> ticketCategory = service.selectAllTicketCategory();
		model.addAttribute("ticketCategory", ticketCategory);
		return "ticket/insertTicketPage";
	}
	
	@ResponseBody
	@RequestMapping(value="/selectAllTicketCategory.kt",produces = "application/json;charset=utf-8")
	public String selectAllTicketCategory() {
		Gson gson = new Gson();
		ArrayList<TicketCategory> ticketCategory = service.selectAllTicketCategory();
		return gson.toJson(ticketCategory);
	}
	@ResponseBody
	@RequestMapping(value="/selectAllLocal.kt",produces = "application/json;charset=utf-8")
	public String selectAllLocal() {
		Gson gson = new Gson();
		ArrayList<LocalCategory> local = service.selectAllLocal();
		return gson.toJson(local);
	}
	
}
