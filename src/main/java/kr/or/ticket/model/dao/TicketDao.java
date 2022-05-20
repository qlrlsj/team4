package kr.or.ticket.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import kr.or.ticket.model.vo.TicketCategory;

@Repository
public class TicketDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<TicketCategory> selectAllTicket() {
		List list = sqlSession.selectList("ticket.selectAllTicketCategory");
		return (ArrayList<TicketCategory>)list;
	}
	
}
