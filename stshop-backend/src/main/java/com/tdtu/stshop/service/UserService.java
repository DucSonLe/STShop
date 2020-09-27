package com.tdtu.stshop.service;

import com.tdtu.stshop.entity.User;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface UserService {

    List<User> findAll();
}
