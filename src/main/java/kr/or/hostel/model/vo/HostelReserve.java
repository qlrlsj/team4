package kr.or.hostel.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class HostelReserve {
	private String reservationNo;
	private int optionNo;
	private int payNo;
	private int memberNo;
	private String reservationDate;
	private String reserveName;
	private String reserveEmail;
	private String reservePhone;
	private int reserveNum;
	private Date hostelIndate;
	private Date hostelOutdate;
	
	
}
