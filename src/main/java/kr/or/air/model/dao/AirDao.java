package kr.or.air.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.air.model.vo.AirPayment;
import kr.or.air.model.vo.AirReserveComplete;


@Repository
public class AirDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int insertAirReserve(AirPayment airPayment) {
		int result = sqlSession.insert("Air.insertAirReserve",airPayment);
		return result;
	}

	public String selectReserveNo() {
		String ReserveNo = sqlSession.selectOne("Air.selectReserveNo");
		return ReserveNo;
	}

	public int insertAir(AirReserveComplete air) {
		int result = sqlSession.insert("Air.AirReserveComplete",air);
		return result;
	}

}
