package com.example.mvc.models;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;
@Entity
@Table(name="addresses")
public class Address {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@NotNull(message="City can't be null")
	@Size(min=3,max=100,message="City has to be 3 characters minimum")
	private String city;
	@Size(min=3,max=100,message="street has to be 3 characters minimum")
	@NotNull(message="street can't be empty")
	private String street;
	@Size(min=3,max=100,message="building has to be 3 characters minimum")
	@NotNull(message="building can't be empty")
	private String building;
	@Min(value=1,message="please enter a valid number")
    private Integer floor;
	@Min(value=1,message="please enter a valid number")
    private Integer departmentNo;
	@Column(updatable = false)
	@DateTimeFormat(pattern = "yyyy-MM-DD','HH:mm")
	private Date createdAt;

	@DateTimeFormat(pattern = "yyyy-MM-DD','HH:mm")
	private Date updatedAt;
	@OneToOne(mappedBy="address", cascade=CascadeType.ALL, fetch=FetchType.LAZY)
	private Restaurant restaurant;
	
	@OneToOne(mappedBy="address", cascade=CascadeType.ALL, fetch=FetchType.LAZY)
	private Customer customer;
	@OneToOne(mappedBy="address", cascade=CascadeType.ALL, fetch=FetchType.LAZY)
	private Order order;

	public Address() {
	
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getStreet() {
		return street;
	}

	public void setStreet(String street) {
		this.street = street;
	}

	public String getBuilding() {
		return building;
	}

	public void setBuilding(String building) {
		this.building = building;
	}

	public Integer getFloor() {
		return floor;
	}

	public void setFloor(Integer floor) {
		this.floor = floor;
	}

	public Integer getDepartmentNo() {
		return departmentNo;
	}

	public void setDepartmentNo(Integer departmentNo) {
		this.departmentNo = departmentNo;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	

	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}

	public Restaurant getRestaurant() {
		return restaurant;
	}

	public void setRestaurant(Restaurant restaurant) {
		this.restaurant = restaurant;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
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
	

