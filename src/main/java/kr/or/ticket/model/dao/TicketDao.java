package kr.or.ticket.model.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.payment.model.vo.Payment;
import kr.or.ticket.model.vo.LocalCategory;
import kr.or.ticket.model.vo.MainTicket;
import kr.or.ticket.model.vo.OptionInfo;
import kr.or.ticket.model.vo.OptionReserve;
import kr.or.ticket.model.vo.ReserveInfo;
import kr.or.ticket.model.vo.Ticket;
import kr.or.ticket.model.vo.TicketCategory;
import kr.or.ticket.model.vo.TicketFile;
import kr.or.ticket.model.vo.TicketOption;
import kr.or.ticket.model.vo.TicketOptions;
import kr.or.ticket.model.vo.TicketReserve;

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

	public int selectPoint(int memberNo) {
		return sqlSession.selectOne("ticket.selectPoint", memberNo);
	}

	public int insertPayment(Payment payment) {
		return sqlSession.insert("ticket.insertPayment",payment);
	}

	public int insertReserveTicket(TicketReserve ticketR) {
		return sqlSession.insert("ticket.insertReserveTicket",ticketR);
	}

	public String selectReserveNo(int payNo) {
		return sqlSession.selectOne("ticket.selectReserveNo", payNo);
	}

	public int insertReserveOption(OptionReserve or) {
		return sqlSession.insert("ticket.insertReserveOption",or);
	}

	public int updateMemberPoint(Map map2) {
		return sqlSession.update("ticket.updateMemberPoint",map2);
	}

	public int updateCouponuse(Map map1) {
		return sqlSession.update("ticket.updatCouponuse",map1);
	}

	public ReserveInfo selectTicketInfo(int ticketNo) {
		return sqlSession.selectOne("ticket.selectTicketInfo", ticketNo);
	}

	public ArrayList<OptionInfo> selectOptionInfo(String reserveNo) {
		List list = sqlSession.selectList("ticket.selectOptionInfo",reserveNo);
		return (ArrayList<OptionInfo>)list;
	}

	public ArrayList<MainTicket> selectAllTicketOrderRate(int readNo) {
		List list = sqlSession.selectList("ticket.AllTicketOrderRate",readNo);
		return (ArrayList<MainTicket>)list;
	}

	public String selectOneFilepath1(int ticketNo) {
		return sqlSession.selectOne("ticket.selectOneFilepath1", ticketNo);
	}

	public ArrayList<MainTicket> selectSearchTicket(Map map) {
		List list = sqlSession.selectList("ticket.selectSearchTicket",map);
		return (ArrayList<MainTicket>)list;
	}

	public String selectSearchLocalFilepath(String parentLocalName) {
		return sqlSession.selectOne("ticket.selectSearchLocalFilepath", parentLocalName);
	}
	
}
