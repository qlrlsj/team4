package kr.or.air.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.air.model.dao.AirDao;
import kr.or.air.model.vo.AirPayment;
import kr.or.air.model.vo.AirReserveComplete;

@Service
public class AirService {
	@Autowired
	private AirDao dao;

	public int insertAirReserve(AirPayment airPayment) {
		
		return dao.insertAirReserve(airPayment);
	}

	public String selectReserveNo() {
		// TODO Auto-generated method stub
		return dao.selectReserveNo();
	}

	public int insertAir(AirReserveComplete air) {
		// TODO Auto-generated method stub
		return dao.insertAir(air);
	}

	public int insertAirSeat(HashMap<String, String> map) {
		// TODO Auto-generated method stub
		return dao.insertAirSeat(map);
	}

	public ArrayList<String> findSeat(HashMap<String, String> map) {
		// TODO Auto-generated method stub
		return dao.findSeat(map);
	}

	
}
