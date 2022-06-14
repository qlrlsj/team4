package kr.or.coupon.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.or.coupon.model.service.CouponService;
import kr.or.coupon.model.vo.Coupon;


@Controller
public class CouponController {
	@Autowired
	private CouponService service;
	
	@ResponseBody
	@RequestMapping(value="selectAllCoupon.kt", produces = "application/json;charset=utf-8")
	public String selectAllCoupon(int memberNo) {
		ArrayList<Coupon> list = service.selectAllCoupon(memberNo);
		return new Gson().toJson(list);
	}
	@ResponseBody
	@RequestMapping(value="updateCouponUse.kt", produces = "application/json;charset=utf-8")
	public String updateCouponUse(int userNo, int couponNo) {
		System.out.println(userNo);
		System.out.println(couponNo);
		int result = service.updateCouponUse(couponNo, userNo);
		return String.valueOf(result);
	}
	
	@RequestMapping(value="/insertCoupon.kt")
	public String insertCoupon(HttpSession session) {
		
		return "coupon/insertCoupon";
	}
	
	@RequestMapping(value="/couponMake.kt")
	public String couponMake(HttpSession session, Model model, Coupon coupon) {
		String[] endDate = coupon.getConponEndDate().split("-");
		System.out.println(endDate[0].substring(2,4));
		coupon.setConponEndDate(endDate[0].substring(1,3) +"/"+ endDate[1] +"/"+ endDate[2]);
		int result = service.couponMake(coupon);
		return "air/airMain";
	}
}
