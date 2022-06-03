package kr.or.ticket.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class TicketFile {
	private int ticketNo;
	private String placeFilepath;
	private String ticketFilepath1;
	private String ticketFilepath2;
	private String ticketFilepath3;
	private String ticketFilepath4;
}
