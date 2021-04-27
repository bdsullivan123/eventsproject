package com.brendan.project.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.brendan.project.models.Event;

@Repository
public interface EventRepository extends CrudRepository<Event, Long> {
    // this method retrieves all the events from the database
    List<Event> findAll();
    void deleteById(Long id);
}