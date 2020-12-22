package com.seocurity.dto;

import java.util.Date;


public class RequestDTO {
		
	String consulting_type;
	String request_id; // Request_id
	String request_subject;
	String request_name;
	String request_phone;
	String request_email;
	String request_comment;
	String request_date;
	
	
	public RequestDTO(){}
	public RequestDTO(String consulting_type, String user_id , String request_subject, String request_name, String request_phone, String request_email,
			String request_comment) {
		super();
		this.consulting_type = consulting_type;
		this.request_id = user_id;
		this.request_subject = request_subject;
		this.request_name = request_name;
		this.request_phone = request_phone;
		this.request_email = request_email;
		this.request_comment = request_comment;
		}
	
	public RequestDTO(String consulting_type, String request_id , String request_subject, String request_name, String request_phone, String request_email,
			String request_comment, String request_date) {
		super();
		this.consulting_type = consulting_type;
		this.request_id = request_id;
		this.request_subject = request_subject;
		this.request_name = request_name;
		this.request_phone = request_phone;
		this.request_email = request_email;
		this.request_comment = request_comment;
		this.request_date = request_date;
	}
	
	
	public String getConsulting_type() {
		return consulting_type;
	}
	public void setConsulting_type(String consulting_type) {
		this.consulting_type = consulting_type;
	}
	public String getRequest_id() {
		return request_id;
	}
	public void setRequest_idid(String request_id) {
		this.request_id = request_id;
	}
	public String getRequest_subject() {
		return request_subject;
	}
	public void setRequest_subject(String request_subject) {
		this.request_subject = request_subject;
	}
	public String getRequest_name() {
		return request_name;
	}
	public void setRequest_name(String request_name) {
		this.request_name = request_name;
	}
	public String getRequest_phone() {
		return request_phone;
	}
	public void setRequest_phone(String request_phone) {
		this.request_phone = request_phone;
	}
	public String getRequest_email() {
		return request_email;
	}
	public void setRequest_email(String request_email) {
		this.request_email = request_email;
	}
	public String getRequest_comment() {
		return request_comment;
	}
	public void setRequest_comment(String request_comment) {
		this.request_comment = request_comment;
	}
	public String getRequest_date() {
		return request_date;
	}
	public void setRequest_date(String request_date) {
		this.request_date = request_date;
	}
	
	
}
