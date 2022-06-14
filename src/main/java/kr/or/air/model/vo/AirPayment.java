package kr.or.air.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class AirPayment {
	private String reserveNo;
	private int payNo;
	private int memberNo;
	private String orderDate;
	private String airPay;
	private String memberName;
	private String phone;
	private String reserveState;
	private String airStart;
	private String airEnd;
	
}
