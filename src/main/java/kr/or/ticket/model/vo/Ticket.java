package kr.or.ticket.model.vo;

import java.util.ArrayList;

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
	private String startDate;
	private String expireDate;
	private String ticketTitle;
	private String ticketContent;
	private String importantContent;
	private String businessTime;
	private String businessAddr;
	private int requiredTime;
	private int likeCount; 
	private int ticketScore; 
	
	
}
