package kr.or.seller.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Payment {
	private String payDate;
	private int productNo;
	private int payNo;
	private String productName;
	private String memberName;
	private int payPrice;
	private int pointUse;
	private int couponUse;
	private int pointAdd;
	private int payCoupon;
}
