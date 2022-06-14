package kr.or.pck.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class PckReserve {
	private int reserveNo;
	private int packagePrsnl;
	private String packageStart;
	private int packageNo;
	private int payNo;
	private String memberId;
	private int reservePrice;
	private String packageTitle;
	private String packageContent;
	private String memberEmail;
	private String memberName;
	private String memberPhone;
}
