package kr.or.coupon.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

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

	public int updateCouponUse(int couponNo, int userNo) {
		Map map = new HashMap();
		map.put("couponNo",couponNo);
		map.put("userNo",userNo);
		return Dao.updateCouponUse(map);
	}

	public int couponMake(Coupon coupon) {
		// TODO Auto-generated method stub
		return Dao.couponMake(coupon);
	}
	
}
