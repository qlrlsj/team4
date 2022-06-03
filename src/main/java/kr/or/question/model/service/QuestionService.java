package kr.or.question.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.or.comment.model.vo.Comment;
import kr.or.question.model.dao.QuestionDao;
import kr.or.question.model.vo.Question;
import kr.or.question.model.vo.QuestionPageDate;
import kr.or.question.model.vo.QuestionViewData;

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
		int totalCount = dao.selectQuestionCount(); // 총 게시글 수
		//구해온 전체 게시물 수를 통해 전체 페이지 수 계산
		int totalPage = 0; // 총 페이지
		if(totalCount % numPerPage == 0) { //총 게시글수 / 10 의 나머지가 0인경우
			totalPage = totalCount/numPerPage;
		}else { // 아닌경우
			totalPage = totalCount/numPerPage + 1; //한 페이지당 10개씩의 게시물을 출력하고 남은 게시물들을 출력할 페이지 1개 추가
		}
		//페이지네비 길이 변수 생성
		int pageNaviSize = 5;
		//페이지네비 시작번호 (선택한 페이지를 항상 가운데 놓게하기위해 -2를 하면 된다.(총 페이지 네비가 5로 정해놨기 때문에) 
		int pageNo = 1;
		if(reqPage>3) { //1페이지나 2페이지일때를 대비하기 위해서 
			pageNo = reqPage - 2;
		}
		//pageNavi 생성 시작
		String pageNavi = "";
		//이전버튼
		if(pageNo != 1) { // 1page일경우 이전버튼을 누를 필요가 없기때문
			pageNavi += "<a href='/questionList.kt?reqPage="+(reqPage-1)+"'><</a>"; //reqPage 부분은 pageNo로 바꿔도되고 본인이 시도해보면서 바꿔보면 좋다
		}
		
		
		
		
		//페이지 숫자 생성
		for(int i=0; i<pageNaviSize; i++) {
			if(pageNo == reqPage) {
				pageNavi += "<span>"+pageNo+"</span>";
			}else {
				pageNavi += "<a href='/questionList.kt?reqPage="+pageNo+"'>"+pageNo+"</a>";
			}
			pageNo++;
			if(pageNo > totalPage) {
				break; //출력을 하고 그 다음숫자를 1올려서 봤는데 총페이지보다 크다? 그럼 현재 페이지가 마지막 최종 페이지라는 소리이므로 break;
			}
		}
		//다음버튼
		if(pageNo<=totalPage) {
			pageNavi += "<a href='/questionList.kt?reqPage="+(reqPage+1)+"'>></a>";
		}
		QuestionPageDate qpd = new QuestionPageDate(list, pageNavi);
		return qpd;
	}

	public int insertQuestion(Question q) {
		System.out.println("컨트롤러에서 서비스로 들어온 q : "+q);
		return dao.insertMember(q); //dao에 컨트롤러에서 받은 m을 전달하고 결과값(1,0)을 돌려받는다.
	}

	public Question selectOneQuestion(int questionNo) {
		return dao.selectOneQuestion(questionNo);
	}

	public int deleteQuestion(int questionNo) {
		return dao.deleteQuestion(questionNo);
	}


	public int questionUpdate(Question q) {
		return dao.questionUpdate(q);
	}

	public QuestionViewData selectQuestionView(int questionNo) {
		//기존 게시물 정보 불러오기
		Question q = dao.selectOneQuestion(questionNo);
		//코멘트에 달려있는 댓글 조회
		Comment c = dao.selectNoticeComment(questionNo);
		QuestionViewData qvd = new QuestionViewData(q, c);
		System.out.println("service에서 합쳐진 qvd : "+qvd);
		return qvd;
	}

	
}
