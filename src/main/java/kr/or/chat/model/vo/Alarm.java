package kr.or.chat.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Alarm {
	private int alarmNo;
	private int roomNo;
	private int receiverNo;
	private int senderNo;
	private String sendContent;
	private String sendDate;
}
