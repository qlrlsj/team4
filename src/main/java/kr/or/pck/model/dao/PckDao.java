package kr.or.pck.model.dao;
import java.util.List;
import java.util.ArrayList;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import kr.or.member.model.vo.Member;
import kr.or.pck.model.vo.FileVO;
import kr.or.pck.model.vo.Pck;
import kr.or.pck.model.vo.PckReserve;

@Repository
public class PckDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int insertPackage(Pck p) {
		int result = sqlSession.insert("package.insertPackage",p);
		return result;
	}

	public int selectPackageNo() {
		int packageNo = sqlSession.selectOne("package.selectPackageNo");
		return packageNo;
	}

	public int insertFile(FileVO file) {
		int result = sqlSession.insert("package.insertFile",file);
		return result;
	}

	public ArrayList<Pck> selectAllPackage() {
		List list = sqlSession.selectList("package.selectAllPackage");
		return (ArrayList<Pck>)list;
	}

	public Pck selectOnePackage(int packageNo) {
//		System.out.println("mapper가기 전 dao에 들어온 패키지글번호 : "+packageNo);
		Pck list = sqlSession.selectOne("package.selectOnePackage",packageNo);
//		System.out.println("mapper후 dao에 들어온 하나의 리스트 : "+list);
		return list;
	}

	public ArrayList<FileVO> selectFileList(int packageNo) {
		List<FileVO> fileList = sqlSession.selectList("package.selectFileList",packageNo);
		System.out.println("mapper다녀온 후 검색된  filelist : "+fileList);
		return (ArrayList<FileVO>)fileList;
	}

	public int insertPackageReserve(PckReserve pckReserve) {
		System.out.println("맵퍼 가기전에 dao에서 보낼 pckReserve 값 : "+pckReserve);
		int result = sqlSession.insert("package.insertPackageReserve",pckReserve);
		if(result == 1) {
			int result2 = sqlSession.insert("package.insertPayment",pckReserve);
			if(result2 == 1) {
				System.out.println("패키지결제 테이블, 예약테이블 모두 insert 완료");
			}else {
				System.out.println("패키지결제 테이블 insert 성공 , 패키지 예약 테이블 insert 실패!!");
			}
		}else {
			System.out.println("패키지 결제 테이블 insert 실패");
		}
		return result;
	}

	
}
