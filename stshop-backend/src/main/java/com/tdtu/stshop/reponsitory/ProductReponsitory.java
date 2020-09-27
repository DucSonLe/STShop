package com.tdtu.stshop.reponsitory;

import com.tdtu.stshop.entity.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductReponsitory extends JpaRepository<Product, Integer> {
    List<Product> findByBrand(int brand);
}
