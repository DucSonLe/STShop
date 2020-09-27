package com.tdtu.stshop.entity;

import net.bytebuddy.implementation.bind.annotation.Empty;

import javax.persistence.*;

@Entity
@Table(name = "product")
public class Product {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "pid")
    private int id;

    @Column(name = "pname")
    private String name;

    @Column(name = "pprice")
    private int price;

    @Column(name = "pquantity")
    private int quantity;

    @Column(name = "status", nullable = true)
    private int status;

    @Column(name = "pimage", nullable = true)
    private String image;

    @Column(name = "description", nullable = true)
    private String description;

    @Column(name = "bid")
    private int brand;

    @Column(name = "caid")
    private int category;

    public Product() {
    }

    public Product(int id, String name, int price, int quantity, int status,
                   String image, String description, int brand, int category) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.quantity = quantity;
        this.status = status;
        this.image = image;
        this.description = description;
        this.brand = brand;
        this.category = category;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getBrand() {
        return brand;
    }

    public void setBrand(int brand) {
        this.brand = brand;
    }

    public int getCategory() {
        return category;
    }

    public void setCategory(int category) {
        this.category = category;
    }
}
