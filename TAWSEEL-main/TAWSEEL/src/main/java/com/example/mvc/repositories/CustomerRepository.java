package com.example.mvc.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.example.mvc.models.Customer;

@Repository
public interface CustomerRepository extends CrudRepository<Customer,Long> {
	List<Customer> findAll();
	Customer findByEmail(String email);
	Customer findByUsername(String user);
}
