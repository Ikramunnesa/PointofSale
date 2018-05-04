package com.bean;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Sales {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int salesId;
	@Column(unique=false)
	private int customerId;
	private int totalQty;
	private Date trunsactionDate;
	private float paidAmount;
	public int getSalesId() {
		return salesId;
	}
	public void setSalesId(int salesId) {
		this.salesId = salesId;
	}/*
	public String getCustomerName() {
		return customerName;
	}
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}*/
	
	public int getTotalQty() {
		return totalQty;
	}
	public int getCustomerId() {
		return customerId;
	}
	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}
	public void setTotalQty(int totalQty) {
		this.totalQty = totalQty;
	}
	public Date getTrunsactionDate() {
		return trunsactionDate;
	}
	public void setTrunsactionDate(Date trunsactionDate) {
		this.trunsactionDate = trunsactionDate;
	}
	public float getPaidAmount() {
		return paidAmount;
	}
	public void setPaidAmount(float paidAmount) {
		this.paidAmount = paidAmount;
	}

}
