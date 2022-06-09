package kr.or.payment.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Payment {
	private int payNo;
	private int payPrice;
	private int pointUse;
	private int payCoupon;
	private int pointAdd;
	private String payDate;
	private int payCouponCode;
}
