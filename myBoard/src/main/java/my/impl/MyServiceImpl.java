package my.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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
//		try {
			//insert 실행
			MyMapper.apvinsert(mv);
			
			int order = 1;
			for(int i=0 ;i<mv.getTreename().length-1; i++) {
				mv.setTreenameinsert(mv.getTreename()[i]);
				mv.setTreeorder(order);

				MyMapper.apvAdinsert(mv);
				order++;
				//setTreenameinsert 초기화
				mv.setTreenameinsert("1");
			}

//		} catch(Exception e) {
//			result = "E";
//		}
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

	public MyVo paymentDetail(MyVo mv) {
		return MyMapper.paymentDetail(mv);
	}

	public MyVo joinInfo(MyVo mv) {
		return MyMapper.joinInfo(mv);
	}

	public String joinUpdate(MyVo mv) {
		String result = "S";
		try {
			MyMapper.joinUpdate(mv);
		} catch(Exception e) {
			result = "E";
		}
			return result;
		}

	public ArrayList<MyVo> vue(MyVo mv) {
		return MyMapper.vue(mv);
	}

	public ArrayList<MyVo> vuedpt(MyVo mv) {
		return MyMapper.vuedpt(mv);
	}

	public ArrayList<MyVo> getpaymentInfo(MyVo mv) {
		return MyMapper.getpaymentInfo(mv);
	}

	public String stateUpdate(MyVo mv) {
		String result = "S";
		mv.setApvodadChint(mv.getApvodad()-1);
		int resultlastChk = MyMapper.stateUpdatelastCheck(mv);
		String resultChk = MyMapper.stateUpdateCheck(mv);
		if(resultChk == null || resultChk.equals("S")) {
				if(mv.getApvodad() == resultlastChk) {
					MyMapper.stateUpdatelast(mv);
				}
				MyMapper.stateUpdate(mv);
			}else {
				result = "E";
			}
		return result;
   }

	public String companionUpdate(MyVo mv) {
		String result = "S";
		mv.setApvodadChint(mv.getApvodad()-1);
//		int resultlastChk = MyMapper.stateUpdatelastCheck(mv);
		String resultChk = MyMapper.stateUpdateCheck(mv);
		System.out.println(resultChk);
		if(resultChk == null || resultChk.equals("B")) {
					MyMapper.companionUpdate(mv);
					MyMapper.stateUpdate(mv);	
			}else {
				result = "E";
			}
		return result;
   }
}