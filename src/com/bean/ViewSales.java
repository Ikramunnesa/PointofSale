package com.bean;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedNativeQuery;
import javax.persistence.Table;

import org.hibernate.annotations.Immutable;

@Entity
@Immutable()
//@Table(name = "viewsales")
@NamedNativeQuery(name = "findUniqueCameronsInOrder", query = "select * from viewsales", resultClass = ViewSales.class)
public class ViewSales implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@Column(updatable = false, nullable = false)
	private int salesId;
	@Column(updatable = false)
	private String customerName;
	@Column(updatable = false)
	private String contact;
	@Column(updatable = false)
	private Date trunsactionDate;
	@Column(updatable = false)
	private int totalQty;
	@Column(updatable = false)
	private float paidAmount;

	public int getSalesId() {
		return salesId;
	}

	public void setSalesId(int salesId) {
		this.salesId = salesId;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public Date getTrunsactionDate() {
		return trunsactionDate;
	}

	public void setTrunsactionDate(Date trunsactionDate) {
		this.trunsactionDate = trunsactionDate;
	}

	public int getTotalQty() {
		return totalQty;
	}

	public void setTotalQty(int totalQty) {
		this.totalQty = totalQty;
	}

	public float getPaidAmount() {
		return paidAmount;
	}

	public void setPaidAmount(float paidAmount) {
		this.paidAmount = paidAmount;
	}
}
