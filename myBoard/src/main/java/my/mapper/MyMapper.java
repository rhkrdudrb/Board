package my.mapper;

import java.util.ArrayList;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import my.vo.Criteria;
import my.vo.MyVo;


@Mapper("MyMapper")
public interface MyMapper {
	
	public ArrayList<MyVo> test(MyVo mv);
	
	public int getListCnt();
	
	public ArrayList<MyVo> getList(Criteria cri);
}
