package model;

public class Email {
	private Integer id;
	private String senduser;
	private String receiveuser;
	private String emailtitle;
	private String emailvalue;
	private Integer isread;
	private String time;
	private String fujian;
	private Integer isgarage;
	
	public Integer getIsgarage() {
		return isgarage;
	}
	public void setIsgarage(Integer isgarage) {
		this.isgarage = isgarage;
	}
	public String getFujian() {
		return fujian;
	}
	public void setFujian(String fujian) {
		this.fujian = fujian;
	}
	public Integer getIsread() {
		return isread;
	}
	public void setIsread(Integer isread) {
		this.isread = isread;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getSenduser() {
		return senduser;
	}
	public void setSenduser(String senduser) {
		this.senduser = senduser;
	}
	public String getReceiveuser() {
		return receiveuser;
	}
	public void setReceiveuser(String receiveuser) {
		this.receiveuser = receiveuser;
	}
	public String getEmailtitle() {
		return emailtitle;
	}
	public void setEmailtitle(String emailtitle) {
		this.emailtitle = emailtitle;
	}
	public String getEmailvalue() {
		return emailvalue;
	}
	public void setEmailvalue(String emailvalue) {
		this.emailvalue = emailvalue;
	}
	@Override
	public String toString() {
		return "Email [id=" + id + ", senduser=" + senduser + ", receiveuser=" + receiveuser + ", emailtitle="
				+ emailtitle + ", emailvalue=" + emailvalue + ", isread=" + isread + ", time=" + time + ", fujian="
				+ fujian + ", isgarage=" + isgarage + "]";
	}
	
	
}
