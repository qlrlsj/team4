package kr.or.hostel.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class ReservableRoom {
	private int reservableNo;
	private int optionNo;
	private Date reservableDate;
	
	
}
