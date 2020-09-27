package com.tdtu.stshop.service;

import com.tdtu.stshop.entity.Product;
import com.tdtu.stshop.reponsitory.ProductReponsitory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductServiceImpl implements ProductService {

    @Autowired
    private ProductReponsitory productReponsitory;

    @Override
    public List<Product> getAllProduct() {
        return productReponsitory.findAll();
    }

    @Override
    public List<Product> getByBrand(int brand) {
        return productReponsitory.findByBrand(brand);
    }
}
