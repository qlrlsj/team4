package kr.or.hostel.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class HostelFile {
	private int fileNo;
	private int hostelCode;
	private String filename;
	private String filepath;
}
