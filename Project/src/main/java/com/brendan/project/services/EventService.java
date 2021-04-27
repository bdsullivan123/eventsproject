package com.brendan.project.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.brendan.project.models.Event;
import com.brendan.project.repositories.EventRepository;

@Service
public class EventService {
	//adding the repository as a dependency
    private final EventRepository eventRepository;
    
    public EventService(EventRepository eventRepository) {
        this.eventRepository = eventRepository;
    }
    // returns all the events
    public List<Event> allEvents() {
        return eventRepository.findAll();
    }
    // creates an event
    public Event createEvent(Event e) {
        return eventRepository.save(e);
    }
    // find event by id
    public Event findEventById(Long id) {
    	Optional<Event> event = eventRepository.findById(id);
    	if(event.isPresent()) {
            return event.get();
    	} else {
    	    return null;
    	}
    }
    // updates a event
    public Event updateEvent(Event e) {
    	return eventRepository.save(e);
    }
    
    // deletes an event
    public void delEvent(Long id) {
    	eventRepository.deleteById(id);
    }
}
