package com.example.mvc.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.example.mvc.models.Order;
@Repository
public interface OrderRepository extends CrudRepository<Order, Long> {
public List<Order> findAll();
}
