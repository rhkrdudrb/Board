package my.mapper;

import java.util.ArrayList;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import my.vo.MyVo;

@Mapper("MyMapper")
public interface MyMapper {
	
	public ArrayList<MyVo> test(MyVo mv);
}
