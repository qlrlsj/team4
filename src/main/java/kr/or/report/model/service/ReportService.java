package kr.or.report.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.member.model.vo.Member;
import kr.or.report.model.dao.ReportDao;
import kr.or.report.model.vo.Report;

@Service
public class ReportService {
	@Autowired
	ReportDao dao;

	public int insertReport(Report r) {
		return dao.insertReport(r);
	}

	public int insertBlack(Report r) {
		int delete = -1;
		int result = dao.insertBlack(r);
		if(result>0) {
			delete = dao.deleteReport(r);
		}
		return delete;
	}

	public Report blackCheck(Member member) {
//		Report r = dao.blackCheck(member);
		return null;
	}

	public ArrayList<Report> getBlackList() {
		return dao.getBlackList();
	}
}
