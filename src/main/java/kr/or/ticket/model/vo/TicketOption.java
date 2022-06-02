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
	private ArrayList<String> optTitle;
	private ArrayList<String> optContent;
	private ArrayList<Integer> optPrice;
	private ArrayList<Integer> optDiscountRate;
	private ArrayList<Integer> optDiscountPrice;
	private ArrayList<Integer> optStock;
}
