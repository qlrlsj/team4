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
			System.out.println("ticket insert성공");
			option.setTicketNo(ticket.getTicketNo());
			ticketFile.setTicketNo(ticket.getTicketNo());
			int result2 = dao.insertTicketOption(option);
			if(result2>0) {
				System.out.println("ticketOption insert성공");
			}else {
				System.out.println("ticketOption insert실패");
				int result3 = dao.insertTicketFile(ticketFile);
				if(result3>0) {
					System.out.println("ticketFile insert성공");
					result = 1;
				}else {
					System.out.println("ticketFile insert실패");
					result = -1;
				}
			}
			
		}else {
			System.out.println("ticket insert실패");
			result = -1;
		}
		return result;
	}
	
}
