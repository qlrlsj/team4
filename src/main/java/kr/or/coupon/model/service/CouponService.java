package kr.or.coupon.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.coupon.model.dao.CouponDao;
import kr.or.coupon.model.vo.Coupon;

@Service
public class CouponService {
	@Autowired
	private CouponDao Dao;

	public ArrayList<Coupon> selectAllCoupon(int memberNo) {
		return Dao.selectAllCoupon(memberNo);
	}
	
}
