package kr.or.ticket.model.vo;

import java.util.ArrayList;

import kr.or.coupon.model.vo.Coupon;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CouponPoint {
	private ArrayList<Coupon> couponList;
	private int point;
}
