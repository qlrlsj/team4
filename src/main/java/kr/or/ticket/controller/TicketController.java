package kr.or.ticket.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ticket.model.service.TicketService;

@Controller
public class TicketController {
	@Autowired
	private TicketService service;
	
	@RequestMapping(value="/ticketMain.kt")
	public String TicketMain() {
		return "ticket/ticketMain";
	}
}
