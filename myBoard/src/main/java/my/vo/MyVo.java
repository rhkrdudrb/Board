package my.vo;

import java.io.Serializable;

import org.springframework.web.multipart.MultipartFile;

public class MyVo {
	private String a1;
	private String a2;
	private String a3;
	private String id;
	private String pw;
    private String freeContext;
    
	public String getFreeContext() {
		return freeContext;
	}
	public void setFreeContext(String freeContext) {
		this.freeContext = freeContext;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getA1() {
		return a1;
	}
	public void setA1(String a1) {
		this.a1 = a1;
	}
	public String getA2() {
		return a2;
	}
	public void setA2(String a2) {
		this.a2 = a2;
	}
	public String getA3() {
		return a3;
	}
	public void setA3(String a3) {
		this.a3 = a3;
	}
}
