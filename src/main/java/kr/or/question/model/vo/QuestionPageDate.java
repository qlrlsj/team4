package kr.or.question.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class QuestionPageDate {
	private ArrayList<Question> list;
	private String pageNavi;
}
