package com.brendan.project.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.brendan.project.models.Message;
import com.brendan.project.repositories.MessageRepository;

@Service
public class MessageService {
	//adding the repository as a dependency
    private final MessageRepository messageRepository;
    
    public MessageService(MessageRepository messageRepository) {
        this.messageRepository = messageRepository;
    }
    // returns all the messages
    public List<Message> allMessages() {
        return messageRepository.findAll();
    }
    // creates a message
    public Message createMessage(Message m) {
        return messageRepository.save(m);
    }
    // retrieves a message
    public Message findMessage(Long id) {
        Optional<Message> optionalMessage = messageRepository.findById(id);
        if(optionalMessage.isPresent()) {
            return optionalMessage.get();
        } else {
            return null;
        }
    }
    // updates a message
    public Message updateMessage(Message m) {
    	return messageRepository.save(m);
    }
    // deletes a message
    public void delMessage(Long id) {
    	messageRepository.deleteById(id);
    }
}