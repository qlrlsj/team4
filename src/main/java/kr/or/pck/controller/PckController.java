package kr.or.pck.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import kr.or.pck.model.service.PckService;
import kr.or.pck.model.vo.FileVO;
import kr.or.pck.model.vo.Pck;

@Controller
public class PckController {
	@Autowired
	private PckService service;
	
	
//	@RequestMapping(value="/boardList.do")
//	public String boardList(Model model) { //2.service에서 돌려받은 list를 화면으로 보내줘야 하기 때문에 Model model 
//		ArrayList<Board> list = service.selectAllBoard(); //1.게시물목록 보기는 전체를 볼거기 때문에 ArrayList로 받는다
//		model.addAttribute("list",list); // 3.화면으로 list를 보내준다
//		return "/board/boardList";
//	}
	@RequestMapping(value="/packageMain.kt")
	public String selectAllPackage(Model model) {
		ArrayList<Pck> list = service.selectAllPackage();
		model.addAttribute("list", list);
		return "pck/selectAllPackage";
	}
	
	@RequestMapping(value="/packageView.kt")
	public String packageView(int packageNo, Model model) {
		Pck p = service.selectOnePackage(packageNo);
		ArrayList<FileVO> f = service.selectFileList(packageNo);
		model.addAttribute("p", p); //한개의 게시글 정보를 p에 저장
		model.addAttribute("f", f);
		return "pck/packageView";
	}
	
	@RequestMapping(value="/insertPackagePage.kt")
	public String insertPackagePage(Pck pck) {
		return "pck/insertPackagePage";
	}
	
