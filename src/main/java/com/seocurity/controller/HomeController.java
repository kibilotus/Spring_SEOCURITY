package com.seocurity.controller;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.seocurity.dao.RequestDAO;
import com.seocurity.dao.UserDAO;
import com.seocurity.dto.RequestDTO;
import com.seocurity.dto.UserDTO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		return "main";
	}
	
	@RequestMapping(value="/view" ,method = RequestMethod.GET)
    public String view() throws Exception {
        return "main.jsp?target=loginform";
    }
	
	@RequestMapping("/loginform")
    public String loginform() throws Exception {
        return "main.jsp?target=loginform";
    }
	
	@RequestMapping("/logout")
    public String logout() throws Exception {
        return "logout";
    }

	@RequestMapping("/login")
    public String login(
    		@RequestParam String id, 
    		@RequestParam String pwd,
    		 Model model) throws Exception {
		UserDAO dao=new UserDAO();
		UserDTO dto=new UserDTO();
		dto.setUser_id(id);
		dto.setUser_pwd(pwd);
		String result=dao.Login(dto);
		if(result.equals("login")) {
			model.addAttribute("id",id);
			model.addAttribute("messege", "login");
		}
		else {
			model.addAttribute("messege", "fail");
		}
		
        return "/login";
    }
	
	@RequestMapping(value = "/user_update", method = RequestMethod.GET)
    public String modifyform(@RequestParam String id, Model model) throws Exception {
		UserDAO dao= new UserDAO();
		UserDTO dto = new UserDTO();
		ArrayList<String> list = dao.ModSelect(id);
		
		model.addAttribute("id", list.get(0));
		model.addAttribute("pwd", list.get(1));
		model.addAttribute("name", list.get(2));
		model.addAttribute("phone", list.get(3));
		model.addAttribute("agency", list.get(4));
		model.addAttribute("addrnum", list.get(5));
		model.addAttribute("address", list.get(6));
		model.addAttribute("email", list.get(7));
		model.addAttribute("mailcheck", list.get(8));
		model.addAttribute("smscheck", list.get(9));
		
	    return "main.jsp?target=user_update";
    }
	
	@RequestMapping("/user_updateinsert")
		public String user_update(
		 @RequestParam String user_id,
		 @RequestParam String user_pwd,
		 @RequestParam String user_name,
		 @RequestParam String phone_agency,
		 @RequestParam String user_phone,
		 @RequestParam String user_addrnum,
		 @RequestParam String user_address,
		 @RequestParam String user_email,
		 @RequestParam String mail_check,
		 @RequestParam String sms_check,
		 
		 Model model
		
		) throws Exception {
		UserDAO dao = new UserDAO();
		UserDTO dto = new UserDTO(user_id, user_pwd, user_name, phone_agency, user_phone, "", "", user_addrnum, user_address, user_email, mail_check, sms_check);
		dao.ModUpdate(dto);
		System.out.println("실행 중");
		
		return "user_updateinsert";
		
	}
	
	@RequestMapping("/joinform")
    public String joinform() throws Exception {
        return "join_main";
    }
	
	
	@RequestMapping("/join_insert")
    public String joininsert(
    		 @RequestParam String user_id,
			 @RequestParam String user_pwd,
			 @RequestParam String user_name,
			 @RequestParam String phone_agency,
			 @RequestParam String phone1,
			 @RequestParam String phone2,
			 @RequestParam String phone3,
			 @RequestParam String year,
			 @RequestParam String month,
			 @RequestParam String date,
			 @RequestParam String user_calendar,
			 @RequestParam String user_addrnum,
			 @RequestParam String user_address,
			 @RequestParam String user_email,
			 @RequestParam String mail_check,
			 @RequestParam String sms_check,
			 
    
			 Model model
    		
    		) throws Exception {
		
		UserDAO dao=new UserDAO();
		String user_phone=phone1+"-"+phone2+"-"+phone3;
		String user_birth = year + "/" + month + "/" + date;
		UserDTO dto=new UserDTO(user_id, user_pwd, user_name, phone_agency, user_phone, user_birth, user_calendar, user_addrnum, user_address, user_email, mail_check, sms_check);
		dao.Join(dto);
		
		
        return "/join_insert";
    }
	
	
	@RequestMapping(value= "/request_insert",method = RequestMethod.POST) 
    public String requestinsert(
    		 @RequestParam String consulting_type ,
			 @RequestParam String user_id ,
			 @RequestParam String request_subject ,
			 @RequestParam String request_name ,
			 @RequestParam String request_phone ,
			 @RequestParam String request_email ,
			 @RequestParam String request_comment ,    
			 Model model    		
    		) throws Exception {	
		
		System.out.println("request:"+request_subject);
		System.out.println("request:"+request_comment);
		
		
		RequestDAO dao=new RequestDAO();
		RequestDTO dto=new RequestDTO(consulting_type, user_id, request_subject, request_name, request_phone, request_email, request_comment);
		dao.Request(dto);
		
		
        return "/request_insert";
    }
	
	@RequestMapping(value= "/request_update",method = RequestMethod.POST) 
    public String requestUpdate(
    		 @RequestParam String consulting_type ,
			 @RequestParam String user_id ,
			 @RequestParam String request_subject ,
			 @RequestParam String request_name ,
			 @RequestParam String request_phone ,
			 @RequestParam String request_email ,
			 @RequestParam String request_comment ,    
			 Model model    		
    		) throws Exception {		

		RequestDAO dao=new RequestDAO();
		RequestDTO dto=new RequestDTO(consulting_type, user_id, request_subject, request_name, request_phone, request_email, request_comment);
		dao.Request_Update(dto);
		
		
        return "/request_update";
    }
	
	
	@RequestMapping("/consulting_main")
    public String consulting_main() throws Exception {
        return "main.jsp?target=consulting_main";
    }

	@RequestMapping("/consulting_request")
    public String consulting_request() throws Exception {
        return "main.jsp?target=consulting_request";
    }

	@RequestMapping("/consulting_sub1")
    public String consulting_sub1() throws Exception {
        return "main.jsp?target=consulting_sub1";
    }

	@RequestMapping("/consulting_sub2")
    public String consulting_sub2() throws Exception {
        return "main.jsp?target=consulting_sub2";
    }
	
	@RequestMapping("/consulting_sub3")
    public String consulting_sub3() throws Exception {
        return "main.jsp?target=consulting_sub3";
    }

	@RequestMapping("/consulting_sub4")
    public String consulting_sub4() throws Exception {
        return "main.jsp?target=consulting_sub4";
    }
	
	@RequestMapping("/consulting_manager")
    public String consulting_manager() throws Exception {
        return "main.jsp?target=consulting_manager";
    }
	
	@RequestMapping("/request_check")
    public String request_check() throws Exception {
        return "main.jsp?target=request_check";
    }
	
	@RequestMapping("/user_update")
    public String user_update() throws Exception {
        return "main.jsp?target=user_update";
    }
}
