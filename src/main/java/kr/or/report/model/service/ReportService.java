package kr.or.report.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.report.model.dao.ReportDao;

@Service
public class ReportService {
	@Autowired
	ReportDao dao;
}
