package kr.or.companion.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class CompanionPageData {
	private ArrayList<Companion> list;
	private String pageNavi;
}