	@RequestMapping(value="/insertPackage.kt")
	public String insertPackage(Pck p, MultipartFile[] upfile, MultipartFile mainfile3, HttpServletRequest request) { //파일에 대한건 MultipartFile[]로 , 나머지는 Pck 로 들어온다
//		System.out.println(p);
//		System.out.println(upfile.length);
//		System.out.println(upfile[0].getName());
//		System.out.println(upfile[0].getOriginalFilename());
		//파일 목록을 저장할 리스트를 생성
		ArrayList<FileVO> fileList = new ArrayList<FileVO>(); //upfile로 들어온 파일을 DB에 인서트하기 좋은 형태로 바꿔줄 것이다 ArrayList를 사용해서
		//MultipartFile 배열은 첨부파일의 갯수만큼 길이가 생성(단, 첨부파일이 없어도 길이는 무조건 1)
		//첨부파일이 없는경우는 배열의 첫번째 파일이 비어있는지 체크해야 한다.
		if(upfile[0].isEmpty()) {
			System.out.println("첨부파일이 없습니다."); //첨부파일이 없는경우 수행할 로직 없음
		}else {
			
			//첨부파일이 있는경우 파일업로드 작업 진행
			//1. 파일업로드 경로 설정(HttpServletRequest객체를 이용해서 경로 구해옴 -> 상단에 HttpServletRequest request 객체 받아오는것 만들어 넣는다.)
			//request.getSession().getServletContext() -> 여기까지가 /webapp/폴더경로 이다 그 뒤에 아래처럼 /resources~~ 경로 적어놓은것
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/package/");
			//2. 반복문을 이용한 파일업로드 처리
			for(MultipartFile file : upfile) {//upfile 배열에서 file로 꺼낸다
				//파일명이 기존 파일과 겹치는경우 기존파일을 삭제하고 새파일만 남는 현상이 생김(덮어쓰기)
				//파일명 중복인 경우 처리해주는 로직 제작
				//1. 사용자가 업로드한 파일 이름
				String filename = file.getOriginalFilename(); //오리지널 파일네임(파일명.확장자 까지)이 filename에 저장되게 한다
				//ex)test.txt 가 파일명이 겹칠경우 
				//test.txt -> test_1.txt
				//test.txt -> test_2.txt
				//업로드한 파일명이 test.txt인경우 -> test 와 .txt 두 부분으로 분리(분리하는 이유 : 확장자는 어떤 형식의 파일인지 구분할 수 있기 때문에 파일명과 확장자를 분리하는 것이다.)
				//filename의 첫번째(0) 부터 어디까지? (".")바로앞까지 잘라낸다(substring) 가 마지막이(lastIndexOf) 되어
				String onlyFilename = filename.substring(0,filename.lastIndexOf(".")); //ex)test.txt인경우 0인 t부터 .바로앞인 t까지 test가 onlyFIlename에 저장되게 된다
				String extention = filename.substring(filename.lastIndexOf(".")); //lastIndexOf에 매개변수를 하나만 주면 . 부터 끝까지인 .txt 가 extendtion에 저장되게 된다
				//위의 코드를 예로들면 filename = "test1234.txt" 인 경우
				//int index = filename.lastIndexOf("."); .이 마지막(lastIndexOf)인데 . 바로 앞까지를 말한다 -> 8
				//String onlyFilename = filename.substring(0,8); -> 0을포함해서 0부터 8을포함하지 않은 7까지 문자열을 짤라내게 된다
				//String extention = filename.substring(8);
				//실제 업로드할 파일명을 저장할 변수
				String filepath = null;
				//파일명 중복 시에 뒤에 붙일 숫자 변수
				int count = 0;
				while(true) {//중복이 안될때까지 숫자를 붙이기 위해 무한반복문
					if(count == 0) {//아직 검사를 한번도 하지 않은 상태
						//반복 첫번째 회차에는 원본파일명을 그대로 적용
						filepath = onlyFilename+extention;//test.txt로 파일명이 합쳐져서 filepath에 저장한다
					}else {//count가 0이 아니면
						filepath = onlyFilename+"_"+count+extention; //파일명이 test_1.txt 형식으로 만들어지기 위한 코드부분
					}
					File checkFile = new File(savePath+filepath);
					if(!checkFile.exists()) {//만약에 checkFile이 존재하면(exists) true가, 존재하지 않으면 false를 리턴한다 !이기 때문에 존재하지 않으면 break;
						break;//존재하지 않으면 break로 while문을 나가게 된다
					}
					count++;//존재하게 되면 count를 하나 올리고 반복문 상단 while(true)로 올려준다
				}
				//파일명 중복검사가 끝난 시점(break문으로 while문을 종료하고 나온 시점) -> 해당파일 업로드 작업 할 차례
				
				try {
					//1. 중복처리가 끝난 파일명(filepath)으로 파일을 업로드할 FileOutputStream객체 생성 -> try~catch생성
					FileOutputStream fos = new FileOutputStream(new File(savePath+filepath));
					//2. 업로드 속도증가를 위한 보조스트림 생성
					BufferedOutputStream bos = new BufferedOutputStream(fos);
					//3. 파일업로드
					byte[] bytes = file.getBytes(); //4. 바이트 배열 생성, for문에 들어있던 file을 byte배열로 변경
					bos.write(bytes);//5
					bos.close();//6
				} catch (FileNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				//서버 파일업로드 작업 끝(여기까지가 파일 갯수만큼 반복되는 로직이다 (파일 1개 단위))
				FileVO fileVo = new FileVO();
				fileVo.setFilename(filename);
				fileVo.setFilepath(filepath);
				fileList.add(fileVo);
			}//for문 종료
		}//else 종료
		
		//mainfile2 업로드,중복검사
		if(mainfile3.isEmpty()) {
			System.out.println("첨부파일이 없습니다."); //첨부파일이 없는경우 수행할 로직 없음
		}else {
			
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/package/");
				String filename = mainfile3.getOriginalFilename(); //오리지널 파일네임(파일명.확장자 까지)이 filename에 저장되게 한다
				String onlyFilename = filename.substring(0,filename.lastIndexOf(".")); //ex)test.txt인경우 0인 t부터 .바로앞인 t까지 test가 onlyFIlename에 저장되게 된다
				String extention = filename.substring(filename.lastIndexOf(".")); //lastIndexOf에 매개변수를 하나만 주면 . 부터 끝까지인 .txt 가 extendtion에 저장되게 된다
				String filepath = null;
				int count = 0;
				while(true) {//중복이 안될때까지 숫자를 붙이기 위해 무한반복문
					if(count == 0) {//아직 검사를 한번도 하지 않은 상태
						filepath = onlyFilename+extention;//test.txt로 파일명이 합쳐져서 filepath에 저장한다
					}else {//count가 0이 아니면
						filepath = onlyFilename+"_"+count+extention; //파일명이 test_1.txt 형식으로 만들어지기 위한 코드부분
					}
					File checkFile = new File(savePath+filepath);
					if(!checkFile.exists()) {//만약에 checkFile이 존재하면(exists) true가, 존재하지 않으면 false를 리턴한다 !이기 때문에 존재하지 않으면 break;
						break;//존재하지 않으면 break로 while문을 나가게 된다
					}
					count++;//존재하게 되면 count를 하나 올리고 반복문 상단 while(true)로 올려준다
				}
				
				try {
					FileOutputStream fos = new FileOutputStream(new File(savePath+filepath));
					BufferedOutputStream bos = new BufferedOutputStream(fos);
					byte[] bytes = mainfile3.getBytes(); //4. 바이트 배열 생성, for문에 들어있던 file을 byte배열로 변경
					bos.write(bytes);//5
					bos.close();//6
				} catch (FileNotFoundException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
				p.setMainfile(filepath);
		}//else 종료
		
		
		
		System.out.println(fileList);
		int result = service.insertPackage(p, fileList);
		//성공실패 결과비교, 성공인 경우 : fileList.size() == result 인경우 insert 성공
		
		return "pck/insertPackagePage";
	}
}
