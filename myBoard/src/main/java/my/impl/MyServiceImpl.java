package my.impl;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import my.service.MyService;
import my.vo.Criteria;
import my.vo.MyVo;

import my.mapper.MyMapper;
@Service("MyService")
public class MyServiceImpl extends EgovAbstractServiceImpl implements MyService {
    @Autowired
    private MyMapper MyMapper;
//	@Resource(name="MyMapper")
//	private MyMapper MyMapper;
//	@Resource(name="MyService")
//  private MyService MyService;
//  여기서 자세한것 들 정의 컨트롤러에서 x 
    public MyVo login(MyVo mv) {
		return MyMapper.login(mv);
	}

	public int getListCnt() {
		return MyMapper.getListCnt();
	}

	public ArrayList<MyVo> getList(Criteria cri)  {
		return MyMapper.getList(cri);
	}
	public String insert(MyVo mv) {
		String result = "S";
		try {
			//insert 실행
			MyMapper.divinsert(mv);
			MyMapper.apvinsert(mv);
		} catch(Exception e) {
			result = "E";
		}
		
		
		return result;
	}
	
	public ArrayList<MyVo> getInfo(MyVo mv) {

		return MyMapper.getInfo(mv);
	}
	
	public String join(MyVo mv) {
		String result = "S";
	try {
		//insert 실행
		MyMapper.join(mv);
	} catch(Exception e) {
		result = "E";
	}
		return result;
	}
}
