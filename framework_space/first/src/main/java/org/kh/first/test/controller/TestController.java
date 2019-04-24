package org.kh.first.test.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.kh.first.test.model.vo.Sample;
import org.kh.first.test.model.vo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TestController {
	
	@Autowired
	BCryptPasswordEncoder bcryptPasswordEncoder; //id이름
	
	//testAjaxPage.jsp 파일 내보내기
	@RequestMapping("moveAjax.do")
	public String moveAjaxPage() {
		return "test/testAjaxPage";
	}
	//testFileUpDown.jsp 파일 내보내기
	@RequestMapping("moveFile.do")
	public String moveFilePage() {
		return "test/testFileUpDown";
	}
	//testCrypto.jsp 파일 내보내기 : 패스워드 암호화처리
	@RequestMapping("testView.do")
	public String moveCryptoPage() {
		return "test/testCrypto";
	}
	
	//ajax test method ===================================================
	@RequestMapping(value="test1.do", method=RequestMethod.POST)
	public void test1Method(Sample sample, HttpServletResponse response) throws IOException {
		System.out.println("sample : " + sample);
		response.setContentType("test/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		if(sample.getName().equals("박혁거세")) {
			out.append("ok");
			out.flush();
		} else {
			out.append("fail");
			out.flush();
		}
		out.close();
	}
	
	@RequestMapping(value="test2.do", method=RequestMethod.POST)
	@ResponseBody //리턴하는 문자열을 response 객체에 담아 알아서 내보냄
	public String test2Method(HttpServletResponse response) throws IOException {
		response.setContentType("application/json; charset=utf-8");
		JSONObject job = new JSONObject();
		job.put("no", 20);
		job.put("writer", "poom44");
		job.put("title", URLEncoder.encode("허쉬 초코 크런치 우유에 말아 먹기", "utf-8"));
		job.put("content", URLEncoder.encode("허쉬 초코 크런치 달아", "utf-8"));
		
		return job.toJSONString();
	}
	
	@RequestMapping(value="test3.do", method=RequestMethod.POST)
	public void test3Method(HttpServletResponse respone) throws IOException {
		List<User> uList = new ArrayList<> ();
		uList.add(new User("u1", "1", "김", 20, "ef@rae.com", "000-0000-0000"));
		uList.add(new User("p2", "2", "이", 30, "es@rae.com", "111-0000-0000"));
		uList.add(new User("a3", "3", "박", 40, "hr@rae.com", "222-0000-0000"));
		uList.add(new User("g4", "4", "최", 50, "bs@rae.com", "333-0000-0000"));
		uList.add(new User("n5", "5", "안", 60, "su@rae.com", "444-0000-0000"));
		uList.add(new User("d6", "6", "정", 70, "rt@rae.com", "555-0000-0000"));
		
		JSONObject job = new JSONObject();
		JSONArray jar = new JSONArray();
		
		for(User u : uList) {
			JSONObject ob = new JSONObject();
			ob.put("userid", u.getUserid());
			ob.put("userpwd", u.getUserpwd());
			ob.put("username", URLEncoder.encode(u.getUsername(), "utf-8"));
			ob.put("age", u.getAge());
			ob.put("email", u.getEmail());
			ob.put("phone", u.getPhone());
			
			jar.add(ob);
		}
		job.put("list", jar);
		
		respone.setContentType("application/json; charset=utf-8");
		PrintWriter out = respone.getWriter();
		out.println(job.toJSONString());
		out.flush();
		out.close();
	}
	
	@RequestMapping(value="test4.do", method=RequestMethod.POST)
	public ModelAndView test4Method(ModelAndView mav) throws UnsupportedEncodingException {
		//map => model and view
		Sample samp = new Sample("안정은", 28);
		samp.setName(URLEncoder.encode(samp.getName(), "utf-8"));
		
		Map<String, Sample> map = new HashMap<> ();
		map.put("samp", samp);
		
		mav.addObject(map);
		mav.setViewName("jsonView");
		return mav; //뷰 리졸버로 전달되고 요청한 ajax는 json객체를 받음
	}
	
	@RequestMapping(value="test5.do", method=RequestMethod.POST)
	public ResponseEntity<String> test5Method(@RequestBody String param) throws ParseException {
		//request body에 저장되어서 전송된 json문자열을 param에 저장함
		// 전송온 json 문자열을 json 객체로
		JSONParser jarser = new JSONParser();
		JSONObject job = (JSONObject)jarser.parse(param);
		String name = (String)job.get("name");
		int age = ((Long)job.get("age")).intValue();
		System.out.println("name, age : " + name + ", " + age);
		
		return new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
	}
	
	@RequestMapping(value="test6.do", method=RequestMethod.POST)
	public ResponseEntity<String> test6Method(@RequestBody String param) throws ParseException {
		//request body에 저장되어서 전송된 json문자열을 param에 저장함
		// 전송온 json 문자열을 json 객체로
		JSONParser jarser = new JSONParser();
		JSONArray jar = (JSONArray)jarser.parse(param);
		System.out.println("jar size " + jar.size());
		
		for(int i = 0; i < jar.size(); i ++) {
			JSONObject job = (JSONObject)jar.get(i);
			Sample sp = new Sample();
			sp.setName(job.get("name").toString());
			sp.setAge(((Long)job.get("age")).intValue());
		}
		
		return new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
	}
	// -----------------------------------------------------------------------------------------
	// testFileUpDown.jsp Methods
	@RequestMapping(value="fileUp.do", method=RequestMethod.POST)
	public String testFileUpload
	(Sample sample, HttpServletRequest request, @RequestParam(name="upfile", required=false) MultipartFile mFile) throws IllegalStateException, IOException {
		System.out.println("sample : " + sample);
		System.out.println("file : " + mFile.getOriginalFilename());
		
		//파일 저장 폴더 지정
		String savePath = request.getSession().getServletContext().getRealPath("/resources/files/test");
		mFile.transferTo(new File(savePath + "\\" + mFile.getOriginalFilename()));
		
		return "home";
	}
	
	@RequestMapping("fdown.do")
	public ModelAndView fileDownMethod(HttpServletRequest request, @RequestParam("filename") String fileName) {
		String savePath = request.getSession().getServletContext().getRealPath("resources/files/test");
		File downFile = new File(savePath + "\\" + fileName);
		
		/*
			ModelAndView(java.lang.String viewName, java.lang.String modelName, java.lang.Object model)
			model == request 객체
			modelName == request 객체에 저장할 이름
			modelObject == request 객체에 저장할 객체
			request.setAttribute("저장할 이름", 저장할 객체)
		*/
		return new ModelAndView("filedown", "downFile", downFile);
	}
	
	@RequestMapping(value="bcrypto.do", method=RequestMethod.POST)
	public String testBcryptoPassword(@RequestParam(name="userpwd") String userpwd) {
		System.out.println("전송온 암호 : " + userpwd);
		String buserpwd = bcryptPasswordEncoder.encode(userpwd);
		System.out.println("buserpwd : " + buserpwd);
		System.out.println("글자 개수 : " + buserpwd.length());
		
		//로그인 시 전송온 암호와 crypto처리된 암호값 비교시에는 
		//matches() 메소드 사용함
		System.out.println("비교결과 : " + bcryptPasswordEncoder.matches(userpwd, buserpwd));
		return "home";
	}
}
