package kr.or.comment.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.or.comment.model.service.CommentService;


@Controller
public class CommentController {
	@Autowired
	private CommentService service;
	
	
}
