package co.grandcircus.TutorApp2019.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {
	
	@Value("${map.key}")
	private String mapKey;
	
	@RequestMapping("/")
	public ModelAndView homepage() {
		ModelAndView mv = new ModelAndView("index");
		mv.addObject("mapKey", mapKey);
		return mv;
	}

}
