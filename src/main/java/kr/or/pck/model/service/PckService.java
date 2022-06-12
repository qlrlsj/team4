package kr.or.pck.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.pck.model.dao.PckDao;
import kr.or.pck.model.vo.FileVO;
import kr.or.pck.model.vo.Pck;
import kr.or.pck.model.vo.PckReserve;

@Service
public class PckService {
	@Autowired
	private PckDao dao;

	public int insertPackage(Pck p, ArrayList<FileVO> fileList) {
		int result1 = dao.insertPackage(p);
		int result = 0; //최근 결과 처리해줄 result
		if(result1 > 0) { //만약에! 게시판 데이터 insert에 오류가 나지 않았을 경우에만 파일이 데이터에 insert되도록 하기 위한 조건
			int packageNo = dao.selectPackageNo(); //방금 insert한 package의 packageNo를 가져오기 위한 dao
			System.out.println("mapper다녀온후 서비스에서의 최근 패키지게시글 번호 : "+packageNo);
			for(FileVO file : fileList) { //파일이 여러개일것을 대비해서 for문 처리 -> 안에있는 dao.insertFile(file)도 파일의 숫자만큼 반복하게 될 것이다
				file.setPackageNo(packageNo);//위에서 구해온 package 데이터가 들어간 packageNo를 구해와서 file이라는 테이블의 packageNo에도 셋팅을 해준 것이다
				result += dao.insertFile(file); //result 에 누적해서 값을 더하도록 += 처리 : 파일이 정상적으로 insert되었는지 확인하는 방법 -> 배열길이와 result의 숫자가 같은지 확인하면 된다 
			}
		}else {
			result = -1; //package게시판에 데이터가 정상적으로 insert되지 않으면 result가 -1이 된다
		}
		return result;
	}

	public ArrayList<Pck> selectAllPackage() {
		return dao.selectAllPackage();
	}

	public Pck selectOnePackage(int packageNo) {
		Pck p = dao.selectOnePackage(packageNo);
		ArrayList<FileVO> fileList = dao.selectFileList(packageNo);
		System.out.println("dao에서 service로 가져온 fileList : "+fileList);
		p.setFileList(fileList); //vo Pck.java에 추가한 하나의 객체에다가 위에서 가져온 filelist내용을 적어준다
		return p;
	}

	public ArrayList<FileVO> selectFileList(int packageNo) {
		return dao.selectFileList(packageNo);
	}

	public int insertPackageReserve(PckReserve pckReserve) {
		return dao.insertPackageReserve(pckReserve);
	}
	
	
}
