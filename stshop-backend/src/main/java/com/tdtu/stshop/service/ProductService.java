package com.tdtu.stshop.service;

import com.tdtu.stshop.entity.Product;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface ProductService {
    List<Product> getAllProduct();
    List<Product> getByBrand(int brand);
}
