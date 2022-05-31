package kr.or.question.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
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
		List list = sqlSession.selectOne("question.selectOneQuestion",questionNo);
		System.out.println("mapper에 다녀온 후 list : " +list);
		return null;
	}
	
	//여기서부터 시작
	
}
