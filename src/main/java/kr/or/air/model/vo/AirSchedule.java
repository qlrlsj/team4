package kr.or.air.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class AirSchedule implements Comparable {
	private String airLine;			//항공사
	private String airNumber;		//편명
	private String airStartTime;	//출발시간
	private String airEndTime;		//도착시간
	private String airStart;		//출발지
	private String airArrive;		//도착지
	private String airDate;			//예약날짜 
	
	@Override
	public int compareTo(Object o) {
		AirSchedule as = (AirSchedule) o;
		String time = as.airStartTime;		
		return this.airStartTime.compareTo(time);		 
    }
}
