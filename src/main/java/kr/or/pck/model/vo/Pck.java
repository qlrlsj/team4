package kr.or.pck.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Pck {
	private int packageNo;
	private String memberId;
	private String packageTitle;
	private String packageContent;
	private String packageDate;
	private int likeCount;
	private int packagePrice;
	private int packageScore;
	private ArrayList<FileVO> fileList; //package에 필요한 정보 뿐만 아니라 파일목록까지 가지고 있을 수 있는 구조
	private String mainfile;
}
