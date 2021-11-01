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
		if(session.getAttribute("id") == null) {
			res.setCharacterEncoding("UTF-8");
			res.setContentType("text/html; charset=UTF-8");
			PrintWriter out = res.getWriter();
			out.println("<script>alert('로그인정보를 확인하세요.');</script>");
			out.flush();
			mav.setViewName("index");
		}else {
//			ArrayList<MyVo> str = MyService.test(vo);
			//json객체 만들기
//			String jsonData = gson.toJson(str);
//			mav.addObject("resultStr", jsonData);
//			System.out.println(str);
			String jsonData = gson.toJson(MyService.getList(cri));
			mav.addObject("list", jsonData);
			
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(MyService.getListCnt());
			mav.addObject("pageMaker", pageMaker);
			
			mav.setViewName("listT");	
		}
		
		return mav;
	}	
	@RequestMapping(value = "/login", method = {RequestMethod.POST })
	public ModelAndView login(HttpServletRequest req,ModelAndView mav,@ModelAttribute MyVo vo) throws Exception {
		HttpSession session = req.getSession();
		
		System.out.println(vo.getId());
		System.out.println(vo.getPw());
		//세션담기
		session.setAttribute("id",vo.getId());
		session.setAttribute("pw", vo.getPw());
		
		mav.setViewName("hello1");
		return mav;
	}	
	@RequestMapping(value = "/sessionDel", method = {RequestMethod.POST })
	public ModelAndView sessionDel(HttpServletRequest req,ModelAndView mav,@ModelAttribute MyVo vo) throws Exception {
		HttpSession session = req.getSession();
		 session.removeAttribute("id");
		 session.removeAttribute("pw");
		mav.setViewName("hello1");
		return mav;
	}
	@RequestMapping(value = "/upload", method = {RequestMethod.POST })
	public ModelAndView upload(HttpServletResponse res,HttpServletRequest req,ModelAndView mav,@ModelAttribute MyVo vo) throws Exception {
		System.out.println(vo.getFreeContext());
		res.setCharacterEncoding("UTF-8");
		res.setContentType("text/html; charset=UTF-8");
		mav.addObject("content", vo.getFreeContext());
		mav.setViewName("hello1");
		return mav;
	}   
}