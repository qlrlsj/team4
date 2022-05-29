package kr.or.question.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.question.model.dao.QuestionDao;
import kr.or.question.model.vo.Question;
import kr.or.question.model.vo.QuestionPageDate;

@Service
public class QuestionService {
	@Autowired
	private QuestionDao dao;

	public QuestionPageDate selectQuestionList(int reqPage) {
		//페이징처리를 위해서 한 페이지당 보여줄 게시물 수 : 10
		int numPerPage = 10;
		// reqPage 1 -> 1~10 조회 // reqPage 2 -> 11~20 조회
		//해당페이지 요청 마지막 게시물 번호 'end' 구함
		int end = reqPage * numPerPage; // 1page*10 = 10 // 2page*10 = 20 -> end계산 완료
		//해당페이지 첫번째 게시물 번호
		int start = end - numPerPage + 1;
		
		//계산한 start, end를 이용해서 게시물 목록 조회
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		ArrayList<Question> list = dao.selectQuestionList(map);
		
		
		return null;
	}
	
	
}
