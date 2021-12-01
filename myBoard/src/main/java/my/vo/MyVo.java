package my.vo;

import java.io.Serializable;

import org.springframework.web.multipart.MultipartFile;

public class MyVo extends PageMaker {

	private int column1;
	private String column2;
	private String column3;
	private String column4;
	private String column5;
	private String name;
	private String call;
	private String companyCall;
	private String apvdate;
	private String apvnm;
	private String email;
	private String Department;
	private String rank;
	private String companyfirstdate;
	private String date;
	private String column6;
	private String id;
	private String pw;
	private String freeContext;
	private String usrNm;
	private String DIV_APV_SQ;
	private String APV_TB;
	private String apvcnt;

	private String apvno;
	private String dptsq;
	private String line;
	private String sq;

	private String divapvsq;
	private int apvodad;
	private String apvodadCh;
	private int apvodadChint;
	private String apvodadlastCh;
	private String stfsq;
	private String apvsq;
	private String dptnm;
	private String stfnm;
	private String form;
	private String apvform;

	private String rnknm;

	private String stfid;
	private String state;
	private String[] treename;

	private String treenameinsert;

	private int treeorder;
	private int apv_sq;

	public String getStfsq() {
		return stfsq;
	}

	public void setStfsq(String stfsq) {
		this.stfsq = stfsq;
	}

	public String getApvno() {
		return apvno;
	}

	public void setApvno(String apvno) {
		this.apvno = apvno;
	}

	public String getApvodadlastCh() {
		return apvodadlastCh;
	}

	public void setApvodadlastCh(String apvodadlastCh) {
		this.apvodadlastCh = apvodadlastCh;
	}

	public int getApvodadChint() {
		return apvodadChint;
	}

	public void setApvodadChint(int apvodadChint) {
		this.apvodadChint = apvodadChint;
	}

	public String getApvodadCh() {
		return apvodadCh;
	}

	public void setApvodadCh(String apvodadCh) {
		this.apvodadCh = apvodadCh;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public int getApvodad() {
		return apvodad;
	}

	public void setApvodad(int apvodad) {
		this.apvodad = apvodad;
	}

	public int getApv_sq() {
		return apv_sq;
	}

	public void setApv_sq(int apv_sq) {
		this.apv_sq = apv_sq;
	}

	public int getTreeorder() {
		return treeorder;
	}

	public void setTreeorder(int treeorder) {
		this.treeorder = treeorder;
	}

	public String getTreenameinsert() {
		return treenameinsert;
	}

	public void setTreenameinsert(String treenameinsert) {
		this.treenameinsert = treenameinsert;
	}

	public String[] getTreename() {
		return treename;
	}

	public void setTreename(String[] treename) {
		this.treename = treename;
	}

	public String getDptsq() {
		return dptsq;
	}

	public void setDptsq(String dptsq) {
		this.dptsq = dptsq;
	}

	public String getStfid() {
		return stfid;
	}

	public void setStfid(String stfid) {
		this.stfid = stfid;
	}

	public String getRnknm() {
		return rnknm;
	}

	public void setRnknm(String rnknm) {
		this.rnknm = rnknm;
	}

	public String getApvcnt() {
		return apvcnt;
	}

	public void setApvcnt(String apvcnt) {
		this.apvcnt = apvcnt;
	}

	public String getDivapvsq() {
		return divapvsq;
	}

	public void setDivapvsq(String divapvsq) {
		this.divapvsq = divapvsq;
	}

	public String getDepartment() {
		return Department;
	}

	public void setDepartment(String department) {
		Department = department;
	}

	public String getRank() {
		return rank;
	}

	public void setRank(String rank) {
		this.rank = rank;
	}

	public String getSq() {
		return sq;
	}

	public void setSq(String sq) {
		this.sq = sq;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCall() {
		return call;
	}

	public void setCall(String call) {
		this.call = call;
	}

	public String getCompanyCall() {
		return companyCall;
	}

	public void setCompanyCall(String companyCall) {
		this.companyCall = companyCall;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getCompanyfirstdate() {
		return companyfirstdate;
	}

	public void setCompanyfirstdate(String companyfirstdate) {
		this.companyfirstdate = companyfirstdate;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getApvform() {
		return apvform;
	}

	public void setApvform(String apvform) {
		this.apvform = apvform;
	}

	public String getApvdate() {
		return apvdate;
	}

	public void setApvdate(String apvdate) {
		this.apvdate = apvdate;
	}

	public String getApvnm() {
		return apvnm;
	}

	public void setApvnm(String apvnm) {
		this.apvnm = apvnm;
	}

	public String getForm() {
		return form;
	}

	public void setForm(String form) {
		this.form = form;
	}

	public String getDptnm() {
		return dptnm;
	}

	public String getApvsq() {
		return apvsq;
	}

	public void setApvsq(String apvsq) {
		this.apvsq = apvsq;
	}

	public void setDptnm(String dptnm) {
		this.dptnm = dptnm;
	}

	public String getStfnm() {
		return stfnm;
	}

	public void setStfnm(String stfnm) {
		this.stfnm = stfnm;
	}

	private String Title;

	public String getDIV_APV_SQ() {
		return DIV_APV_SQ;
	}

	public void setDIV_APV_SQ(String dIV_APV_SQ) {
		DIV_APV_SQ = dIV_APV_SQ;
	}

	public String getAPV_TB() {
		return APV_TB;
	}

	public void setAPV_TB(String aPV_TB) {
		APV_TB = aPV_TB;
	}

	public String getLine() {
		return line;
	}

	public void setLine(String line) {
		this.line = line;
	}

	public String getTitle() {
		return Title;
	}

	public void setTitle(String title) {
		Title = title;
	}

	public String getUsrNm() {
		return usrNm;
	}

	public void setUsrNm(String usrNm) {
		this.usrNm = usrNm;
	}

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
