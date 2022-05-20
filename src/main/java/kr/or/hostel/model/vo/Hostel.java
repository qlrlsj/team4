package kr.or.hostel.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Hostel {
	private int hostelCode;
	private int memberNo;
	private String hostelName;
	private String HostelAddress;
	private Date bookStart;
	private Date bookEnd;
	private String CheckinOut;
	private String hostelIntro;
	private String hostelUsage;
	private int roolType;
	private int hostelScore;
	private String hostelComfort;
	private String hostelService;
	
	
	
	
}
