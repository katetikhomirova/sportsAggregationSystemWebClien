package ua.nure.tikhomirova.admin;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CountriesController {

	@RequestMapping(value = "/countries", method = RequestMethod.GET)
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
								return "admin/countries";
						}
						// return "profile";
					}
		}
		return "home";
	}
}