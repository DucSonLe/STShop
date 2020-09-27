package com.tdtu.stshop.controller;

import com.tdtu.stshop.entity.Product;
import com.tdtu.stshop.entity.User;
import com.tdtu.stshop.service.ProductService;
import com.tdtu.stshop.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@CrossOrigin(origins = "http://localhost:3000")
@RestController
@RequestMapping("api/")
public class HomeController {

    @Autowired
    private UserService userService;

    @Autowired
    private ProductService productService;

    @GetMapping("users")
    public List<User> getUser() {
        return userService.findAll();
    }

    @GetMapping("products")
    public List<Product> getProduct() { return productService.getAllProduct(); }

    @GetMapping("products/apple")
    public List<Product> getProductByBrand() { return productService.getByBrand(1); }
}

