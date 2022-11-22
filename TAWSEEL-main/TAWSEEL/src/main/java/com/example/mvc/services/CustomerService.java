package com.example.mvc.services;

import java.util.List;
import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.example.mvc.models.Customer;

import com.example.mvc.repositories.CustomerRepository;
import com.example.mvc.repositories.RoleRepository;

@Service
public class CustomerService {
	@Autowired
	CustomerRepository customerRepo;
	@Autowired
	 RoleRepository roleRepository;
	@Autowired
	  BCryptPasswordEncoder bCryptPasswordEncoder;
	
	// Input: none
	// Output : List of customers
	// Description: returns all customers from database
	public List<Customer> getAllCustomers(){
		return customerRepo.findAll();
	}
	// Input: customer id 
	// Output: Customer object
	// Description: returns customer object from database if available 
	// and returns null if not
	public Customer findCustomerById(Long customerid) {
		Optional<Customer> customer = customerRepo.findById(customerid);
		if (customer.isPresent()) {
			return customer.get();
		}
		else {
			return null;
		}
	}
	// Input: customer id 
	// Output: Customer object
	// Description: searches for customer by given email as string 
	// and returns null if not available
	public Customer findCustomerByEmail(String email) {
		Customer customer = customerRepo.findByEmail(email);
		
			return customer;
		
	}
	public Customer findCustomerbyname(String user) {
		Customer customer = customerRepo.findByUsername(user);
			if(customer!=null) {
			return customer;}
			else {
				return null;
			}
		
	}
	// Registration service
	// Input: Filled customer object, errors 
	// Output: Customer object with hashed PW
	// Description: accepts customer object and result which might have errors
	// return the errors if any, hash the password, saves this filled customer
	// to db then return it.
//    public Customer register(Customer newCustomer, BindingResult result) {
//        Optional<Customer> customerIfFound = customerRepo.findByEmail(newCustomer.getEmail());
//    	if (customerIfFound.isPresent()) {
//    		result.rejectValue("email", "Matches", "Email already exists!");
//    	}
//        if (!newCustomer.getPassword().equals(newCustomer.getConfirm())) {
//        	result.rejectValue("confirm", "Matches", "Password does not match");
//        }
//        if (result.hasErrors()) {
//        	return null;
//        }
//        else {
//        	String hashedPW = BCrypt.hashpw(newCustomer.getPassword(), BCrypt.gensalt());
//        	newCustomer.setPassword(hashedPW);
//        	customerRepo.save(newCustomer);
//        	return newCustomer;
//        }
//    }
//    // Login service
//    // Input: filled CustomerLogin object
//    // Output: Customer Object
//    // Description: accepts customerLogin object and result which might have errors
//    // return if any errors like having wrong emails and returns Customer object
//    public Customer login(CustomerLogin customerLogin, BindingResult result) {
//    	if (result.hasErrors()) {
//    		return null;
//    	}
    	
//        Optional<Customer> customerIfFound = customerRepo.findByEmail(customerLogin.getEmail());
//        if (!customerIfFound.isPresent()) {
//        	result.rejectValue("email", "Matches", "email is not found!");
//        	
//        	return null;
//        }
//        
//        if (!BCrypt.checkpw(customerLogin.getPassword(), customerIfFound.get().getPassword())) {
//        	result.rejectValue("password", "Matches", "Invalid Password!");
//        }
//        if (result.hasErrors()) {
//        	return null;
//        }
//        else {
//        	return customerIfFound.get();
//        }
//    }
	   public void saveWithUserRole(Customer customer) {
	        customer.setPassword(bCryptPasswordEncoder.encode(customer.getPassword()));
	        customer.setRoles(roleRepository.findByName("ROLE_USER"));
	        customerRepo.save(customer);
	    }
	     
	     // 2 
	    public void saveUserWithAdminRole(Customer user) {
	        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
	        user.setRoles(roleRepository.findByName("ROLE_ADMIN"));
	        customerRepo.save(user);
	    }    
	    
	    // 3
	    public Customer findByEmail(String email) {
	        return customerRepo.findByEmail(email);
	    }
	}

