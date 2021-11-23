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
	
	public MyVo login(MyVo mv);
	
	public int getListCnt();
	
	public ArrayList<MyVo> getList(Criteria cri);
	
	public void apvinsert(MyVo mv);
	
	public ArrayList<MyVo> getInfo(MyVo mv);
	
	public MyVo paymentDetail(MyVo mv);
	
	public ArrayList<MyVo> vue(MyVo mv);
}
