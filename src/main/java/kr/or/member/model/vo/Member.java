package kr.or.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Member {
	private int memberNo;
	private String memberId;
	private String memberPw;
	private String memberName;
	private int memberLevel;
	private int memberGrade;
	private String memberPhone;
	private String memberEmail;
	private String enrollDate;
	private int memberPoint;
	private String memberIntro;
}
