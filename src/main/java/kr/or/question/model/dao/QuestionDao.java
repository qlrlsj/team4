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
	
	//여기서부터 시작
	
}
