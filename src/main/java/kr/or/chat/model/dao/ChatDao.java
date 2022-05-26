package kr.or.chat.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.chat.model.vo.Chat;
import kr.or.chat.model.vo.ChatRoom;

@Repository
public class ChatDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<Chat> selectOneChatting(ChatRoom chat) {
		List list = sqlSession.selectList("chat.selectOneChatting", chat);
		return (ArrayList<Chat>) list;
	}
}
