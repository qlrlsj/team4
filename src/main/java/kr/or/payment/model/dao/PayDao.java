package kr.or.payment.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PayDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int insertPayment() {
		// TODO Auto-generated method stub
		return 0;
	}
}
