package kr.or.ticket.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ticket.model.dao.TicketDao;
import kr.or.ticket.model.vo.LocalCategory;
import kr.or.ticket.model.vo.Ticket;
import kr.or.ticket.model.vo.TicketCategory;
import kr.or.ticket.model.vo.TicketFile;
import kr.or.ticket.model.vo.TicketOption;

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

	public int insertTicket(Ticket ticket, TicketOption option, TicketFile ticketFile) {
		int result = 0;
		int result1 = dao.insertTicket(ticket);
		if(result1>0) {
			int result2 = dao.insertTicketOption(option);
			int result3 = dao.insertTicketFile(ticketFile);
			result = 1;
		}else {
			result = -1;
		}
		return result;
	}
	
}
