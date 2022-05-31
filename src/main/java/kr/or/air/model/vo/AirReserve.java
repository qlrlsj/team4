package kr.or.air.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class AirReserve{
	private String airLineST;			//항공사
	private String airNumberST;		//편명
	private String airStartTimeST;	//출발시간
	private String airEndTimeST;		//도착시간
	private String airStartST;		//출발지
	private String airArriveST;		//도착지
	private String airPayST;			//출발금액
	private String airDateST;			//예약날짜 
	private String airLineED;			//항공사
	private String airNumberED;		//편명
	private String airStartTimeED;	//출발시간
	private String airEndTimeED;		//도착시간
	private String airStartED;		//출발지
	private String airArriveED;		//도착지
	private String airDateED;			//예약날짜 
	private String airPayED;			//귀환금액
}
