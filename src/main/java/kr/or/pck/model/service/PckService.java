package kr.or.pck.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.pck.model.dao.PckDao;

@Service
public class PckService {
	@Autowired
	private PckDao dao;
	
	
}
