package kr.or.ticket.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class MainTicket {
	private String parentCategoryName;
	private String localName;
	private String parentLocalName;
	private int ticketNo;
	private String ticketTitle;
	private int requiredTime;
	private int ticketScore; 
	private String optTitle;
	private int optPrice;
	private int optDiscountRate;
	private int optDiscountPrice;
	private String ticketFilepath1;
	private String localFilepath;
}
