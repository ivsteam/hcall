package com.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.privateMapper.Db1Mapper;
import com.publicMapper.Db2Mapper;


@Service
public class DbService {

	@Autowired
	Db1Mapper db1Mappers;
	
	@Autowired
	Db2Mapper db2Mappers;

	/* select dual */
    public String getDb1Dual() throws Exception{
        return db1Mappers.getDb1Dual();
    }

    /* select dual */
    public String getDb2Dual() throws Exception{
        return db2Mappers.getDb2Dual();
    }
}