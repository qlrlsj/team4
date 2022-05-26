package kr.or.chat.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.chat.model.service.ChatService;
import kr.or.chat.model.vo.Chat;
import kr.or.chat.model.vo.ChatRoom;
import kr.or.companion.model.vo.CompanionPageData;

@Controller
public class ChatController {
	@Autowired
	ChatService service;
	
	@RequestMapping(value="/chatOpen.kt")
	public String chatOpen(ChatRoom chat, Model model) {
		ArrayList<Chat> cList = service.selectOneChatting(chat);
		System.out.println(cList);
		System.out.println(chat);
		model.addAttribute("chat",cList);
		model.addAttribute("room",chat);
		return "chat/chatMain";
	} 
}
