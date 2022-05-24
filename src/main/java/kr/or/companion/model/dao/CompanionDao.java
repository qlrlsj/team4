package kr.or.companion.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.companion.model.vo.Companion;

@Service
public class CompanionDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<Companion> selectCompanionList(HashMap<String, Object> map) {
		List list = sqlSession.selectList("companion.selectCompanionList",map);
		return (ArrayList<Companion>)list;
	}

	public int selectCompanionCount() {
		int totalCount = sqlSession.selectOne("companion.selectTotalCount");
		return totalCount;
	}

	public Companion selectOneCompanion(int companionNo) {
		Companion com = sqlSession.selectOne("companion.selectOneCompanion",companionNo);
		return com;
	}

	public int insertCompanion(Companion com) {
		return sqlSession.insert("companion.isnertCompanion", com);
	}

	public int companionProgress(int companionNo) {
		return sqlSession.update("companion.progressUpdate",companionNo);
	}

	public int companionDelete(int companionNo) {
		return sqlSession.delete("companion.companionDelete",companionNo);
	}

	public int updateCompanion(Companion com) {
		int result = sqlSession.update("companion.updateCompanion", com); 
		return result;
	}

	public ArrayList<Companion> selectNewCompanionList(HashMap<String, Object> map) {
		List list = sqlSession.selectList("companion.selectNewCompanionList",map);
		return (ArrayList<Companion>)list;
	}

	public int selectNewCompanionCount(Companion com) {
		int totalCount = sqlSession.selectOne("companion.selectNewTotalCount",com);
		return totalCount;
	}
}
