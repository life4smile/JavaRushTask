package com.javarushtask.usermanager.controller;

import com.javarushtask.usermanager.model.User;
import com.javarushtask.usermanager.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class UserController
{
    private UserService userService;
    private int pageSize = 5;
    private static int countOfPages = 0;

    @Autowired(required = true)
    @Qualifier(value = "userService")
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping(value = "users", method = RequestMethod.GET)
    public String listUsers(Model model) {
        List<User> listOfAllUsers = userService.listUsers();
        List<User> users = userService.listByPage(0, pageSize);
        if (listOfAllUsers.size() < pageSize) {
            countOfPages = 1;
        }else if (listOfAllUsers.size() > pageSize && listOfAllUsers.size() % pageSize > 0){
            countOfPages = listOfAllUsers.size()/pageSize+1;
        }else{
            countOfPages = listOfAllUsers.size()/pageSize;
        }
        model.addAttribute("user", new User());
        model.addAttribute("countOfPages", countOfPages);
        model.addAttribute("users", users);
        model.addAttribute("listOfAllUsers", listOfAllUsers);

        return "users";
    }

    @RequestMapping(value = "/usersPage", method = RequestMethod.GET)
    public String listUsers(@RequestParam(value="numpage", required=true) Integer numPage, Model model) {
        List<User> listOfAllUsers = userService.listUsers();
        int offset = numPage*pageSize-pageSize;
        List<User> users = userService.listByPage(offset, pageSize);
        model.addAttribute("user", new User());
        model.addAttribute("users", users);
        model.addAttribute("countOfPages", countOfPages);
        model.addAttribute("listOfAllUsers", listOfAllUsers);
        return "users";
    }

    @RequestMapping(value = "/users/filter", method = RequestMethod.POST)
    public String listFilter(@ModelAttribute("userAttribute") User user, Model model) {
        List<User> users = userService.listByName(user.getName());
        model.addAttribute("users", users);
        return "filterpage";
    }

    @RequestMapping(value = "/users/add", method = RequestMethod.POST)
    public String addUser(@ModelAttribute("user") User user){
        if(user.getId() == 0){
            this.userService.addUser(user);
        }else {
            this.userService.updateUser(user);
        }

        return "redirect:/users";
    }

    @RequestMapping("/delete/{id}")
    public String deleteUser(@PathVariable("id") int id){
        this.userService.deleteUser(id);

        return "redirect:/users";
    }

    @RequestMapping("update/{id}")
    public String updateUser(@PathVariable("id") int id, Model model){
        model.addAttribute("user", this.userService.getUserById(id));
        model.addAttribute("listUsers", this.userService.listUsers());

        return "users";
    }
    
    @RequestMapping("userdata/{id}")
    public String userData(@PathVariable("id") int id, Model model){
        model.addAttribute("user", this.userService.getUserById(id));

        return "userdata";
    }
}
