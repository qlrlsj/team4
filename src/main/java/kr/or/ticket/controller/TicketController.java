package kr.or.ticket.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

import kr.or.coupon.model.vo.Coupon;
import kr.or.payment.model.vo.Payment;
import kr.or.ticket.model.service.TicketService;
import kr.or.ticket.model.vo.CouponPoint;
import kr.or.ticket.model.vo.LocalCategory;
import kr.or.ticket.model.vo.OptionReserves;
import kr.or.ticket.model.vo.Reserve;
import kr.or.ticket.model.vo.Ticket;
import kr.or.ticket.model.vo.TicketCategory;
import kr.or.ticket.model.vo.TicketFile;
import kr.or.ticket.model.vo.TicketOption;
import kr.or.ticket.model.vo.TicketOptions;
import kr.or.ticket.model.vo.TicketReserve;

@Controller
public class TicketController {
	@Autowired
	private TicketService service;
	
	//파일을 중복검사 후 파일업로드, 파일경로를 ArrayList<String>으로 반환해주는 함수
	public ArrayList<String> upfile(HttpServletRequest request, MultipartFile[] files) {
		//파일 목록을 저장할 리스트를 생성
		ArrayList<String> fileList= new ArrayList<String>();
		//MultipartFile 배열을 첨부파일의 갯수만큼 길이가 생성(단, 첨부파일이 없어도 길이는 무조건1)
		//첨부파일이 없는 경우는 배열의 첫번째 파일이 비어있는지 체크하는 방식
		if(files[0].isEmpty()) {
			//첨부파일 없는경우 수행할 로직 없음
		}else {
			//첨부파일이 있는경우 파일업로드 작업 진행
			//1. 파일업로드 경로 설정 (HttpServletRequest객체를 이용해서 경로 구해옴)
			//request.getSession().getServletContext().getRealPath() -> /webapp/폴더경로
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/ticket/");
			//2. 반복문을 이용한 파일업로드 처리
			for(MultipartFile file : files) {
				//파일명이 기존 파일과 겹치는 경우 기존파일을 삭제하고 새파일만 남는 현상이 생김(덮어쓰기)
				//파일명 중복처리
				//사용자가 업로드한 파일 이름
				String filename = file.getOriginalFilename();
				//test.txt -> test.txt
				//test.txt -> test_1.txt
				//test.txt -> test_2.txt
				//업로드한 파일명이 test.txt인 경우 -> test 	.txt 두 부분으로 분리
				String onlyFilename = filename.substring(0,filename.lastIndexOf("."));	//test
				String extention = filename.substring(filename.lastIndexOf("."));		//.txt
				//실제 업로드할 파일명을 저장할 변수
				String filepath = null;
				//파일명 중복 시 뒤에 붙일 숫자 변수
				int count = 0;
				while(true) {
					if(count == 0) {
						//반복 첫번째 회차에는 원본파일명을 그대로 적용
						filepath = onlyFilename+extention;	//test.txt
					}else {
						filepath = onlyFilename+"_"+count+extention;
					}
					File checkFile = new File(savePath+filepath);
					if(!checkFile.exists()) {
						break;
					}
					count++;
				}
				//파일명 중복검사가 끝난 시점 -> 해당파일 업로드 작업
				try {
					//중복처리가 끝난 파일명(filepath)으로 파일을 업로드할 FileOutputStream객체 생성
					FileOutputStream fos = new FileOutputStream(new File(savePath+filepath));
					//업로드 속도증가를 위한 보조스트림 생성
					BufferedOutputStream bos = new BufferedOutputStream(fos);
					//파일업로드
					byte[] bytes = file.getBytes();
					bos.write(bytes);
					bos.close();
					
				} catch (FileNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				fileList.add(filepath);
			}
		}
		return fileList;
	}
		
	@RequestMapping(value="/ticketMain.kt")
	public String TicketMain() {
		return "ticket/ticketMain";
	}
	
	@RequestMapping(value="/insertTicketForm.kt")
	public String insertTicketForm(Model model) {
		ArrayList<TicketCategory> ticketCategory = service.selectTicketCategory();
		model.addAttribute("ticketCategory", ticketCategory);
		return "ticket/insertTicketForm";
	}
	
	@ResponseBody
	@RequestMapping(value="/selectAllTicketCategory.kt",produces = "application/json;charset=utf-8")
	public String selectAllTicketCategory() {
		Gson gson = new Gson();
		ArrayList<TicketCategory> ticketCategory = service.selectTicketCategory();
		return gson.toJson(ticketCategory);
	}
	@ResponseBody
	@RequestMapping(value="/selectAllLocal.kt",produces = "application/json;charset=utf-8")
	public String selectAllLocal() {
		Gson gson = new Gson();
		ArrayList<LocalCategory> local = service.selectLocalCategory();
		return gson.toJson(local);
	}
	
	//티겟등록
	@RequestMapping(value="/insertTicket.kt")
	public String insertTicket(Ticket ticket,MultipartFile[] file1, MultipartFile[] file2, TicketOptions options,HttpServletRequest request) {
//		System.out.println("memberNo : "+ticket.getMemberNo());
//		System.out.println("categoryId : "+ticket.getCategoryId());
//		System.out.println("localId : "+ticket.getLocalId());
//		System.out.println("businessAddr : "+ticket.getBusinessAddr());
//		System.out.println("ticketTitle : "+ticket.getTicketTitle());
//		System.out.println("importantContent : "+ticket.getImportantContent());
//		System.out.println("businessTime : "+ticket.getBusinessTime());
//		System.out.println("file1 : "+file1);
//		System.out.println("file2 : "+file2);
//		System.out.println(file1[0]);
//		System.out.println(file2[0]);
//		System.out.println("ticketContent : "+ticket.getTicketContent());
//		System.out.println("requiredTime : "+ticket.getRequiredTime());
		
		ArrayList<String> placeFilepath = upfile(request, file1);
		ArrayList<String> ticketFilepath = upfile(request, file2);
		TicketFile ticketFile = new TicketFile();
		ticketFile.setPlaceFilepath(placeFilepath.get(0));
		ticketFile.setTicketFilepath1(ticketFilepath.get(0));
		ticketFile.setTicketFilepath2(ticketFilepath.get(1));
		ticketFile.setTicketFilepath3(ticketFilepath.get(2));
		ticketFile.setTicketFilepath4(ticketFilepath.get(3));
		
		int result = service.insertTicket(ticket,options,ticketFile);
		
		
		return "ticket/ticketMain";
	}
	
	@RequestMapping(value="/ticketView.kt")
	public String selectTicket(int ticketNo,Model model) {
		Ticket ticket = service.selectTicket(ticketNo);
		ArrayList<TicketOption> optionList = service.selectTicketOption(ticketNo);
		TicketFile file = service.selectTicketFile(ticketNo);

		model.addAttribute("ticket", ticket);
		model.addAttribute("optionList", optionList);
		model.addAttribute("file", file);
		
		return "ticket/ticketView";
	}
	
	@ResponseBody
	@RequestMapping(value="/summerUploadTicketImage.kt", produces = "application/text;charset=utf-8")	
	public String summerUploadTicketImage(MultipartFile file[],HttpServletRequest request) {
		ArrayList<String> files = upfile(request, file);
		String filepath = "/resources/upload/ticket/"+files.get(0);
		System.out.println(filepath);
		return filepath;
	}

	@RequestMapping(value="/reserveForm.kt")
	public String reserveForm(int ticketNo, OptionReserves optionReserves, Model model) {
		return "ticket/reserveForm";
	}
	@ResponseBody
	@RequestMapping(value="/selectAllCouponPoint.kt",produces="application/json;charset=utf-8")
	public String selectAllCouponPoint(int memberNo,int totalPrice) {
		System.out.println(totalPrice);
		Gson gson = new Gson();
		CouponPoint cp = service.selectAllCouponPoint(memberNo,totalPrice);
		return gson.toJson(cp);
	}
	
	@PostMapping ("/reserveTicket.kt")
	public String reserveTicket(Reserve reserve) {
		System.out.println(reserve);
//		System.out.println("ticketNo"+ticketNo);
//		System.out.println("memberNo"+memberNo);
//		System.out.println("payPrice"+payPrice);
//		System.out.println("pointUse"+pointUse);
//		System.out.println("payCoupon"+payCoupon);
//		System.out.println("pointAdd"+pointAdd);
//		System.out.println("payCouponCode"+payCouponCode);
		return "ticket/ticketMain";
	}
	
	@RequestMapping(value="/insertTest.kt")
	public String insertTest() {
		return "ticket/test";
	}
	@RequestMapping(value="/ticketTest.kt")
	public String ticketTest(TicketOptions options) {
		int result = service.insertOptTest(options);
		return "ticket/test";
	}
	
	
	
}
