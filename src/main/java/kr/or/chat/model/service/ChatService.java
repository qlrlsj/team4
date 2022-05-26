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
}
