package kr.or.seller.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class ReserveData {
	private int payNo;
	private String type;
	private String reserveDate;
	private int productNo;
	private String reserveNo;
	private String reserveName;
	private String memberId;
	private String memberPhone;
	private int sellerNo;
	private int optionNo;
	private String option1;
	private String option2;
	private String option3;
	private String option4;
	private int reservePrice;
}
