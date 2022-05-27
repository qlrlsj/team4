package kr.or.hostel.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.hostel.model.dao.HostelDao;
import kr.or.hostel.model.vo.Hostel;
import kr.or.member.model.vo.Member;

@Service
@Transactional
public class HostelService {

	@Autowired
	private HostelDao dao;

	public int insertHostel(Hostel h, String[] roomOptions, String[] hostelPrices, String[] standardBooknums,
			String[] maxBooknums, String[] roomNames) {
		//1. 호스텔 기본정보 인서트 
			// db에 넣을때 dateType주의
		int Hostelresult = dao.insertHostel(h); 
		
		//2. 커밋전에 옵션 리스트 length만큼 insert
		
		//3. 각 옵션마다 예약가능일자 insert 
		
		return 0;
	}
	

}
