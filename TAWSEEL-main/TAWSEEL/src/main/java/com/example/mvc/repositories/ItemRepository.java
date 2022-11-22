package com.example.mvc.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.example.mvc.models.Item;
@Repository
public interface ItemRepository extends CrudRepository<Item, Long> {

}
