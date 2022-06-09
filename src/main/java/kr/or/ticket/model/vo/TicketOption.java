package kr.or.ticket.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class TicketOption {
	private int optNo;
	private int ticketNo;
	private String optTitle;
	private String optContent;
	private int optPrice;
	private int optDiscountRate;
	private int optDiscountPrice;
	private int optStock;
}
