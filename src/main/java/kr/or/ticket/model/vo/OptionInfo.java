package kr.or.ticket.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class OptionInfo {
	private String reserveNo;
	private int optNo;
	private int optQuantity;
	private String optTitle;
	private int optPrice;
}
