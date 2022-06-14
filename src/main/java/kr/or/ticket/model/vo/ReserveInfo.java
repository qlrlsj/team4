package kr.or.ticket.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ReserveInfo {
	private int ticketNo;
	private String ticketTitle;
	private String ticketFilepath1;
	private String reserveNo;
	private ArrayList<OptionInfo> optionInfo;
}
