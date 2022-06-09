package kr.or.payment.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.payment.model.dao.PayDao;

@Service
public class PayService {
	@Autowired
	private PayDao dao;

	public int insertPayment(int memberNo) {
		// TODO Auto-generated method stub
		return dao.insertPayment();
	}
}
