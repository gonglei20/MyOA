package model;

import java.util.Date;

public class Leave {
	private Integer id;
	private String username;
	private String starttime;
	private String endtime;
	private Integer day;
	private Integer status;
	private String reason;
	private String checkman;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getStarttime() {
		return starttime;
	}
	public void setStarttime(String starttime) {
		this.starttime = starttime;
	}
	public String getEndtime() {
		return endtime;
	}
	public void setEndtime(String endtime) {
		this.endtime = endtime;
	}
	public Integer getDay() {
		return day;
	}
	public void setDay(Integer day) {
		this.day = day;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public String getCheckman() {
		return checkman;
	}
	public void setCheckman(String checkman) {
		this.checkman = checkman;
	}
	@Override
	public String toString() {
		return "Leave [id=" + id + ", username=" + username + ", starttime=" + starttime + ", endtime=" + endtime
				+ ", day=" + day + ", status=" + status + ", reason=" + reason + ", checkman=" + checkman + "]";
	}
	
	
	
}
