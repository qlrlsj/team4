package kr.or.hostel.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.hostel.model.dao.HostelDao;
import kr.or.hostel.model.vo.Hostel;
import kr.or.hostel.model.vo.HostelFile;
import kr.or.hostel.model.vo.HostelOption;
import kr.or.member.model.vo.Member;

@Service
@Transactional
public class HostelService {

	@Autowired
	private HostelDao dao;

	public int insertHostel(Hostel h,ArrayList<HostelFile> fileList, String[] roomOptions, String[] hostelPrices, String[] standardBooknums,
			String[] maxBooknums, String[] roomNames) {

		//1. 호스텔 기본정보 인서트 (db에 넣을때 dateType주의
		int Hostelresult = dao.insertHostel(h);
		
		//2. 파일 인서트 
		int result = 0; //되돌려줄값 아래 처리에 따라 다르게 반영전 선언 
		if(Hostelresult>0) {
			//호텔기본정보 인서트 성공시 파일 등록 + 옵션등록
			System.out.println("호스텔 기본정보 인서트 성공");

			int hc = dao.selectHostelCode();
			for(HostelFile file : fileList) {
				file.setHostelCode(hc); 
				System.out.println("인서트 후 호스텔 코드 : "+hc);
//				file.setHostelCode(h.getHostelCode()); 
				result += dao.insertFile(file);
			}			
			//옵션 리스트 length만큼 insert
			for(int i=0; i<roomOptions.length; i++) {
				HostelOption ho = new HostelOption();
				ho.setHostelCode(hc);
				ho.setRoomName(roomNames[i]);
				ho.setRoomOption(roomOptions[i]);
				ho.setHostelPrice(Integer.parseInt(hostelPrices[i]));
				ho.setMaxBooknum(Integer.parseInt(maxBooknums[i]));
				ho.setStandardBooknum(Integer.parseInt(standardBooknums[i]));
				
				int optionResult = dao.insertOption(ho);
			}
				//. 각 옵션마다 예약가능일자 insert 
		}else {
			//인서트 실패시 
			System.out.println("호스텔 기본 인서트 실패 ");
			result = -1;
		}
		
				
		return result;
	}
	

}
