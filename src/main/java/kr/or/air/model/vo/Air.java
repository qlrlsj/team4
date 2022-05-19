package kr.or.air.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Air {
	private String reserveNo;
	private int payNo;
	private String airName;
	private int memberNo;
	private int airLevel;
	private String orderDate;
	private String airStart;
	private String airEnd;
	private String airPay;
	private String memberName;
	private String phone;
	private String reserveState;
}
