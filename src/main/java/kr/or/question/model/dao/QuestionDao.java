package kr.or.question.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.comment.model.vo.Comment;
import kr.or.question.model.vo.Question;

@Repository
public class QuestionDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<Question> selectQuestionList(HashMap<String, Object> map) {
		List list = sqlSession.selectList("question.selectQuestionList", map);
		return (ArrayList<Question>)list;
	}

	public int selectQuestionCount() {
		int totalCount = sqlSession.selectOne("question.selectTotalCount");
		return totalCount;
	}

	public int insertMember(Question q) {
		int result = sqlSession.insert("question.insertQuestion",q); // 전달해줄것 m존재하니까 적어준다.
		return result;
	}

	public Question selectOneQuestion(int questionNo) {
		Question q = sqlSession.selectOne("question.selectOneQuestion",questionNo);
		return q;
	}

	public int deleteQuestion(int questionNo) {
		int result = sqlSession.delete("question.deleteQuestion",questionNo);
		return result;
	}


	public int questionUpdate(Question q) {
		System.out.println("service에서 dao로 들어온 question : "+q);
		int result = sqlSession.update("question.questionUpdate",q);
		if(result == 1) {
			System.out.println("게시글 변경 완료");
		}else {
			System.out.println("게시글 변경 실패");
		}
		return result;
	}

	public Comment selectNoticeComment(int questionNo) {
		Comment c = sqlSession.selectOne("comment.selectOneQuestion",questionNo);
		System.out.println("mapper다녀온 후 해당 게시글의 comment : "+c);
		return c;
	}


	//여기서부터 시작
	
}
