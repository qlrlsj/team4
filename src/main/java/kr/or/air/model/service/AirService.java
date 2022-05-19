package kr.or.air.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.air.model.dao.AirDao;

@Service
public class AirService {
	@Autowired
	private AirDao dao;
	
}
