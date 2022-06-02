package kr.or.comment.model.vo;

import kr.or.member.model.vo.Member;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Comment {
	private int qcNo;
	private int questionNo;
	private String qcComment;
	private String qcDate;
}
