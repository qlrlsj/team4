package kr.or.ticket.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ticket.model.dao.TicketDao;
import kr.or.ticket.model.vo.LocalCategory;
import kr.or.ticket.model.vo.TicketCategory;

@Service
public class TicketService {
	@Autowired
	private TicketDao dao;

	public ArrayList<TicketCategory> selectAllTicketCategory() {
		return dao.selectAllTicket();
	}

	public ArrayList<LocalCategory> selectAllLocal() {
		return dao.selectAllLocal();
	}
	
}
