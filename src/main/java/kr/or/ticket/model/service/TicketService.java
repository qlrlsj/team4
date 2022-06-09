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
import kr.or.ticket.model.vo.TicketOptions;

@Service
public class TicketService {
	@Autowired
	private TicketDao dao;

	public ArrayList<TicketCategory> selectTicketCategory() {
		return dao.selectTicketCategory();
	}

	public ArrayList<LocalCategory> selectLocalCategory() {
		return dao.selectLocalCategory();
	}

	public int insertTicket(Ticket ticket, TicketOptions options, TicketFile ticketFile) {
		int result = 0;
		//1.ticket테이블 삽입
		int result1 = dao.insertTicket(ticket);
		//2. option 삽입
		int result2 = 0;
		for(int i=0;i<options.getCount();i++) {
			TicketOption option = new TicketOption();
			option.setTicketNo(ticket.getTicketNo());
			option.setOptTitle(options.getOptTitles().get(i));
			option.setOptContent(options.getOptContents().get(i));
			option.setOptPrice(options.getOptPrices().get(i));
			option.setOptDiscountRate(options.getOptDiscountRates().get(i));
			option.setOptDiscountPrice(options.getOptDiscountPrices().get(i));
			option.setOptStock(options.getOptStocks().get(i));
			result2 = dao.insertTicketOption(option);
		}
		//3. file 삽입
		ticketFile.setTicketNo(ticket.getTicketNo());
		int result3 = dao.insertTicketFile(ticketFile);
		
		result = result1 + result2 + result3;

		return result;
	}

	public int insertOptTest(TicketOptions options) {
		int results = 0;
		for(int i=0;i<options.getCount();i++) {
			TicketOption option = new TicketOption();
			option.setTicketNo(1);
			option.setOptTitle(options.getOptTitles().get(i));
			option.setOptContent(options.getOptContents().get(i));
			option.setOptPrice(options.getOptPrices().get(i));
			option.setOptDiscountRate(options.getOptDiscountRates().get(i));
			option.setOptDiscountPrice(options.getOptDiscountPrices().get(i));
			option.setOptStock(options.getOptStocks().get(i));
			System.out.println("service부분 : ");
			System.out.println(option);
			int result = dao.insertTicketOption(option);
			if(result>0) {
				results++;
			}
		}
		return results;
	}

	public Ticket selectTicket(int ticketNo) {
		return dao.selectTicket(ticketNo);
	}

	public ArrayList<TicketOption> selectTicketOption(int ticketNo) {
		return dao.selectTicketOption(ticketNo);
	}

	public TicketFile selectTicketFile(int ticketNo) {
		return dao.selectTicketFile(ticketNo);
	}
	
}
