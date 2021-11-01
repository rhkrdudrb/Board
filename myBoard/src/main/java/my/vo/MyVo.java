package my.vo;

import java.io.Serializable;

import org.springframework.web.multipart.MultipartFile;

public class MyVo extends PageMaker{
	
	private int column1;
	private String column2;
	private String column3;
	private String column4;
	private String column5;
	private String column6;
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
	public int getColumn1() {
		return column1;
	}
	public void setColumn1(int column1) {
		this.column1 = column1;
	}
	public String getColumn2() {
		return column2;
	}
	public void setColumn2(String column2) {
		this.column2 = column2;
	}
	public String getColumn3() {
		return column3;
	}
	public void setColumn3(String column3) {
		this.column3 = column3;
	}
	public String getColumn4() {
		return column4;
	}
	public void setColumn4(String column4) {
		this.column4 = column4;
	}
	public String getColumn5() {
		return column5;
	}
	public void setColumn5(String column5) {
		this.column5 = column5;
	}
	public String getColumn6() {
		return column6;
	}
	public void setColumn6(String column6) {
		this.column6 = column6;
	}
	
	}

