package com.example.mvc.services;

import java.util.ArrayList;
import java.util.List;


import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.example.mvc.models.Customer;
import com.example.mvc.models.Role;
import com.example.mvc.repositories.CustomerRepository;

@Service
public class UserDetailsServiceImplementation implements UserDetailsService {
    private CustomerRepository userRepository;
    
    public UserDetailsServiceImplementation(CustomerRepository userRepository){
        this.userRepository = userRepository;
    }
    // 1
    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        Customer customer = userRepository.findByUsername(email);
        
        if(customer == null) {
            throw new UsernameNotFoundException("User not found");
        }
        
        return new org.springframework.security.core.userdetails.User(customer.getUsername(), customer.getPassword(), getAuthorities(customer));
    }
    
    // 2
    private List<GrantedAuthority> getAuthorities(Customer user){
        List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
        for(Role role : user.getRoles()) {
            GrantedAuthority grantedAuthority = new SimpleGrantedAuthority(role.getName());
            authorities.add(grantedAuthority);
        }
        return authorities;
    }
}