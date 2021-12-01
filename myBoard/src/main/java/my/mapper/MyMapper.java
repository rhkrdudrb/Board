package my.mapper;

import java.util.ArrayList;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import my.vo.Criteria;
import my.vo.MyVo;


@Mapper("MyMapper")
public interface MyMapper {
	
	public void join(MyVo mv);							//회원가입
	
	public MyVo joinInfo(MyVo mv);						//회원정보
	
	public void joinUpdate(MyVo mv);					//회원정보 수정
	
	public void stateUpdate(MyVo mv);					//결재디테일 TABLE UPDATE
	
	public void stateUpdatelast(MyVo mv);				//최종결재자 UPDATE
	
	public int stateUpdatelastCheck(MyVo mv);			//최종결재자 판단여부(MAX값에 따른 조건)//결재 비교 매서드(상태값에 따른 조건)
	
	public void companionUpdatelast(MyVo mv);			//결재 TABLE 반려 컬럼 UPDATE
	
	public void companionUpdateAll (MyVo mv);			//결재 디테일 반려 컬럼 전부 UPDATE
		
	public void companionUpdate(MyVo mv);				//나의 결재 디테일 반려 컬럼  UPDATE
	
	public void date(MyVo mv);							//결재한시간
	
	public String stateUpdateCheck(MyVo mv);			//결재,반려 비교 매서드(상태값에 따른 조건)
	
	public MyVo login(MyVo mv);							//로그인
	
	public int getListCnt();							//페이징
	
	public ArrayList<MyVo> getList(Criteria cri);		//페이징
	
	public void apvinsert(MyVo mv);						//결재 INSERT
	
	public void apvAdinsert(MyVo mv);					//결재 순서 INSERT
	
	public ArrayList<MyVo> getInfo(MyVo mv);			//결재함 SELECT
	
	public ArrayList<MyVo> getEndInfo(MyVo mv);			//종결함 SELECT
	
	public ArrayList<MyVo> getpaymentInfo(MyVo mv);		//기안함 SELECT
	
	public ArrayList<MyVo> getState(MyVo mv);           //결재함 STATE
	
	public MyVo paymentDetail(MyVo mv);					//결재 디테일
	
	public ArrayList<MyVo> paymentDetailsq(MyVo mv);    //결재 디테일 sq
	
	public ArrayList<MyVo> vue(MyVo mv);				//부서별 사원이름 SELECT(Vue Tree 자식)
	
	public ArrayList<MyVo> vuedpt(MyVo mv);				//부서명 SELECT(Vue Tree 부모)
	
	public ArrayList<MyVo> RealTime(MyVo mv);			//추후 작업
	
}
