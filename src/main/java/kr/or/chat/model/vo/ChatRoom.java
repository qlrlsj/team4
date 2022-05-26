package kr.or.chat.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class ChatRoom {
	private int roomNo;
	private int memberNo1;
	private int memberNo2;
	private String roomName;
	private String roomDate;
}
