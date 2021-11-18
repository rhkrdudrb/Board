package my.service;

import java.util.ArrayList;
import my.vo.Criteria;
import my.vo.MyVo;

public interface MyService {
	
	public String insert(MyVo mv);
	
	public String join(MyVo mv);
	
	public MyVo login(MyVo mv);
	
	public ArrayList<MyVo> getInfo(MyVo mv);
	
	public int getListCnt();
	
	public ArrayList<MyVo> getList(Criteria cri);
	
}
