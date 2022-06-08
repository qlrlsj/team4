package kr.or.seller.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.hostel.model.vo.Hostel;
import kr.or.member.model.vo.Member;
import kr.or.pck.model.vo.Pck;
import kr.or.ticket.model.vo.Ticket;

@Repository
public class SellerDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public List getProductList(String type, Member m) {
		if(type.equals("hostel")) {
			List list = sqlSession.selectList("product.selectSellerHostelList",m);
			return (ArrayList<Hostel>)list;
		}else if(type.equals("ticket")) {
			List list = sqlSession.selectList("product.selectSellerTicketList",m);
			return (ArrayList<Ticket>)list;
		}else if(type.equals("package")) {
			List list = sqlSession.selectList("product.selectSellerPackageList",m);
			return (ArrayList<Pck>)list;
		}else {
			return null;
		}
	}
}
