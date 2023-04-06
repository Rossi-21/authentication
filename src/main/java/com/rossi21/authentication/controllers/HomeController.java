package com.rossi21.authentication.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.rossi21.authentication.models.LoginUser;
import com.rossi21.authentication.models.User;
import com.rossi21.authentication.services.UserService;

@Controller
public class HomeController {

	// Add once service is implemented:
    @Autowired
    private UserService userServ;
    
    @GetMapping("/")
    public String index(Model model) {
    
        // Bind empty User and LoginUser objects to the JSP
        // to capture the form input
        model.addAttribute("newUser", new User());
        model.addAttribute("newLogin", new LoginUser());
        return "login.jsp";
    }
    
    @PostMapping("/register")
    public String register(@Valid @ModelAttribute("newUser") User newUser, 
            BindingResult result, Model model, HttpSession session) {
      
        // TO-DO Later -- call a register method in the service 
    	userServ.register(newUser, result);
        // to do some extra validations and create a new user!
        
        if(result.hasErrors()) {
            // Be sure to send in the empty LoginUser before 
            // re-rendering the page.
            model.addAttribute("newLogin", new LoginUser());
            return "login.jsp";
        }
        // No errors! 
        // TO-DO Later: Store their ID from the DB in session, 
        // in other words, log them in.
        User createdUser = userServ.create(newUser);
        session.setAttribute("userId", createdUser.getId());
        return "redirect:/home";
    }
    
    @PostMapping("/login")
    public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, 
		BindingResult result, Model model, HttpSession session) {
        // Add once service is implemented:
        User user = userServ.login(newLogin, result);
        if (user == null) {
        	model.addAttribute("newUser", new User());
        	return "login.jsp";
        }
        session.setAttribute("userId", user.getId());
        return "redirect:/home";
    }
    @GetMapping("/home")
    public String home(Model model, HttpSession session) {
    	if (session.getAttribute("userId") == null) {
    		return "redirect:/";
    	}
    	Long userId = (Long)session.getAttribute("userId");
    	model.addAttribute("user", userServ.getOneById(userId));
    	return "home.jsp";
    }
    
    @GetMapping("/logout")
    public String logout(HttpSession session) {
    	session.removeAttribute("userId");
    	return "redirect:/";
    }
    
}