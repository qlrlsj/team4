package kr.or.chat.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Chat {
	private int chatNo;
	private int roomNo;
	private int memberNo;
	private String chatDate;
	private String chatContent;
	private String memberId;
}
