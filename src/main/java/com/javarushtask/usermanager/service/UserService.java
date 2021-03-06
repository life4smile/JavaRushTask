package com.javarushtask.usermanager.service;

import com.javarushtask.usermanager.model.User;

import java.util.List;

public interface UserService {
    void addUser(User user);
    void updateUser(User user);
    void deleteUser(int id);
    User getUserById(int id);
    List<User> listUsers();
    List<User> listByPage(int begin, int num);
    List<User> listByName(String name);
}
