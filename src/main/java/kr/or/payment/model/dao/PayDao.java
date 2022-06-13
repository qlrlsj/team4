package kr.or.payment.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.payment.model.vo.Payment;

@Repository
public class PayDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int insertPayment(Payment pay) {
		System.out.println(pay);
		int result = sqlSession.insert("payment.insertMember",pay);
		return result;
	}

	public int selectPayNo() {
		int payNo = sqlSession.selectOne("payment.selectMaxPayNo");
		return payNo;
	}
}
