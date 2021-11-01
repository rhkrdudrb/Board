package my.service;

import java.util.ArrayList;

import my.vo.Criteria;
import my.vo.MyVo;



public interface MyService {
	
	public ArrayList<MyVo> test(MyVo mv);
	
	public int getListCnt();
	
	public ArrayList<MyVo> getList(Criteria cri);
}
