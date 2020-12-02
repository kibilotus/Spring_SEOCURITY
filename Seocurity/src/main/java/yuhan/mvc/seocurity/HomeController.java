package yuhan.mvc.seocurity;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "main.jsp";
	}
	
	@RequestMapping("/loginform")
    public String loginform() throws Exception {
        return "main.jsp?target=loginform";
    }

	@RequestMapping("/login")
    public String login() throws Exception {
        return "main.jsp?target=user_update&column=2";
    }
	
	@RequestMapping("/joinform")
    public String joinform() throws Exception {
        return "join_main.jsp";
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
	
}
