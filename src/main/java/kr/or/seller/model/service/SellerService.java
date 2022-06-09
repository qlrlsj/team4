package kr.or.seller.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.member.model.vo.Member;
import kr.or.seller.model.dao.SellerDao;

@Service
public class SellerService {
	@Autowired
	SellerDao dao;

	public List getProductList(String type, Member m) {
		return dao.getProductList(type,m);
	}
}
