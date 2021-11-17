package my.mapper;

import java.util.ArrayList;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import my.vo.Criteria;
import my.vo.MyVo;


@Mapper("MyMapper")
public interface MyMapper {
	
	public void join(MyVo mv);
	
	public MyVo login(MyVo mv);
	
	public ArrayList<MyVo> test(MyVo mv);
	
	public int getListCnt();
	
	public ArrayList<MyVo> getList(Criteria cri);
	
	public void apvinsert(MyVo mv);
	
	public void divinsert(MyVo mv);
	
	public ArrayList<MyVo> getInfo(MyVo mv);
	
}
