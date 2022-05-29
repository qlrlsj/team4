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
		//pageNavi작성 시작
		//전체 페이지 수 계산이 필요 -> 전체 게시물의 수를 db에서 조회해와야 계산이 가능하다.
		//전체 게시물 수를 구해와야 한다(아래)
		int totalCount = dao.selectQuestionCount();
		//구해온 전체 게시물 수를 통해 전체 페이지 수 계산
		int totalPage = 0;
		if(totalCount % numPerPage == 0) {
			totalPage = totalCount/numPerPage;
		}else {
			totalPage = totalCount/numPerPage + 1; //한 페이지당 10개씩의 게시물을 출력하고 남은 게시물들을 출력할 페이지 1개 추가
		}
		//페이지네비 길이 변수 생성
		int pageNaviSize = 5;
		//페이지네비 시작번호 (선택한 페이지를 항상 가운데 놓게하기위해 -2를 하면 된다.(총 페이지 네비가 5로 정해놨기 때문에) 
		int pageNo = 1;
		if(reqPage>3) { //1페이지나 2페이지일때를 대비하기 위해서 
			pageNo = reqPage - 2;
		}
		return null;
	}
	
	
	
}
