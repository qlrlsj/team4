package kr.or.ticket.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class TicketOptions {
	private int count;
	private int ticketNo;
	private ArrayList<String> optTitles;
	private ArrayList<String> optContents;
	private ArrayList<Integer> optPrices;
	private ArrayList<Integer> optDiscountRates;
	private ArrayList<Integer> optDiscountPrices;
	private ArrayList<Integer> optStocks;
}
