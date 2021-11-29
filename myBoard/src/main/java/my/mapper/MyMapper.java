package my.mapper;

import java.util.ArrayList;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import my.vo.Criteria;
import my.vo.MyVo;


@Mapper("MyMapper")
public interface MyMapper {
	
	public MyVo join(MyVo mv);
	
	public MyVo joinInfo(MyVo mv);
	
	public void joinUpdate(MyVo mv);
	
	public void stateUpdate(MyVo mv);
	
	public void stateUpdatelast(MyVo mv);
	
	public void companionUpdatelast(MyVo mv);
	
	public void companionUpdateAll (MyVo mv);
	
	public String stateUpdateCheck(MyVo mv);
	
	public void companionUpdate(MyVo mv);
	
	public int stateUpdatelastCheck(MyVo mv);
	
	public MyVo login(MyVo mv);
	
	public int getListCnt();
	
	public ArrayList<MyVo> getList(Criteria cri);
	
	public void apvinsert(MyVo mv);
	
	public void apvAdinsert(MyVo mv);
	
	public ArrayList<MyVo> getInfo(MyVo mv);
	
	public ArrayList<MyVo> getpaymentInfo(MyVo mv);
	
	public MyVo paymentDetail(MyVo mv);
	
	public ArrayList<MyVo> vue(MyVo mv);
	
	public ArrayList<MyVo> vuedpt(MyVo mv);
}
