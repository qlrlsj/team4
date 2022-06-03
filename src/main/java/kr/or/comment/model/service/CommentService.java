package kr.or.comment.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.comment.model.dao.CommentDao;
import kr.or.comment.model.vo.Comment;

@Service
public class CommentService {
	@Autowired
	private CommentDao dao;

	public int insertComment(Comment c) {
		return dao.insertComment(c);
	}



}
