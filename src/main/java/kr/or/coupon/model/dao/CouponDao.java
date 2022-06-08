package kr.or.coupon.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CouponDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
}
