package my.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import my.mapper.MyMapper;
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
	ModelAndView mav = new ModelAndView();

	// 로그인
	@RequestMapping(value = "/login")
	public ModelAndView login(@RequestParam("id") String id, @RequestParam("pw") String pw, HttpServletRequest req,
			HttpServletResponse res, ModelAndView mav, @ModelAttribute MyVo vo, Criteria cri) throws Exception {
		HttpSession session = req.getSession();
		MyVo login = MyService.login(vo);

		if (login == null) {
			res.setCharacterEncoding("UTF-8");
			res.setContentType("text/html; charset=UTF-8");
			PrintWriter out = res.getWriter();
			out.println("<script>alert('아이디혹은 비밀번호가 다릅니다.');</script>");
			out.flush();
			mav.setViewName("login");
		} else {
			session.setAttribute("id", id);
			session.setAttribute("pw", pw);
			session.setAttribute("sq", login.getSq());
			session.setAttribute("name", login.getUsrNm());
			vo.setId(id);
			mav.addObject("login", login);
			String jsonData1 = gson.toJson(MyService.getpaymentInfo(vo));
			mav.addObject("payInfo", jsonData1);

			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
//			pageMaker.setTotalCount(MyService.getListCnt());
			mav.addObject("pageMaker", pageMaker);

			mav.setViewName("paymentBox");

		}
		return mav;
	}

	// 로그아웃
	@RequestMapping(value = "/logout")
	public ModelAndView logout(HttpServletRequest req, HttpServletResponse res, ModelAndView mav,
			@ModelAttribute MyVo vo, Criteria cri) throws Exception {
		HttpSession session = req.getSession();
		session.removeAttribute("id");
		session.removeAttribute("pw");
		res.setContentType("text/html; charset=UTF-8");
		PrintWriter out = res.getWriter();
		out.println("<script>alert('로그아웃이 완료되었습니다.');</script>");
		out.flush();
		mav.setViewName("login");
		return mav;
	}

	// 회원정보
	@RequestMapping(value = "/joinInfo")
	public ModelAndView joinInfo(HttpServletRequest req, HttpServletResponse res, ModelAndView mav,
			@ModelAttribute MyVo vo, Criteria cri) throws Exception {
		MyVo joinInfo = MyService.joinInfo(vo);

		mav.addObject("joinInfo", joinInfo);
		mav.setViewName("joinInfo");
		return mav;
	}

	// 회원정보수정
	@RequestMapping(value = "/joinUpdate")
	@ResponseBody
	public ModelAndView joinUpdate(HttpServletRequest req, HttpServletRequest mRequest, @ModelAttribute MyVo vo,
			Criteria cri) throws Exception {
		HttpSession session = req.getSession();
		mRequest.setCharacterEncoding("UTF-8");
		String id = (String) session.getAttribute("id");
		String pw = (String) session.getAttribute("pw");
		vo.setId(id);
		vo.setPw(pw);

		String rs = MyService.joinUpdate(vo);
		if ("S".equals(rs)) {
			MyVo joinInfo = MyService.joinInfo(vo);
			session.setAttribute("name", joinInfo.getName());
			mav.setViewName("joinInfo");
		}

		return mav;
	}

	// 종결함 select
	@RequestMapping(value = "/end")
	public ModelAndView end(HttpServletRequest req, HttpServletResponse res, ModelAndView mav, @ModelAttribute MyVo vo,
			Criteria cri) throws Exception {
		HttpSession session = req.getSession();
		if (session.getAttribute("id") == null) {
			res.setCharacterEncoding("UTF-8");
			res.setContentType("text/html; charset=UTF-8");
			PrintWriter out = res.getWriter();
			out.println("<script>alert('로그인정보를 확인하세요.');</script>");
			out.flush();
			mav.setViewName("login");
		} else {
			String id = (String) session.getAttribute("id");
			String pw = (String) session.getAttribute("pw");
			vo.setId(id);
			vo.setPw(pw);

			String jsonData1 = gson.toJson(MyService.getEndInfo(vo));
			mav.addObject("Info", jsonData1);

			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
//			pageMaker.setTotalCount(MyService.getListCnt());
			mav.addObject("pageMaker", pageMaker);

			mav.setViewName("end");
		}
		mav.setViewName("end");
		return mav;
	}

	// 반려
	@RequestMapping(value = "/companionUpdate")
	public ModelAndView companionUpdate(HttpServletRequest req, HttpServletResponse res, ModelAndView mav,
			@ModelAttribute MyVo vo, Criteria cri) throws Exception {
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("id");
		vo.setId(id);
		String rs = MyService.companionUpdate(vo);
		if ("S".equals(rs)) {
			String jsonData1 = gson.toJson(MyService.getpaymentInfo(vo));
			mav.addObject("payInfo", jsonData1);

			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(MyService.getListCnt());
			mav.addObject("pageMaker", pageMaker);

			res.setContentType("text/html; charset=UTF-8");
			PrintWriter out = res.getWriter();
			out.println("<script>alert('반려완료');</script>");
			out.flush();
			mav.setViewName("paymentBox");
		} else {
			String jsonData1 = gson.toJson(MyService.getpaymentInfo(vo));
			mav.addObject("payInfo", jsonData1);

			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(MyService.getListCnt());
			mav.addObject("pageMaker", pageMaker);

			res.setContentType("text/html; charset=UTF-8");
			PrintWriter out = res.getWriter();
			out.println("<script>alert('에러');</script>");
			out.flush();

			mav.setViewName("paymentBox");
		}
		return mav;
	}

	// 결재승인
	@RequestMapping(value = "/stateUpdate")
	public ModelAndView stateUpdate(HttpServletRequest req, HttpServletResponse res, ModelAndView mav,
			@ModelAttribute MyVo vo, Criteria cri) throws Exception {
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("id");
		vo.setId(id);

		String rs = MyService.stateUpdate(vo);
		if ("S".equals(rs)) {
			String jsonData1 = gson.toJson(MyService.getpaymentInfo(vo));
			mav.addObject("payInfo", jsonData1);

			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(MyService.getListCnt());
			mav.addObject("pageMaker", pageMaker);

			res.setContentType("text/html; charset=UTF-8");
			PrintWriter out = res.getWriter();
			out.println("<script>alert('결재완료');</script>");
			out.flush();
			mav.setViewName("paymentBox");
		} else {
			String jsonData1 = gson.toJson(MyService.getpaymentInfo(vo));
			mav.addObject("payInfo", jsonData1);

			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(MyService.getListCnt());
			mav.addObject("pageMaker", pageMaker);

			res.setContentType("text/html; charset=UTF-8");
			PrintWriter out = res.getWriter();
			out.println("<script>alert('결재순서가 아닙니다.');</script>");
			out.flush();

			mav.setViewName("paymentBox");
		}
		return mav;
	}

	// 기안서작성화면 이동
	@RequestMapping(value = "/draftLetter")
	public ModelAndView draftLetter(HttpServletRequest req, HttpServletResponse res, ModelAndView mav,
			@ModelAttribute MyVo vo, Criteria cri) throws Exception {
		HttpSession session = req.getSession();

		if (session.getAttribute("id") == null) {
			res.setCharacterEncoding("UTF-8");
			res.setContentType("text/html; charset=UTF-8");
			PrintWriter out = res.getWriter();
			out.println("<script>alert('로그인정보를 확인하세요.');</script>");
			out.flush();
			mav.setViewName("index");
		} else {
			mav.setViewName("draftLetter");
		}
		return mav;
	}

	// 결재함 SELECT
	@RequestMapping(value = "/paymentBox")
	public ModelAndView paymentBox(HttpServletRequest req, HttpServletResponse res, ModelAndView mav,
			@ModelAttribute MyVo vo, Criteria cri) throws Exception {
		HttpSession session = req.getSession();
		if (session.getAttribute("id") == null) {
			res.setCharacterEncoding("UTF-8");
			res.setContentType("text/html; charset=UTF-8");
			PrintWriter out = res.getWriter();
			out.println("<script>alert('로그인정보를 확인하세요.');</script>");
			out.flush();
			mav.setViewName("login");
		} else {
			String id = (String) session.getAttribute("id");
			vo.setId(id);

			String jsonData1 = gson.toJson(MyService.getpaymentInfo(vo));
			mav.addObject("payInfo", jsonData1);
			System.out.println(jsonData1);
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
//			pageMaker.setTotalCount(MyService.getListCnt());
			mav.addObject("pageMaker", pageMaker);

			mav.setViewName("paymentBox");
		}
		return mav;
	}

	// 기안함 상세정보
	@RequestMapping(value = "/paymentDetail")
	public ModelAndView paymentDetail(HttpServletRequest req, HttpServletResponse res, ModelAndView mav,
			@ModelAttribute MyVo vo, Criteria cri) throws Exception {
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("id");
		vo.setId(id);
		MyVo paymentDetail = MyService.paymentDetail(vo);
		mav.addObject("paymentDetail", paymentDetail);

//			String RealTime = gson.toJson(MyService.RealTime(vo));
//			mav.addObject("RealTime", RealTime);

		mav.setViewName("paymentDetail");
		return mav;
	}

	// 종결함 상세정보
	@RequestMapping(value = "/paymentBoxDetail")
	public ModelAndView paymentBoxDetail(HttpServletRequest req, HttpServletResponse res, ModelAndView mav,
			@ModelAttribute MyVo vo, Criteria cri) throws Exception {
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("id");
		vo.setId(id);
		MyVo paymentDetail = MyService.paymentDetail(vo);
		mav.addObject("paymentDetail", paymentDetail);

		String paymentDetailsq = gson.toJson(MyService.paymentDetailsq(vo));
		mav.addObject("paymentDetailsq", paymentDetailsq);
		
		System.out.println(vo.getApvsq());
		System.out.println(vo.getApvodad());
		String jsonData1 = gson.toJson(MyService.getState(vo));
		mav.addObject("payInfo", jsonData1);
		
		System.out.println(jsonData1);
		mav.setViewName("paymentDetail");
		return mav;
	}

	// 부서명 SELECT(Vue Tree 부모)
	// produces = "application/text; charset=utf8" -------->Ajax 한글인코딩
	@RequestMapping(value = "/vuedpt", produces = "application/text; charset=utf8")
	@ResponseBody
	public String vuedpt(HttpServletRequest req, HttpServletResponse res, ModelAndView mav, @ModelAttribute MyVo vo,
			Criteria cri) throws Exception {
		res.setCharacterEncoding("UTF-8");
		String jsonData1 = gson.toJson(MyService.vuedpt(vo));

		return jsonData1;
	}

	// 부서별 사원이름(Vue Tree 자식)
	// produces = "application/text; charset=utf8" -------->Ajax 한글인코딩
	@RequestMapping(value = "/vue", produces = "application/text; charset=utf8")
	@ResponseBody
	public String vue(HttpServletRequest req, HttpServletResponse res, ModelAndView mav, @ModelAttribute MyVo vo,
			Criteria cri) throws Exception {
		res.setCharacterEncoding("UTF-8");
		String jsonData2 = gson.toJson(MyService.vue(vo));
		return jsonData2;
	}

	// 회원페이지 이동
	@RequestMapping(value = "/join")
	public ModelAndView join(HttpServletRequest req, HttpServletResponse res, ModelAndView mav, @ModelAttribute MyVo vo,
			Criteria cri) throws Exception {
		mav.setViewName("join");
		return mav;
	}

	// 결재선 팝업
	@RequestMapping(value = "/approvalline")
	public ModelAndView approvalline(HttpServletRequest req, HttpServletResponse res, ModelAndView mav,
			@ModelAttribute MyVo vo, Criteria cri) throws Exception {
		mav.setViewName("approvalline");
		return mav;
	}

	// 회원가입
	@RequestMapping(value = "/joinInsert")
	public ModelAndView joinInsert(HttpServletRequest req, HttpServletResponse res, ModelAndView mav,
			@ModelAttribute MyVo vo, Criteria cri) throws Exception {
		String rs = MyService.join(vo);

		if ("S".equals(rs)) {
			res.setCharacterEncoding("UTF-8");
			res.setContentType("text/html; charset=UTF-8");
			PrintWriter out = res.getWriter();
			out.println("<script>alert('회원가입을 축하드립니다.');</script>");
			out.flush();
			mav.setViewName("login");
		} else {
			res.setCharacterEncoding("UTF-8");
			res.setContentType("text/html; charset=UTF-8");
			PrintWriter out = res.getWriter();
			out.println("<script>alert('오류.');</script>");
			out.flush();
			mav.setViewName("join");
		}
		return mav;
	}

	// 결재함 select
	@RequestMapping(value = "/draftLetterBox")
	public ModelAndView draftLetterBox(HttpServletRequest req, HttpServletResponse res, ModelAndView mav,
			@ModelAttribute MyVo vo, Criteria cri) throws Exception {
		HttpSession session = req.getSession();
		if (session.getAttribute("id") == null) {
			res.setCharacterEncoding("UTF-8");
			res.setContentType("text/html; charset=UTF-8");
			PrintWriter out = res.getWriter();
			out.println("<script>alert('로그인정보를 확인하세요.');</script>");
			out.flush();
			mav.setViewName("login");
		} else {
			String id = (String) session.getAttribute("id");
			String pw = (String) session.getAttribute("pw");
			vo.setId(id);
			vo.setPw(pw);

			String jsonData1 = gson.toJson(MyService.getInfo(vo));
			mav.addObject("Info", jsonData1);

			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
//			pageMaker.setTotalCount(MyService.getListCnt());
			mav.addObject("pageMaker", pageMaker);

			mav.setViewName("draftLetterBox");
		}
		return mav;
	}

	// 결재 insert
	@RequestMapping(value = "/insert")
	public ModelAndView insert(HttpServletRequest req, HttpServletResponse res, ModelAndView mav,
			@ModelAttribute MyVo vo, Criteria cri) throws Exception {
		String rs = MyService.insert(vo);
		if ("S".equals(rs)) {
			String jsonData2 = gson.toJson(MyService.getInfo(vo));
			mav.addObject("Info", jsonData2);
			mav.setViewName("draftLetterBox");
		} else {
			res.setCharacterEncoding("UTF-8");
			res.setContentType("text/html; charset=UTF-8");
			PrintWriter out = res.getWriter();
			out.println("<script>alert('오류.');</script>");
			out.flush();
			mav.setViewName("draftLetter");
		}

		return mav;
	}

}