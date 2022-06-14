package kr.or.ticket.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class TicketReserve {
	private String reserveNo;
	private int ticketNo;
	private int memberNo;
	private int payNo;
	private String reserveName;
	private String reservePhone;
	private String reserveEmail;
	private int reserveState;
}
