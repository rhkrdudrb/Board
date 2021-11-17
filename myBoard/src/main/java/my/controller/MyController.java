package my.controller;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.annotation.Resource;
import javax.enterprise.inject.Model;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import my.service.MyService;
import my.vo.Criteria;
import my.vo.MyVo;
import my.vo.PageMaker;

@Controller
public class MyController {
    @Autowired
	private MyService MyService;
    @Autowired
	private Gson gson;
//	@Resource(name = "MyService")
//	private MyService MyService;
    
	ModelAndView mav = new ModelAndView();
	
	@RequestMapping(value="/login")
	public ModelAndView login(@RequestParam("id")String id, @RequestParam("pw")String pw,HttpServletRequest req,HttpServletResponse res,ModelAndView mav,@ModelAttribute MyVo vo,Criteria cri) throws Exception {
		HttpSession session = req.getSession();
		MyVo login = MyService.login(vo);
		
		
		if(login == null) {
			res.setCharacterEncoding("UTF-8");
			res.setContentType("text/html; charset=UTF-8");
			PrintWriter out = res.getWriter();
			out.println("<script>alert('아이디혹은 비밀번호가 다릅니다.');</script>");
			out.flush();
			mav.setViewName("login");
		}else {
			session.setAttribute("id", id);
			session.setAttribute("pw", pw);
			session.setAttribute("sq", login.getSq());
			String jsonData = gson.toJson(MyService.getList(cri));
			mav.addObject("list", jsonData);
			
			
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(MyService.getListCnt());
			mav.addObject("pageMaker", pageMaker);
	
			mav.setViewName("paymentBox");
			
		}
		return mav;
	}	
	
