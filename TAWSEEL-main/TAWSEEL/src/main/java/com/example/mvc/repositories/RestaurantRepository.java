package com.example.mvc.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.example.mvc.models.Restaurant;
@Repository
public interface RestaurantRepository  extends CrudRepository<Restaurant,Long> {
public List <Restaurant> findAll();
public List <Restaurant> findByfoodType(String string);
@Query(value="select * from restaurants As A join addresses AS B on B.id=A.Adress_id where B.city=?1 and A.food_type=?2 ", nativeQuery=true)
List<Restaurant> filter(String cit, String foo);
@Query(value="select * from restaurants As A  join addresses AS B on B.id=A.Adress_id where B.city=?1  ", nativeQuery=true)
List<Restaurant> filterbycity(String cit);


}
