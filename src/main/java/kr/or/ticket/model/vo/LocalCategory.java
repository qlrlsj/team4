package kr.or.ticket.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class LocalCategory {
	private int localId;
	private String localName;
	private int parentLocalId;
	private String localFilepath;
}
