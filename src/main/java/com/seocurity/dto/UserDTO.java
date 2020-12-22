package com.seocurity.dto;

public class UserDTO {
	
	String user_id;
	String user_pwd;
	String user_name;
	String user_agency;
	String user_phone;
	String user_birth;
	String user_calendar;
	String user_addrnum;
	String user_address;
	String user_email;
	String mail_check;
	String sms_check;
	
	
	public UserDTO() {

	}

	public UserDTO(String user_id, String user_pwd, String user_name, String user_agency, String user_phone,
			String user_birth, String user_calendar, String user_addrnum, String user_address, String user_email,
			String mail_check, String sms_check) {
		super();
		this.user_id = user_id;
		this.user_pwd = user_pwd;
		this.user_name = user_name;
		this.user_agency = user_agency;
		this.user_phone = user_phone;
		this.user_birth = user_birth;
		this.user_calendar = user_calendar;
		this.user_addrnum = user_addrnum;
		this.user_address = user_address;
		this.user_email = user_email;
		this.mail_check = mail_check;
		this.sms_check = sms_check;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pwd() {
		return user_pwd;
	}
	public void setUser_pwd(String user_pwd) {
		this.user_pwd = user_pwd;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_agency() {
		return user_agency;
	}
	public void setUser_agency(String user_agency) {
		this.user_agency = user_agency;
	}
	public String getUser_phone() {
		return user_phone;
	}
	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}
	public String getUser_birth() {
		return user_birth;
	}
	public void setUser_birth(String user_birth) {
		this.user_birth = user_birth;
	}
	public String getUser_calendar() {
		return user_calendar;
	}
	public void setUser_calendar(String user_calendar) {
		this.user_calendar = user_calendar;
	}
	public String getUser_addrnum() {
		return user_addrnum;
	}
	public void setUser_addrnum(String user_addrnum) {
		this.user_addrnum = user_addrnum;
	}
	public String getUser_address() {
		return user_address;
	}
	public void setUser_address(String user_address) {
		this.user_address = user_address;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getMail_check() {
		return mail_check;
	}
	public void setMail_check(String mail_check) {
		this.mail_check = mail_check;
	}
	public String getSms_check() {
		return sms_check;
	}
	public void setSms_check(String sms_check) {
		this.sms_check = sms_check;
	}
	
	

}
