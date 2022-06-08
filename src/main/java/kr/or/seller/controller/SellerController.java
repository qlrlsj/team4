package kr.or.seller.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.hostel.model.vo.Hostel;
import kr.or.member.model.vo.Member;
import kr.or.pck.model.vo.Pck;
import kr.or.seller.model.service.SellerService;
import kr.or.ticket.model.vo.Ticket;

@Controller
public class SellerController {
	@Autowired
	SellerService service;
	
	@RequestMapping (value="/sellerPage.kt")
	public String sellerMain() {		
		return "seller/sellerMain";
	}
	@RequestMapping(value="sellerProductOption.kt")
	public String sellerProductOptionFrm() {
		return "seller/sellerProductOption";
	}
	@RequestMapping(value="/sellerProduct.kt")
	public String sellerProduct(String type, Member m, Model model) {
//		if(type.equals("hostel")) {
//			ArrayList<Hostel> list = service.getSellerHostelList(type, m);
//		}else if(type.equals("ticket")) {
//			ArrayList<Ticket> list = service.getSellerTicketList(type, m);
//		}else if(type.equals("package")) {
//			ArrayList<Pck> list = service.getSellerPackageList(type, m);
//		}
		List list = service.getProductList(type,m); 
		model.addAttribute("type",type);
		return "seller/sellerProductPage";
	}
	@RequestMapping(value="/sellerCash.kt")
	public String sellerCash() {
		return "seller/sellerCashPage";
	}
	
	@RequestMapping(value="/sellerReivewManage.kt")
	public String sellerReviewManage() {
		return "seller/sellerReviewPage";
	}
	
	@RequestMapping(value="/sellerReserveManage.kt")
	public String sellerReserveManage() {
		return "seller/sellerReservePage";
	}
	
	@RequestMapping(value="/sellerAcount.kt")
	public String sellerAccount() {
		return "seller/sellerAccountPage";
	}
	
	@RequestMapping(value="/sellerQnA.kt")
	public String sellerQnA() {
		return "seller/sellerQnAPage";
	}
}
