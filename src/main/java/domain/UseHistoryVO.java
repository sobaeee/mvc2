package domain;

import java.io.Serializable;
import java.util.Date;

public class UseHistoryVO implements Serializable {
	//Serializable 객체 직렬화(한 줄로 쭉 세워둠)
	
	
	private int num;
	private String uid;
	private String status;
	private String start;
	private String end;
	
	private Date bpdate; //Date는 java.util로.

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getStart() {
		return start;
	}

	public void setStart(String start) {
		this.start = start;
	}

	public String getEnd() {
		return end;
	}

	public void setEnd(String end) {
		this.end = end;
	}

	public Date getBpdate() {
		return bpdate;
	}

	public void setBpdate(Date bpdate) {
		this.bpdate = bpdate;
	}
	
	
}
