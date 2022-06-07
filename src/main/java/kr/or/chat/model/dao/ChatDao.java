package kr.or.chat.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.chat.model.vo.Alarm;
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

	public ChatRoom selectOneRoom(ChatRoom chat) {
		ChatRoom cr = sqlSession.selectOne("chat.selectOneRoom",chat);
		return cr;
	}

	public int insertChatRoom(ChatRoom chat) {
		return sqlSession.insert("chat.insertChatRoom",chat);
	}

	public int insertChat(Chat ch) {
		return sqlSession.insert("chat.inserChat", ch);
	}

	public ArrayList<ChatRoom> getChatList(int memberNo) {
		List list = sqlSession.selectList("chat.getChatList",memberNo);
		return (ArrayList<ChatRoom>) list;
	}

	public int getAlarmCount(int memberNo) {
		return sqlSession.selectOne("chat.getAlarmCount",memberNo);
	}

	public int insertAlarm(Alarm am) {
		return sqlSession.insert("chat.insertAlarm",am);
	}
}
