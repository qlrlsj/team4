package kr.or.hostel.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;


import kr.or.hostel.model.service.HostelService;
import kr.or.hostel.model.vo.Hostel;
import kr.or.hostel.model.vo.HostelFile;
import kr.or.member.model.vo.Member;

@Controller
public class HostelController {
	@Autowired
	private HostelService service;

	@RequestMapping(value = "/hostelMain.kt")
	public String hostelMain() {

		return "hostel/hostelMain";
	}

	@RequestMapping(value = "/insertHostelForm.kt")
	public String insertHostelForm() {

		return "hostel/insertHostelForm";
	}

	@RequestMapping(value = "/insertHostelForm1.kt")
	public String insertHostelForm1() {

		return "hostel/hostelInsert1";
	}

	@RequestMapping(value = "/insertHostel.kt")
	public String insertHostel(Hostel h, MultipartFile[] upfile, HttpServletRequest request, String[] roomOptions,
			String[] hostelPrices, String[] standardBooknums, String[] maxBooknums, String[] roomNames) {
//	System.out.println("호텔정보:"+h);
//	System.out.println("----------------옵션정보------------");
//	System.out.println("방이름:"+Arrays.toString(roomNames));
//	System.out.println("옵션상세정보:"+Arrays.toString(roomOptions));
//	System.out.println("가격:"+Arrays.toString(hostelPrices));
//	System.out.println("기준인원:"+Arrays.toString(standardBooknums));
//	System.out.println("최대인원:"+Arrays.toString(maxBooknums));

		// 파일처리

		// 파일 저장용 매개변수 멀티파트타입 name - vo생성시 선언변수name 타입 주의 ! 여기서 리스트 등을 사용하여 편집 후 세터로 별도
		// 처리 , vo로 바로 받기xxx
		// 1-2 파일목록을 저장할 리스트 생성
		ArrayList<HostelFile> fileList = new ArrayList<HostelFile>();

		// (upfile.length) =) multipartFile 배열- 첨부파일의 갯수만큼 길이생성( 단, 첨부파일이 없어도 기본 길이가 1)
		// 첨부파일이 없는지 확인하려면 배열의 첫번째가 비어있는지를 확인
		if (upfile[0].isEmpty()) { // 파일이 없을떄 -업로드 할필요 없음

		} else { // 첨부할 파일이 있을때
			// 1-1 파일업로드 경로 설정 (HTTPServletRequest 객체를 이용해 경로 구해오기 )
			// request.getSession().getServletContext().getRealPath -) /webapp/+
			// 폴더경로()-resources-upload-board
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/hostel/");
			// 2. 반복문 이용하여 파일 업로드처리
			for (MultipartFile file : upfile) {
				// 파일명이 기존 파일과 겹치는 경우 기본파일을 삭제하고 새파일만 남게됨
				// -) 파일명 중복시 넘버링처리
				// 사용자가 업로드한 파일 이름 가져오기
				String filename = file.getOriginalFilename(); // 예 ) test.txt
				// 중복넘버링 처리할때 확장자 안건들게 - test.txt 가 두개일 경우 test_1.txt로..
				// 업로드한 파일명이 test.txt이면 test / .txt 두부분으로 분리
				String onlyFilename = filename.substring(0, filename.lastIndexOf(".")); 
				// test 라스트 인덱스 - 첫번째 매개변수 [0번째] 부터 두번쨰 매개변수(.의 위치(가장마지막에서 찾아들어옴))의 바로 앞까지 잘라옴
				String extention = filename.substring(filename.lastIndexOf(".")); 
				// 확장자 가져오기 =) .txt 매개변수 한개 - 라스트 인덱스 - .의위치(가장마지막)부터 마지막까지 가져옴
				
				// 실제 업로드할 파일명을 저장할 변수
				String filepath = null;
				// 파일명 중복시 뒤에 붙일 숫자 변수
				int count = 0;
				while (true) {
					// 무한반복 - 중복없을때까지 반복 
					if (count == 0) {
						// 반복 첫번째 회차 - 원본파일명을 그대로 적용
						filepath = onlyFilename + extention; // test.txt
					} else {
						filepath = onlyFilename + "_" + count + extention;
						// 2회차 - 카운트가 1이된 상태에서 여기로 들어온다 -) test_1.txt
					}
					File checkFile = new File(savePath + filepath); // 경로 + test.txt
					if (!checkFile.exists()) {
						// 해당경로에 해당 파일이 존재하면 트루
						// 파일명이 존재하지 않을때 반복문종료
						break;
					} // 존재하면 카운트 하나 올려서 반복문 다시
					count++;
				} // 무한반복 종료
				
					// 파일명 중복검사가 끝난시점 -) 해당파일 업로드 작업
				try {
					// 중복처리가 끝난 파일명(filepath) 으로 파일을 업로드할 fileout스트림 생성 + 트라이캐치
					FileOutputStream fos = new FileOutputStream(new File(savePath + filepath));
					// 업로드 속도증가를 위한 보조스트림 생성
					BufferedOutputStream bos = new BufferedOutputStream(fos);
					// 파일 업로드
					byte[] bytes = file.getBytes();
					bos.write(bytes);
					bos.close();

				} catch (FileNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				// 서버에 파일업로드 작업 종료 (1개단위) - 이과정을 포문내에서 파일갯수만큼 반복 
				
				HostelFile fileVo = new HostelFile();
				fileVo.setFilename(filename);
				fileVo.setFilepath(filepath);
				fileList.add(fileVo);

			} // 포문 종료

		}//if else종료 
		System.out.println("파일업로드 : "+fileList);
		int result = service.insertHostel(h,fileList, roomOptions, hostelPrices, standardBooknums, maxBooknums, roomNames);
		if (result > 0) {
			System.out.println("Hostel 기본 테이블 인서트성공");
		} else {
			System.out.println("인서트 실패");
		}
		return "redirect:/insertHostelForm1.kt";
	}

}
