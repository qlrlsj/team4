package kr.or.ticket.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.ticket.model.vo.LocalCategory;
import kr.or.ticket.model.vo.Ticket;
import kr.or.ticket.model.vo.TicketCategory;
import kr.or.ticket.model.vo.TicketFile;
import kr.or.ticket.model.vo.TicketOption;
import kr.or.ticket.model.vo.TicketOptions;

@Repository
public class TicketDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<TicketCategory> selectTicketCategory() {
		List list = sqlSession.selectList("ticket.selectAllTicketCategory");
		return (ArrayList<TicketCategory>)list;
	}

	public ArrayList<LocalCategory> selectLocalCategory() {
		List list = sqlSession.selectList("ticket.selectAllLocal");
		return (ArrayList<LocalCategory>)list;
	}

	public int insertTicket(Ticket ticket) {
		return sqlSession.insert("ticket.insertTicket",ticket);
	}

	public int insertTicketOption(TicketOption option) {
		return sqlSession.insert("ticket.insertTicketOption",option);
	}

	public int insertTicketFile(TicketFile ticketFile) {
		return sqlSession.insert("ticket.insertTicketFile",ticketFile);
	}

	public Ticket selectTicket(int ticketNo) {
		return sqlSession.selectOne("ticket.selectTicket", ticketNo);
	}

	public ArrayList<TicketOption> selectTicketOption(int ticketNo) {
		List list = sqlSession.selectList("ticket.selectTicketOption", ticketNo);
		return (ArrayList<TicketOption>)list;
	}

	public TicketFile selectTicketFile(int ticketNo) {
		return sqlSession.selectOne("ticket.selectTicketFile", ticketNo);
	}
	
}
