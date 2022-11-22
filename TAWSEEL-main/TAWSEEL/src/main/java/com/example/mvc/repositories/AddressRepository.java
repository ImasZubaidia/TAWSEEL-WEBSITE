package com.example.mvc.repositories;

import org.springframework.data.repository.CrudRepository;

import com.example.mvc.models.Address;

public interface AddressRepository extends CrudRepository<Address, Long> {

}
