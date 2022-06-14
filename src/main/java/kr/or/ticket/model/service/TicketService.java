package kr.or.ticket.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import kr.or.coupon.model.dao.CouponDao;
import kr.or.coupon.model.vo.Coupon;
import kr.or.payment.model.vo.Payment;
import kr.or.ticket.model.dao.TicketDao;
import kr.or.ticket.model.vo.CouponPoint;
import kr.or.ticket.model.vo.LocalCategory;
import kr.or.ticket.model.vo.MainTicket;
import kr.or.ticket.model.vo.OptionInfo;
import kr.or.ticket.model.vo.OptionReserve;
import kr.or.ticket.model.vo.OptionReserves;
import kr.or.ticket.model.vo.Reserve;
import kr.or.ticket.model.vo.ReserveInfo;
import kr.or.ticket.model.vo.Ticket;
import kr.or.ticket.model.vo.TicketCategory;
import kr.or.ticket.model.vo.TicketFile;
import kr.or.ticket.model.vo.TicketOption;
import kr.or.ticket.model.vo.TicketOptions;
import kr.or.ticket.model.vo.TicketReserve;

@Service
public class TicketService {
	@Autowired
	private TicketDao dao;
	@Autowired
	private CouponDao couponDao;

	public ArrayList<TicketCategory> selectTicketCategory() {
		return dao.selectTicketCategory();
	}

	public ArrayList<LocalCategory> selectLocalCategory() {
		return dao.selectLocalCategory();
	}

	public int insertTicket(Ticket ticket, TicketOptions options, TicketFile ticketFile) {
		int result = 0;
		//1.ticket테이블 삽입
		int result1 = dao.insertTicket(ticket);
		//2. option 삽입
		int result2 = 0;
		for(int i=0;i<options.getCount();i++) {
			TicketOption option = new TicketOption();
			option.setTicketNo(ticket.getTicketNo());
			option.setOptTitle(options.getOptTitles().get(i));
			option.setOptContent(options.getOptContents().get(i));
			option.setOptPrice(options.getOptPrices().get(i));
			option.setOptDiscountRate(options.getOptDiscountRates().get(i));
			option.setOptDiscountPrice(options.getOptDiscountPrices().get(i));
			option.setOptStock(options.getOptStocks().get(i));
			result2 = dao.insertTicketOption(option);
		}
		//3. file 삽입
		ticketFile.setTicketNo(ticket.getTicketNo());
		int result3 = dao.insertTicketFile(ticketFile);
		
		result = result1 + result2 + result3;

		return result;
	}

	public int insertOptTest(TicketOptions options) {
		int results = 0;
		for(int i=0;i<options.getCount();i++) {
			TicketOption option = new TicketOption();
			option.setTicketNo(1);
			option.setOptTitle(options.getOptTitles().get(i));
			option.setOptContent(options.getOptContents().get(i));
			option.setOptPrice(options.getOptPrices().get(i));
			option.setOptDiscountRate(options.getOptDiscountRates().get(i));
			option.setOptDiscountPrice(options.getOptDiscountPrices().get(i));
			option.setOptStock(options.getOptStocks().get(i));
			System.out.println("service부분 : ");
			System.out.println(option);
			int result = dao.insertTicketOption(option);
			if(result>0) {
				results++;
			}
		}
		return results;
	}

	public Ticket selectTicket(int ticketNo) {
		return dao.selectTicket(ticketNo);
	}

	public ArrayList<TicketOption> selectTicketOption(int ticketNo) {
		return dao.selectTicketOption(ticketNo);
	}

	public TicketFile selectTicketFile(int ticketNo) {
		return dao.selectTicketFile(ticketNo);
	}

	public CouponPoint selectAllCouponPoint(int memberNo, int totalPrice) {
		Map map = new HashMap();
		map.put("memberNo",memberNo);
		map.put("totalPrice",totalPrice);
		ArrayList<Coupon> couponList = couponDao.selectAllCouponTicket(map);
		int point = dao.selectPoint(memberNo);
		CouponPoint cp = new CouponPoint();
		cp.setCouponList(couponList);
		cp.setPoint(point);
		return cp;
	}

	public int insertReserve(TicketReserve ticketR, OptionReserves optionRs, Payment payment) {
		//1. 결제 insert
		int result1 = dao.insertPayment(payment);
		System.out.println("payNo:"+payment.getPayNo());
		System.out.println("result1:"+result1);
		ticketR.setPayNo(payment.getPayNo()); //payNo값 넣어주기
		//2. 티켓reserve insert
		int result2 = dao.insertReserveTicket(ticketR);
		System.out.println("result2:"+result2);
		String reserveNo = dao.selectReserveNo(payment.getPayNo()); //결제번호로 예약번호 찾아오기
		ticketR.setReserveNo(reserveNo);	//예약번호값 넣어주기
		System.out.println("reserveNo : "+reserveNo);
		//3. 옵션reserve insert
		int result3 = 0;
		for(int i=0; i<optionRs.getOptNo().length;i++) {
			if(optionRs.getOptQuantity()[i]!=0) {
				OptionReserve or = new OptionReserve();
				or.setReserveNo(ticketR.getReserveNo());
				or.setOptNo(optionRs.getOptNo()[i]);
				or.setOptQuantity(optionRs.getOptQuantity()[i]);
				result3 = dao.insertReserveOption(or);
				System.out.println("result3-"+i+":"+result3);
			}
		}
		//4. 쿠폰 사용시 update
		int result4 =1;
		if(payment.getPayCouponCode()!=0) {//쿠폰코드가 0이 아니면 : 사용했을시
			Map map1 = new HashMap();
			map1.put("memberNo",ticketR.getMemberNo());
			map1.put("couponNo",payment.getPayCouponCode());
			result4 = dao.updateCouponuse(map1);
		}
		System.out.println("result4 : "+result4);
		//5. update point계산 - 회원일시
		int result5 =1;
		if(ticketR.getMemberNo()!=0) {
			int point = dao.selectPoint(ticketR.getMemberNo());
			int updatePoint = point - payment.getPointUse() + payment.getPointAdd();
			Map map2 = new HashMap();
			map2.put("memberNo",ticketR.getMemberNo());
			map2.put("updatePoint",updatePoint);
			result5 = dao.updateMemberPoint(map2);
		}
		System.out.println("result5 : "+result5);
		int result = result1 + result2 + result3 + result4;
		return result;
	}

	public ReserveInfo selectOneReserveInfo(int ticketNo, String reserveNo) {
		ReserveInfo ri = new ReserveInfo();
		ri = dao.selectTicketInfo(ticketNo);
		ArrayList<OptionInfo> optionInfo = dao.selectOptionInfo(reserveNo);
		ri.setReserveNo(optionInfo.get(0).getReserveNo());
		ri.setOptionInfo(optionInfo);
		return ri;
	}

	public ArrayList<MainTicket> selectAllTicketOrderRate() {
		//가져올 개수
		int readNo = 16;
		ArrayList<MainTicket> ticket= dao.selectAllTicketOrderRate(readNo);
		for(int i=0; i<ticket.size();i++) {
			int ticketNo = ticket.get(i).getTicketNo();
			String ticketFilepath1 = dao.selectOneFilepath1(ticketNo);
			ticket.get(i).setTicketFilepath1(ticketFilepath1);
		}
		return ticket;
	}
	
}
