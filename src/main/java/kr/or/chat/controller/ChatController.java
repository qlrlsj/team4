package kr.or.chat.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.chat.model.service.ChatService;
import kr.or.chat.model.vo.Chat;
import kr.or.chat.model.vo.ChatRoom;
import kr.or.companion.model.vo.CompanionPageData;

@Controller
public class ChatController {
	@Autowired
	ChatService service;
	
	@RequestMapping(value="/chatOpen.kt")
	public String chatOpen(ChatRoom chat, String memberId, Model model) {
		ChatRoom cr = service.selectOneRoom(chat);
		if(cr==null) {
			int result = service.insertChatRoom(chat);
			if(result>0) {
				cr = service.selectOneRoom(chat);
			}
			if(cr!=null) {
				ArrayList<Chat> cList = service.selectOneChatting(cr);	
				model.addAttribute("chat",cList);
				model.addAttribute("room",cr);		
				model.addAttribute("memberId",memberId);
			}
		}else {
			ArrayList<Chat> cList = service.selectOneChatting(cr);	
			model.addAttribute("chat",cList);
			model.addAttribute("room",cr);
			model.addAttribute("memberId",memberId);
		}
		return "chat/chatMain";
	}
	@ResponseBody
	@RequestMapping(value="/insertChat.kt", produces = "application/json;charset=utf-8")
	public String chatInsert(Chat ch) {
		int result = service.insertChat(ch);
		if(result>0) {
			return "success";
		}else {
			return "dd";			
		}
	}
	
	@RequestMapping(value="chatList.kt")
	public String chatList(int memberNo, Model model) {
		ArrayList<ChatRoom> cr = service.getChatList(memberNo);
		model.addAttribute("room",cr);
		return "chat/chatList";
	}
	
	@RequestMapping(value="chatOpenList.kt")
	public String chatOpenList(ChatRoom cr, String memberId, Model model) {
		ArrayList<Chat> cList = service.selectOneChatting(cr);	
		model.addAttribute("chat",cList);
		model.addAttribute("room",cr);
		model.addAttribute("memberId",memberId);
		return "chat/chatMain";
	}
	@ResponseBody
	@RequestMapping(value="/alarmCount.kt")
	public int alarmCount(int memberNo) {
		int result = service.alarmCount(memberNo);
		return result;
	}
}
