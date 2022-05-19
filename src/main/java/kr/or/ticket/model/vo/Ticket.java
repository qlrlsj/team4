package kr.or.ticket.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Ticket {
	private int ticketNo;
	private int localId;
	private int categoryId;
	private int memberNo;
	private String expireDate;
	private String ticketTitle;
	private String ticketContent;
	private String importantContent;
	private String businessTime;
	private String businessAddr;
	private int requiredTime;
	private String placeFilepath;
	private String ticketFilepath1;
	private String ticketFilepath2;
	private String ticketFilepath3;
	private String ticketFilepath4;
	private int likeCount; 
	private int ticketScore; 
	
	
}
