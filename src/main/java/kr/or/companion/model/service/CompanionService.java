package kr.or.companion.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.companion.model.dao.CompanionDao;

@Service
public class CompanionService {
	@Autowired
	CompanionDao dao;
	
}
