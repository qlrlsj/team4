package kr.or.air.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.air.model.vo.Air;

@Repository
public class AirDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<Air> selectAllAir() {
		List list = sqlSession.selectList("air.selectAllAir");
		return (ArrayList<Air>)list;
	}
}
