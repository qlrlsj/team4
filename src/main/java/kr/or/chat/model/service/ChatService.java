package kr.or.chat.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.chat.model.dao.ChatDao;
import kr.or.chat.model.vo.Chat;
import kr.or.chat.model.vo.ChatRoom;
import kr.or.companion.model.vo.CompanionPageData;

@Service
public class ChatService {
	@Autowired
	ChatDao dao;

	public ArrayList<Chat> selectOneChatting(ChatRoom chat) {
		return dao.selectOneChatting(chat);
	}

	public ChatRoom selectOneRoom(ChatRoom chat) {
		return dao.selectOneRoom(chat);
	}

	public int insertChatRoom(ChatRoom chat) {
		return dao.insertChatRoom(chat);
	}

	public int insertChat(Chat ch) {		
		return dao.insertChat(ch);
	}

	public ArrayList<ChatRoom> getChatList(int memberNo) {
		return dao.getChatList(memberNo);
	}
}
