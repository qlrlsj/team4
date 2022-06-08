package kr.or.coupon.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Coupon {
	private int couponNo;
	private String couponName;
	private String couponDate;
	private String conponEndDate;
	private int couponDCPrice;
	private int couponDCRate;
	private int couponIf;
	private int couponRange;
}
