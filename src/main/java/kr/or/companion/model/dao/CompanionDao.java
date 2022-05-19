package kr.or.companion.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CompanionDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
}
