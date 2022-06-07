package kr.or.pck.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class FileVO {
	private int fileNo;
	private int packageNo;
	private String filename;
	private String filepath;
}
