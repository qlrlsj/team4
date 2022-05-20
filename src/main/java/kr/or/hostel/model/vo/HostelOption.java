package kr.or.hostel.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class HostelOption {
	private int optionNo;
	private int hostelCode;
	private String roomOption;
	private int hostelPrice;
	private int standardBooknum;
	private int maxBooknum;
	private int reservationStatus;	
	
	
}
