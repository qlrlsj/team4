package kr.or.companion.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Companion {
	private int companionNo;
	private int memberNo;
	private String memberId;
	private String companionTitle;
	private String companionContent;
	private String companionField;
	private String trableDate;
	private String companionTheme;
	private String companionProgress;
	private String companionDate;
	private String companionImg;
}
