package kr.or.payment.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.or.payment.model.service.PayService;
import kr.or.payment.model.vo.Payment;


@Controller
public class PayController {
	@Autowired
	private PayService service;
	
	@ResponseBody
	@RequestMapping(value="selectAllCoupon.kt", produces = "application/json;charset=utf-8")
	public String selectAllCoupon(int memberNo) {
		int result = service.insertPayment(memberNo);
		return String.valueOf(result);
	}
}
