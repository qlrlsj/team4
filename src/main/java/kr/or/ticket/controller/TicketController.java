package kr.or.ticket.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ticket.model.service.TicketService;
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
	
}
