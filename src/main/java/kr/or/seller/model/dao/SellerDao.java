package kr.or.seller.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.hostel.model.vo.Hostel;
import kr.or.member.model.vo.Member;
import kr.or.pck.model.vo.Pck;
import kr.or.seller.model.vo.Cancel;
import kr.or.seller.model.vo.Payment;
import kr.or.ticket.model.vo.Ticket;

@Repository
public class SellerDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public List getProductList(String type, Member m) {
		if(type.equals("hostel")) {
			List list = sqlSession.selectList("seller.selectSellerH",m);
			return (ArrayList<Hostel>)list;
		}else if(type.equals("ticket")) {
			List list = sqlSession.selectList("seller.selectSellerT",m);
			return (ArrayList<Ticket>)list;
		}else if(type.equals("package")) {
			List list = sqlSession.selectList("seller.selectSellerP",m);
			return (ArrayList<Pck>)list;
		}else {
			return null;
		}
	}

	public int cancelInsert(int memberNo) {
		int result = sqlSession.insert("seller.cancelInsert",memberNo);
		return result;
	}

	public Cancel cancelCheck(int memberNo) {
		Cancel c = sqlSession.selectOne("seller.cancelCheck",memberNo);
		return c;
	}

	public List getCashList(String type, Member m) {
		List list = new ArrayList<Payment>();
		if(type.equals("hostel")) {
			list = sqlSession.selectList("seller.selectCashInfoH",m);
		}else if(type.equals("ticket")) {
			list = sqlSession.selectList("seller.selectCashInfoT",m);
		}else if(type.equals("package")) {
			list = sqlSession.selectList("seller.selectCashInfoP",m);
		}
		return (ArrayList<Payment>) list;
	}
}
