package kr.or.seller.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.member.model.vo.Member;
import kr.or.seller.model.dao.SellerDao;
import kr.or.seller.model.vo.Cancel;

@Service
public class SellerService {
	@Autowired
	SellerDao dao;

	public List getProductList(String type, Member m) {
		return dao.getProductList(type,m);
	}

	public int cancelInsert(int memberNo) {
		return dao.cancelInsert(memberNo);
	}

	public Cancel cancelCheck(int memberNo) {
		return dao.cancelCheck(memberNo);
	}

	public List getCashList(String type, Member m) {
		return dao.getCashList(type,m);
	}
}
