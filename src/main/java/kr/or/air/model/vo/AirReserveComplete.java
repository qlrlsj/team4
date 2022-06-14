package kr.or.air.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class AirReserveComplete {
	private int air_no;
	private String air_line;
	private	String air_name;
	private int air_level;
	private String air_date;
	private String air_start;
	private String air_end;
	private String reserve_no;
}
