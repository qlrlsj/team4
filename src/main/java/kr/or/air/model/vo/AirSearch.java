package kr.or.air.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class AirSearch {
	private String airStartDate;	//출발날짜
	private String airEndDate;		//귀환날짜
	private String airStart;		//출발지
	private String airArrive;		//도착지
	private int airAmount;			//인원
}
