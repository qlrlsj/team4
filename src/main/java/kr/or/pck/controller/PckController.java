package kr.or.pck.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import kr.or.pck.model.service.PckService;
import kr.or.pck.model.vo.FileVO;
import kr.or.pck.model.vo.Pck;

@Controller
public class PckController {
	@Autowired
	private PckService service;
	
	@RequestMapping(value="/packageMain.kt")
	public String packageMain() {
		return "pck/packageMain";
	}
	@RequestMapping(value="/insertPackagePage.kt")
	public String insertPackagePage(Pck pck) {
		return "pck/insertPackagePage";
	}
	
	@RequestMapping(value="/insertPackage.kt")
	public String insertPackage(Pck p, MultipartFile[] upfile) { //파일에 대한건 MultipartFile[]로 , 나머지는 Pck 로 들어온다
		System.out.println(p);
		System.out.println(upfile.length);
		return "redirect:/packageList.do";
	}
}
