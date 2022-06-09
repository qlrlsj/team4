package kr.or.hostel.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class ReservedRoom {
	private int reservedNo;
	private int optionNo;
	private int memberNo;
	private String reservationNo;
	private String reservedDate;
	
	
}
