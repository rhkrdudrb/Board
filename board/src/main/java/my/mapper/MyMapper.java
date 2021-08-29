package my.mapper;

import java.util.ArrayList;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import my.impl.MyDTO;

@Mapper("MyMapper")
public interface MyMapper {
	
	public ArrayList<MyDTO> test(MyDTO mv);
}
