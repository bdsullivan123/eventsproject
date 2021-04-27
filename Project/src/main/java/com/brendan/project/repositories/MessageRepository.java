package com.brendan.project.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.brendan.project.models.Message;

@Repository
public interface MessageRepository extends CrudRepository<Message, Long> {
    // this method retrieves all the messages from the database
    List<Message> findAll();
    void deleteById(Long id);
}