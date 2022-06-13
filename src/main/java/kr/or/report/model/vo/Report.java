package kr.or.report.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Report {
	private int reporter;
	private String reporterId;
	private int reported;
	private String reportedId;
	private String reportContent;
}
