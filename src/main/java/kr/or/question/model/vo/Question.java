package kr.or.question.model.vo;

import kr.or.member.model.vo.Member;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Question {
	private int question_no;
	private int member_no;
	private String question_title;
	private String question_content;
	private String question_date;
}
