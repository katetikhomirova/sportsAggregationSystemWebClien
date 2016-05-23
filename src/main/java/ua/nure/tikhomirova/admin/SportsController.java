package ua.nure.tikhomirova.admin;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class SportsController {

	@RequestMapping(value = "/sports", method = RequestMethod.GET)
	public String sports(HttpServletRequest request, Model model) {
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie c : cookies)
				if (c.getName().equals("role"))
					if (c.getValue().equals(""))
						return "home";
					else {
						switch (c.getValue()) {
							case "1" :
								return "admin/sports";
						}
						// return "profile";
					}
		}
		return "home";
	}
	
	@RequestMapping(value = "/sportCategories", method = RequestMethod.GET)
	public String sportCategories(HttpServletRequest request, Model model) {
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie c : cookies)
				if (c.getName().equals("role"))
					if (c.getValue().equals(""))
						return "home";
					else {
						switch (c.getValue()) {
							case "1" :
								return "admin/sportCategories";
						}
						// return "profile";
					}
		}
		return "home";
	}
}