	@RequestMapping(value="/end")
	public ModelAndView end(HttpServletRequest req,HttpServletResponse res,ModelAndView mav,@ModelAttribute MyVo vo,Criteria cri) throws Exception {
//		HttpSession session = req.getSession();
//
//		if(session.getAttribute("id") == null) {
//			res.setCharacterEncoding("UTF-8");
//			res.setContentType("text/html; charset=UTF-8");
//			PrintWriter out = res.getWriter();
//			out.println("<script>alert('로그인정보를 확인하세요.');</script>");
//			out.flush();
//			mav.setViewName("index");
//		}else {
//			
//		}
		String jsonData = gson.toJson(MyService.getList(cri));
		mav.addObject("list", jsonData);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(MyService.getListCnt());
		mav.addObject("pageMaker", pageMaker);
		
		mav.setViewName("end");	
		return mav;
	}
	@RequestMapping(value="/draftLetter")
	public ModelAndView draftLetter(HttpServletRequest req,HttpServletResponse res,ModelAndView mav,@ModelAttribute MyVo vo,Criteria cri) throws Exception {
//		HttpSession session = req.getSession();
//
//		if(session.getAttribute("id") == null) {
//			res.setCharacterEncoding("UTF-8");
//			res.setContentType("text/html; charset=UTF-8");
//			PrintWriter out = res.getWriter();
//			out.println("<script>alert('로그인정보를 확인하세요.');</script>");
//			out.flush();
//			mav.setViewName("index");
//		}else {
//			
//		}
		String jsonData = gson.toJson(MyService.getList(cri));
		mav.addObject("list", jsonData);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(MyService.getListCnt());
		mav.addObject("pageMaker", pageMaker);
		
		mav.setViewName("draftLetter");	
		return mav;
	}
	@RequestMapping(value="/draftLetterBox")
	public ModelAndView draftLetterBox(HttpServletRequest req,HttpServletResponse res,ModelAndView mav,@ModelAttribute MyVo vo,Criteria cri) throws Exception {
//		HttpSession session = req.getSession();
//
//		if(session.getAttribute("id") == null) {
//			res.setCharacterEncoding("UTF-8");
//			res.setContentType("text/html; charset=UTF-8");
//			PrintWriter out = res.getWriter();
//			out.println("<script>alert('로그인정보를 확인하세요.');</script>");
//			out.flush();
//			mav.setViewName("index");
//		}else {
//			
//		}
		String jsonData = gson.toJson(MyService.getList(cri));
		mav.addObject("list", jsonData);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(MyService.getListCnt());
		mav.addObject("pageMaker", pageMaker);
		
		mav.setViewName("draftLetterBox");	
		return mav;
	}
	@RequestMapping(value="/paymentBox")
	public ModelAndView paymentBox(HttpServletRequest req,HttpServletResponse res,ModelAndView mav,@ModelAttribute MyVo vo,Criteria cri) throws Exception {
//		HttpSession session = req.getSession();
//
//		if(session.getAttribute("id") == null) {
//			res.setCharacterEncoding("UTF-8");
//			res.setContentType("text/html; charset=UTF-8");
//			PrintWriter out = res.getWriter();
//			out.println("<script>alert('로그인정보를 확인하세요.');</script>");
//			out.flush();
//			mav.setViewName("index");
//		}else {
//			
//		}
		String jsonData = gson.toJson(MyService.getList(cri));
		mav.addObject("list", jsonData);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(MyService.getListCnt());
		mav.addObject("pageMaker", pageMaker);
		
		mav.setViewName("paymentBox");	
		return mav;
	}
	@RequestMapping(value="/paymentInfo")
	public ModelAndView paymentInfo(HttpServletRequest req,HttpServletResponse res,ModelAndView mav,@ModelAttribute MyVo vo,Criteria cri) throws Exception {
		HttpSession session = req.getSession();

		if(session.getAttribute("id") == null) {
			res.setCharacterEncoding("UTF-8");
			res.setContentType("text/html; charset=UTF-8");
			PrintWriter out = res.getWriter();
			out.println("<script>alert('로그인정보를 확인하세요.');</script>");
			out.flush();
			mav.setViewName("index");
		}else {
			String id = (String)session.getAttribute("id");
			String pw = (String)session.getAttribute("pw");
			vo.setId(id);
			vo.setPw(pw);
			
			String jsonData1 = gson.toJson(MyService.getInfo(vo));
			mav.addObject("Info", jsonData1);
	
			
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(MyService.getListCnt());
			mav.addObject("pageMaker", pageMaker);
			
			mav.setViewName("paymentInfo");	
		}

		return mav;
	}
	@RequestMapping(value="/approvalline")
	public ModelAndView approvalline(HttpServletRequest req,HttpServletResponse res,ModelAndView mav,@ModelAttribute MyVo vo,Criteria cri) throws Exception {
//		HttpSession session = req.getSession();
//
//		if(session.getAttribute("id") == null) {
//			res.setCharacterEncoding("UTF-8");
//			res.setContentType("text/html; charset=UTF-8");
//			PrintWriter out = res.getWriter();
//			out.println("<script>alert('로그인정보를 확인하세요.');</script>");
//			out.flush();
//			mav.setViewName("index");
//		}else {
//			
//		}
		mav.setViewName("approvalline");	
		return mav;
	}
	@RequestMapping(value="/join")
	public ModelAndView join(HttpServletRequest req,HttpServletResponse res,ModelAndView mav,@ModelAttribute MyVo vo,Criteria cri) throws Exception {
		System.out.println("직급 = " + vo.getRank());
		System.out.println("부서 = " + vo.getDepartment());
		System.out.println("이름    = " + vo.getName());
		System.out.println("입사일 = "+ vo.getCompanyfirstdate());
		System.out.println("id = " + vo.getId());
		System.out.println("pw = " + vo.getPw());
		System.out.println("전화번호 = " + vo.getCall());
		System.out.println("회사전화번호 =" + vo.getCompanyCall());
		System.out.println("이메일 = "  + vo.getEmail());
		String rs = MyService.join(vo);

		if("S".equals(rs)) {
			res.setCharacterEncoding("UTF-8");
			res.setContentType("text/html; charset=UTF-8");
			PrintWriter out = res.getWriter();
			out.println("<script>alert('회원가입을 축하드립니다.');</script>");
			out.flush();
			mav.setViewName("login");	
		}else {
			res.setCharacterEncoding("UTF-8");
			res.setContentType("text/html; charset=UTF-8");
			PrintWriter out = res.getWriter();
			out.println("<script>alert('오류.');</script>");
			out.flush();
			mav.setViewName("login");
		}
		
		mav.setViewName("login");	
		return mav;
	}
	@RequestMapping(value="/insert")
	public ModelAndView insert(HttpServletRequest req,HttpServletResponse res,ModelAndView mav,@ModelAttribute MyVo vo,Criteria cri) throws Exception {
		String rs = MyService.insert(vo);

		if("S".equals(rs)) {
			String jsonData2 = gson.toJson(MyService.getInfo(vo));
			mav.addObject("Info", jsonData2);
			mav.setViewName("paymentInfo");	
		}else {
			mav.setViewName("draftLetter");
		}

		return mav;
	}
	
}   