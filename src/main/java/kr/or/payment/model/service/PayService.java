package kr.or.payment.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.payment.model.dao.PayDao;
import kr.or.payment.model.vo.Payment;

@Service
public class PayService {
	@Autowired
	private PayDao dao;

	public int insertPayment(Payment pay) {
		// TODO Auto-generated method stub
		return dao.insertPayment(pay);
	}

	public int selectPayNo() {
		// TODO Auto-generated method stub
		return dao.selectPayNo();
	}
}
