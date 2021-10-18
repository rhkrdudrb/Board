package my.impl;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import my.service.MyService;
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
	@Override
	public ArrayList<MyVo> test(MyVo mv) {
		
		return MyMapper.test(mv);
	}
}
