package kr.or.comment.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class CommentDao {
	@Autowired
	private SqlSessionTemplate sqlSession;


	
}
