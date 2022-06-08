package kr.or.coupon.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
}
