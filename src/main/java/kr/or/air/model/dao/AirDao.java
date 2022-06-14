package kr.or.air.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
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

	public int insertAirSeat(HashMap<String, String> map) {
		System.out.println(map);
		int result = sqlSession.insert("Air.insertAirSeat",map);
		return result;
	}

	public ArrayList<String> findSeat(HashMap<String, String> map) {
		System.out.println(map);
		List list = sqlSession.selectList("Air.findSeat",map);
		System.out.println(list);
		return (ArrayList<String>)list;
	}

	public ArrayList<AirPayment> airCheck(HashMap<String, String> map) {
		List list = sqlSession.selectList("Air.airCheck",map);
		System.out.println(list);
		return (ArrayList<AirPayment>)list;
	}

	public AirPayment airPayReserve(String airNumber) {
		AirPayment airPayment = sqlSession.selectOne("Air.airPayReserve",airNumber);
		System.out.println(airPayment);
		return (AirPayment)airPayment;
	}

	public ArrayList<AirReserveComplete> airCompleteReserve(String airNumber) {
		List list = sqlSession.selectList("Air.airCompleteReserve",airNumber);
		System.out.println(list);
		return (ArrayList<AirReserveComplete>)list;
	}

}
