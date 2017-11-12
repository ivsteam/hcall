package com.controller;

import org.springframework.beans.factory.annotation.Autowired;  
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.service.DbService;


@RestController
@RequestMapping("/dbchk")
public class DbController {
    @Autowired
    DbService dbService;
    
    @RequestMapping("/hw")
    public @ResponseBody String root_test() throws Exception{   
        return "Hello World";
    }

    @RequestMapping("/db1")
    public @ResponseBody String db1() throws Exception{
        return dbService.getDb1Dual();
    }
    
    @RequestMapping("/db2")
    public @ResponseBody String db2() throws Exception{
    	return dbService.getDb2Dual();
    }
    
}