package kr.or.companion.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.companion.model.dao.CompanionDao;
import kr.or.companion.model.vo.Companion;
import kr.or.companion.model.vo.CompanionPageData;

@Service
public class CompanionService {
	@Autowired
	CompanionDao dao;

	public CompanionPageData selectAllCompanion(int reqPage) {
		//한 페이지당 보여줄 게시물 수 : 10
		int numPerPage = 10;
		int end = reqPage * numPerPage;
		int start = end-numPerPage + 1;
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start",start);
		map.put("end",end);
		ArrayList<Companion> list = dao.selectCompanionList(map);
		//전체 게시물 수
		int totalCount = dao.selectCompanionCount();
		//구해온 전체 게시물 수를 통해 전체 페이지 수 계산
		int totalPage = 0;
		if(totalCount%numPerPage==0) {
			totalPage = totalCount/numPerPage;
		}else {
			totalPage = totalCount/numPerPage + 1;
		}
		//페이지네비 길이
		int pageNaviSize = 9;
		int pageNo=1;
		//페이지네비 시작번호
		if(reqPage>5) {
			pageNo = reqPage - 4;			
		}
		//pageNavi 생성 시작
		String pageNavi = "";
		//이전버튼
		if(pageNo != 1) {
			pageNavi += "<a href='/companionMain.kt?reqPage="+(reqPage-1)+"'>[이전]</a>";
		}
		//페이지 숫자 생성
		for(int i=0;i<pageNaviSize;i++) {
			if(pageNo == reqPage) {
				pageNavi +="<span>"+pageNo+"</span>";
			}else {
				pageNavi += "<a href='/companionMain.kt?reqPage="+pageNo+"'>"+pageNo+"</a>";
			}
			pageNo++;
			if(pageNo>totalPage) {
				break;
			}
		}
		//다음버튼
		if(pageNo<=totalPage) {
			pageNavi += "<a href='/companionMain.kt?reqPage="+(reqPage+1)+"'>[다음]</a>";
		}
		CompanionPageData cpd = new CompanionPageData(list, pageNavi);
		return cpd;
	}

	public Companion selectOneCompanion(int companionNo) {
		return dao.selectOneCompanion(companionNo);
	}

	public int insertCompanion(Companion com) {
		return dao.insertCompanion(com);	
	}

	public int companionProgress(int companionNo) {
		return dao.companionProgress(companionNo);
	}

	public int companionDelete(int companionNo) {
		return dao.companionDelete(companionNo);
	}

	public int updateCompanion(Companion com) {
		return dao.updateCompanion(com);
	}

	public CompanionPageData selectNewCompanion(int reqPage, Companion com) {
		//한 페이지당 보여줄 게시물 수 : 10
		int numPerPage = 10;
		int end = reqPage * numPerPage;
		int start = end-numPerPage + 1;
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start",start);
		map.put("end",end);
		map.put("companionField",com.getCompanionField());
		map.put("companionProgress",com.getCompanionProgress());
		map.put("companionTheme",com.getCompanionTheme());
		map.put("travleStart",com.getTravleStart());
		ArrayList<Companion> list = dao.selectNewCompanionList(map);	
		//전체 게시물 수
		int totalCount = dao.selectNewCompanionCount(com);
		//구해온 전체 게시물 수를 통해 전체 페이지 수 계산
		int totalPage = 0;
		if(totalCount%numPerPage==0) {
			totalPage = totalCount/numPerPage;
		}else {
			totalPage = totalCount/numPerPage + 1;
		}
		//페이지네비 길이
		int pageNaviSize = 9;
		int pageNo=1;
		//페이지네비 시작번호
		if(reqPage>5) {
			pageNo = reqPage - 4;			
		}
		//pageNavi 생성 시작
		String pageNavi = "";
		//이전버튼
		if(pageNo != 1) {
			pageNavi += "<a href='/companionSearch.kt?reqPage="+(reqPage-1)+"&com="+com+"'>[이전]</a>";
		}
		//페이지 숫자 생성
		for(int i=0;i<pageNaviSize;i++) {
			if(pageNo == reqPage) {
				pageNavi +="<span>"+pageNo+"</span>";
			}else {
				pageNavi += "<a href='/companionSearch.kt?reqPage="+pageNo+"&com="+com+"'>"+pageNo+"</a>";
			}
			pageNo++;
			if(pageNo>totalPage) {
				break;
			}
		}
		//다음버튼
		if(pageNo<=totalPage) {
			pageNavi += "<a href='/companionSearch.kt?reqPage="+(reqPage+1)+"&com="+com+"'>[다음]</a>";
		}
		CompanionPageData cpd = new CompanionPageData(list, pageNavi);
		return cpd;
	}


	
}
