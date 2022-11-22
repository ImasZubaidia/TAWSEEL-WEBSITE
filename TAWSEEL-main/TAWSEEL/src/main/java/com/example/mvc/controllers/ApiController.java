package com.example.mvc.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.mvc.models.Customer;
import com.example.mvc.models.Item;
import com.example.mvc.models.Order;
import com.example.mvc.models.Restaurant;
import com.example.mvc.services.CustomerService;
import com.example.mvc.services.RestaurantService;

@RestController
public class ApiController {
	@Autowired
	private RestaurantService resServ;
	@Autowired
	CustomerService CustomerServ;
@GetMapping("/dashboard")
	public List<Restaurant> home (@RequestParam("city") String city,@RequestParam("food") String food,Model model )
	{
	  if(city.equals("0")&& food.equals("0")) {
//		  System.out.print(resServ.allRes());
		  return resServ.allRes();
	  }
	  else if(city.equals("0")) {
		  return resServ.filterByfoodType(food);
	  }
	  else if(food.equals("0")) {
		  return resServ.filterByCity(city);
	  }
	  else {
		  System.out.print(resServ.allRes());
		  return resServ.filter(city, food);
		  
	  }
	}
//@GetMapping("/restaurant/{id}")
//public List<Item> res(@PathVariable("id") Long id,HttpSession sisson,Model model) {
//	Restaurant restaurant=resServ.findRestaurant(id);
//	
//	return restaurant.getItem();
//	
//}
@GetMapping("/order/{id}")
public Order order(@PathVariable("id") Long id,HttpSession sisson,Model model) {
	Customer customor=CustomerServ.findCustomerById(id);
	System.out.print(customor.getOrder().get(customor.getOrder().size()-1));
	Order order= customor.getOrder().get(customor.getOrder().size()-1);
	return order;
			
	
	
	
}

}

