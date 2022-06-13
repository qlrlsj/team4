package kr.or.ticket.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Reserve {
	private int reserveNo;
	private int ticketNo;
	private Integer memberNo;
	private String reserveName;
	private String reservePhone;
	private String reserveEmail;
	private int reserveState;
	private String[] optNo;
	private String[] optQuantity;
	private int payNo;
	private int payPrice;
	private int pointUse;
	private int payCoupon;
	private int pointAdd;
	private String payDate;
	private int payCouponCode;
	private int payState;
}
