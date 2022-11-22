package com.example.mvc.models;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="orders")
public class Order {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	@OneToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="Adress_id")
	private Address address;
	 @ManyToOne(fetch = FetchType.LAZY)
	    @JoinColumn(name="customer_id")
	    private Customer customer;
	  @ManyToMany(fetch = FetchType.LAZY)
	    @JoinTable(
	        name = "items_orders", 
	        joinColumns = @JoinColumn(name = "order_id"), 
	        inverseJoinColumns = @JoinColumn(name = "item_id")
	    )
	    private List<Item> item;
	  @Column(updatable = false)
		@DateTimeFormat(pattern = "yyyy-MM-DD','HH:mm")
		private Date createdAt;

		@DateTimeFormat(pattern = "yyyy-MM-DD','HH:mm")
		private Date updatedAt;
	  
	public Order() {
	
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Address getAddress() {
		return address;
	}
	public void setAddress(Address address) {
		this.address = address;
	}
	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	public List<Item> getItem() {
		return item;
	}
	public void setItem(List<Item> item) {
		this.item = item;
	}
	@PrePersist
	public void setCreatedAt() {
		this.createdAt = new Date();
	}

	public Date getUpdatedAt() {
		return updatedAt;
	}
	@PreUpdate
	public void setUpdatedAt() {
		this.updatedAt = new Date();
	}
}
