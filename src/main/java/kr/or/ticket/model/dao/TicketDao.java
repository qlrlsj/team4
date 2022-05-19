package kr.or.ticket.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TicketDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
}
