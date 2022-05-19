package kr.or.ticket.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ticket.model.dao.TicketDao;

@Service
public class TicketService {
	@Autowired
	private TicketDao dao;
	
}
