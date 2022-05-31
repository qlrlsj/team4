package kr.or.question.model.vo;

import kr.or.member.model.vo.Member;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Question {
	private int questionNo;
	private String memberId;
	private String questionTitle;
	private String questionContent;
	private String questionDate;
}
