package com.example.mvc.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.mvc.models.Address;
import com.example.mvc.models.Item;
import com.example.mvc.models.Order;
import com.example.mvc.models.Restaurant;
import com.example.mvc.repositories.AddressRepository;
import com.example.mvc.repositories.ItemRepository;
import com.example.mvc.repositories.OrderRepository;
import com.example.mvc.repositories.RestaurantRepository;




@Service
public class RestaurantService {
@Autowired 
private RestaurantRepository restaurantRepo;
@Autowired 
private OrderRepository orderRepo;
@Autowired 
private ItemRepository ItemRepo;
@Autowired 
private AddressRepository addressRepo;
public List<Restaurant> allRes() {
	return restaurantRepo.findAll();
}
public Restaurant findRestaurant(Long id) {
	return restaurantRepo.findById(id).get();
}
public List<Restaurant> filterByfoodType(String str) {
	return restaurantRepo.findByfoodType(str);
}
public List<Restaurant> filterByCity(String str) {
	return restaurantRepo.filterbycity(str);
}
public List<Restaurant> filter(String ciy,String fo){
	return restaurantRepo.filter(ciy, fo);
}

public Order findOrder(Long id) {
	Optional<Order> order=orderRepo.findById(id);
	if( order.get()!=null) {
		return order.get();
		
	}
	else {
		return null;
	}
}
public Item findItem(Long id) {
	Optional<Item> order=ItemRepo.findById(id);
	if( order.get()!=null) {
		return order.get();
		
	}
	else {
		return null;
	}
}
public Order createOrder(Order order) {
	return orderRepo.save(order);
}
public Address createAddress(Address address) {
	return addressRepo.save(address);
}
public List<Order> getAllOrders(){
	return orderRepo.findAll();
}
public void cancelOrder(Long orderid) {
	orderRepo.deleteById(orderid);
}
public void deleteRest(Long resid) {
	restaurantRepo.deleteById(resid);
}
}
