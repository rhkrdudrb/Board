package my.service;

import java.util.ArrayList;
import my.vo.Criteria;
import my.vo.MyVo;

public interface MyService {
	
	public String insert(MyVo mv);						//결재 INSERT
	
	public String join(MyVo mv);						//회원가입페이지 이동
	
	public MyVo login(MyVo mv);							//로그인
	
	public ArrayList<MyVo> getInfo(MyVo mv);			//결재정보 SELECT		
	
	public ArrayList<MyVo> getEndInfo(MyVo mv);			//종결함 SELECT
	
	public ArrayList<MyVo> getpaymentInfo(MyVo mv);		//기안함 SELECT
	
	public ArrayList<MyVo> getState(MyVo mv);		    //결재함 STATE
	
	public int getListCnt();							//페이징
	
	public ArrayList<MyVo> getList(Criteria cri);		//페이징
	
	public MyVo paymentDetail(MyVo mv);					//결재 디테일
	
	public ArrayList<MyVo> paymentDetailsq(MyVo mv);	//결재 디테일sq
	
	public MyVo joinInfo(MyVo mv);						//회원정보
	
	public String joinUpdate(MyVo mv);					//회원정보수정
	
	public String stateUpdate(MyVo mv);					//결재
	
	public String companionUpdate(MyVo mv); 			//반려
	
	public ArrayList<MyVo> vuedpt(MyVo mv);				//부서명 SELECT(Vue Tree 부모)
	
	public ArrayList<MyVo> vue(MyVo mv);				//부서별 사원이름(Vue Tree 자식)
	
//	public ArrayList<MyVo> RealTime(MyVo mv);		
}
