package kr.or.comment.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.comment.model.vo.Comment;


@Repository
public class CommentDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int insertComment(Comment c) {
		int result = sqlSession.insert("comment.insertComment",c);
		return result;
	}


	
}
