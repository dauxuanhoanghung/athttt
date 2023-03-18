/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.athttt.entity;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 *
 * @author LENOVO
 */
@Entity
@Table(name = "saleorderdetails")
@NamedQueries({
    @NamedQuery(name = "Saleorderdetails.findAll", query = "SELECT s FROM Saleorderdetails s"),
    @NamedQuery(name = "Saleorderdetails.findById", query = "SELECT s FROM Saleorderdetails s WHERE s.id = :id"),
    @NamedQuery(name = "Saleorderdetails.findByCode", query = "SELECT s FROM Saleorderdetails s WHERE s.code = :code"),
    @NamedQuery(name = "Saleorderdetails.findByUnitprice", query = "SELECT s FROM Saleorderdetails s WHERE s.unitprice = :unitprice"),
    @NamedQuery(name = "Saleorderdetails.findByUnitquantity", query = "SELECT s FROM Saleorderdetails s WHERE s.unitquantity = :unitquantity"),
    @NamedQuery(name = "Saleorderdetails.findByCreatedDate", query = "SELECT s FROM Saleorderdetails s WHERE s.createdDate = :createdDate"),
    })
public class Saleorderdetails implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Long id;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "code")
    private String code;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "unitprice")
    private Float unitprice;
    @Column(name = "unitquantity")
    private Integer unitquantity;
    @Column(name = "created_date")
    @Temporal(TemporalType.TIMESTAMP)
    private Date createdDate;
    @JoinColumn(name = "product_id", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Product productId;
    @JoinColumn(name = "order_id", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Saleorder orderId;

    {
    	long millis = System.currentTimeMillis();  
	    this.createdDate = new Date(millis);     
    }
    public Saleorderdetails() {
    }

    public Saleorderdetails(Long id) {
        this.id = id;
    }

    public Saleorderdetails(Long id, String code) {
        this.id = id;
        this.code = code;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public Float getUnitprice() {
        return unitprice;
    }

    public void setUnitprice(Float unitprice) {
        this.unitprice = unitprice;
    }

    public Integer getUnitquantity() {
        return unitquantity;
    }

    public void setUnitquantity(Integer unitquantity) {
        this.unitquantity = unitquantity;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    

    public Product getProductId() {
        return productId;
    }

    public void setProductId(Product productId) {
        this.productId = productId;
    }

    public Saleorder getOrderId() {
        return orderId;
    }

    public void setOrderId(Saleorder orderId) {
        this.orderId = orderId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Saleorderdetails)) {
            return false;
        }
        Saleorderdetails other = (Saleorderdetails) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.athttt.entity.Saleorderdetails[ id=" + id + " ]";
    }
    
}
