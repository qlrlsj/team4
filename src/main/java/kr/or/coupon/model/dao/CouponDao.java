package kr.or.coupon.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.coupon.model.vo.Coupon;

@Repository
public class CouponDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<Coupon> selectAllCoupon(int memberNo) {
		List list = sqlSession.selectList("coupon.selectAllCoupon",memberNo);
		return (ArrayList<Coupon>)list;
	}

	public int updateCouponUse(Map map) {
		int result = sqlSession.update("coupon.updateCouponUse",map);
		return result;
	}

	public ArrayList<Coupon> selectAllCouponTicket(Map map) {
		List list = sqlSession.selectList("coupon.selectAllCouponTicket",map);
		return (ArrayList<Coupon>)list;
	}

	public int couponMake(Coupon coupon) {
		int result = sqlSession.insert("coupon.couponMake",coupon);
		return result;
	}

	public ArrayList<Coupon> selectCoupon() {
		List list = sqlSession.selectList("coupon.selectCoupon");
		return (ArrayList<Coupon>)list;
	}


	public int couponSend(int couponNo, String id) {
		// TODO Auto-generated method stub
		int memberNo = sqlSession.selectOne("coupon.findMemberNo",id);
		HashMap<Object, Object> map = new HashMap<Object, Object>();
		map.put("memberNo", memberNo);
		map.put("couponNo", couponNo);
		int result = sqlSession.insert("coupon.couponSend",map);
		
		return 0;
	}
	
}
