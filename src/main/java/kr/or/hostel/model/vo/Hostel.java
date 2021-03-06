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
	private String hostelAddress;
	private String bookStart;
	private String bookEnd;
	private String checkinOut;
	private String hostelIntro;
	private String hostelUsage;
	private int roomType;
	private int hostelScore;
	private String hostelComfort;
	private String hostelService;
	private int hostelPrice;
	private String hostelfilepath;
	
	
	
	
}
