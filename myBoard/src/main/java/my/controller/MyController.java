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
	
	@RequestMapping(value="/test")
	public ModelAndView test(HttpServletRequest req,HttpServletResponse res,ModelAndView mav,@ModelAttribute MyVo vo,Criteria cri) throws Exception {
		HttpSession session = req.getSession();
		
		System.out.println(vo.getId());
		System.out.println(vo.getPw());
		//세션담기
		session.setAttribute("id",vo.getId());
		session.setAttribute("pw", vo.getPw());
		
		if(session.getAttribute("id") == null) {
			res.setCharacterEncoding("UTF-8");
			res.setContentType("text/html; charset=UTF-8");
			PrintWriter out = res.getWriter();
			out.println("<script>alert('로그인정보를 확인하세요.');</script>");
			out.flush();
			mav.setViewName("index");
		}else {
		}
		
			String jsonData = gson.toJson(MyService.getList(cri));
			mav.addObject("list", jsonData);
			
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(MyService.getListCnt());
			mav.addObject("pageMaker", pageMaker);
			
			mav.setViewName("main");	
		
		
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
		
		mav.setViewName("paymentInfo");	
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
	
}   