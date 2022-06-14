package kr.or.report.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.member.model.vo.Member;
import kr.or.report.model.vo.Report;

@Repository
public class ReportDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int insertReport(Report r) {
		return sqlSession.insert("report.insertReport",r);
	}

	public int insertBlack(Report r) {		
		return sqlSession.insert("report.insertBlack", r);
	}

	public int deleteReport(Report r) {
		return sqlSession.delete("report.deleteReport", r);
	}

	public Report blackCheck(Member m) {
		return sqlSession.selectOne("report,blackCheck",m);
	}
}
