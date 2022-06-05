package kr.or.member.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class MemberPageData {
	private ArrayList<Member> list;
	private String pageNavi;
}
