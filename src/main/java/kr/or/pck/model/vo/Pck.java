package kr.or.pck.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Pck {
	private int packageNo;
	private int memberNo;
	private String packageTitle;
	private String packageContent;
	private String packageDate;
	private int likeCount;
	private int packagePrice;
	private int packageScore;
	private String memberId;
}
