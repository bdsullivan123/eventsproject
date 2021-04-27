package com.brendan.project.controllers;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.brendan.project.models.Event;
import com.brendan.project.models.User;
import com.brendan.project.services.EventService;
import com.brendan.project.services.UserService;
import com.brendan.project.validator.UserValidator;

@Controller
public class UserControl {
	
	private final UserService userService;
	
	private final EventService eventService;
	
    private final UserValidator userValidator;

    public UserControl(UserService userService, UserValidator userValidator, EventService eventService) {
        this.userService = userService;
        this.userValidator = userValidator;
        this.eventService = eventService;
    }
    
	ArrayList<String> states = new ArrayList<String>(Arrays.asList("AL", "AK", "AZ", "AR", "CA", "CO", "CT",
			"DE", "FL", "GA", "HI", "ID", "IL", "IN", "IA", "KS", "KY", "LA", "ME", "MD", "MA", "MI", "MN",
			"MS", "MO", "MT", "NE", "NV", "NH", "NJ", "NM", "NY", "NC", "ND", "OH", "OK", "OR", "PA", "RI",
			"SC", "SD", "TN", "TX", "UT", "VT", "VA", "WA", "WV", "WI", "WY"));
    
    @RequestMapping("/")
    public String login(@ModelAttribute("user") User user, Model model) {
		model.addAttribute("states", states);
        return "index.jsp";
    }
    
    @RequestMapping(value="/registration", method=RequestMethod.POST)
    public String registerUser(@Valid @ModelAttribute("user") User user, BindingResult result, HttpSession session) {
        userValidator.validate(user, result);
    	if(result.hasErrors()) {
    		return "index.jsp";
    	} else {
    		userService.registerUser(user);
    		session.setAttribute("userId", user.getId());
            return "redirect:/events";
    	}
    }
    
    @RequestMapping(value="/login", method=RequestMethod.POST)
    public String loginUser(@ModelAttribute("user") User user, @RequestParam("email") String email, @RequestParam("password") String password, Model model, HttpSession session) {
		boolean authenticated = userService.authenticateUser(email, password);
    	if(authenticated) {
			user = userService.findByEmail(email);
			session.setAttribute("userId", user.getId());
			return "redirect:/events";
    	} else {
			model.addAttribute("error", "Invalid username/password. Please try again.");
			return "index.jsp";	
    	}
    }
    
    @RequestMapping("/events")
    public String dashboard(@ModelAttribute("user") User user, HttpSession session, Model model) {
		Long userId = (Long) session.getAttribute("userId");
		if (userId != null) {
			List<Event> events = eventService.allEvents();
			user = userService.findUserById(userId);
			model.addAttribute("events", events);
			model.addAttribute("user", user);
			List<Event> instate = new ArrayList<Event>();
			List<Event> outofstate = new ArrayList<Event>();
			for(Event unicorn: events) {
				if(unicorn.getState().equals(user.getState())) {
					instate.add(unicorn);
				} else {
					outofstate.add(unicorn);
				}
			}
			model.addAttribute("instate", instate);
			model.addAttribute("outofstate", outofstate);
			return "dashboard.jsp";
		} else {
			return "redirect:/";
		}    
	}
    
    @RequestMapping("/events/new")
    public String newEvent(@ModelAttribute("event") Event event, User user, Model model, HttpSession session) {
		if (session.getAttribute("userId") == null) {
			return "redirect:/";
		}
		Long userId = (Long) session.getAttribute("userId");
		user = userService.findUserById(userId);
		model.addAttribute("user", user);
		model.addAttribute("states", states);
    	return "newEvent.jsp";
    }
    
    @RequestMapping(value="/newEvent", method=RequestMethod.POST)
    public String createTask(@Valid @ModelAttribute("event") Event event, BindingResult result, Model model, HttpSession session) {
        if (result.hasErrors()) {
    		Long userId = (Long) session.getAttribute("userId");
    		User user = userService.findUserById(userId);
    		model.addAttribute("user", user);
            return "new.jsp";
        } else {
        	eventService.createEvent(event);
            return "redirect:/events";
        }
    }
    
	@RequestMapping("/events/{id}/join")
	public String joinEvent(@PathVariable("id") Long id, HttpSession session) {
		User user = userService.findUserById((Long) session.getAttribute("userId"));
		Event event = eventService.findEventById(id);
		List<User> attendees = event.getJoinedUsers();
		attendees.add(user);
		event.setJoinedUsers(attendees);
		userService.updateUser(user);	
		return "redirect:/events";
	}
	
    @RequestMapping("/events/{id}/cancel")
    public String cancelEvent(@PathVariable("id") Long id, HttpSession session) {
    	User user = userService.findUserById((Long) session.getAttribute("userId"));
		Event event = eventService.findEventById(id);
    	List<User> attendees = event.getJoinedUsers();
        for(int i=0; i<attendees.size(); i++) {
            if(attendees.get(i).getId() == user.getId()) {
            	attendees.remove(i);
            }
        }
        event.setJoinedUsers(attendees);
        userService.updateUser(user);
    	return "redirect:/events";
    }
    
    @RequestMapping("/logout")
    public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
    }
}
