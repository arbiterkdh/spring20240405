package com.study.service;

import com.study.mapper.Mapper09;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Map;

@Service
@Transactional(rollbackFor = Exception.class)
@RequiredArgsConstructor
public class Service05 {
    private final Mapper09 mapper;


    public String getCustomerName(Integer id) {
        return mapper.selectCustomerById(id);
    }


    public void add(Map<String, Object> map) {
        String singer = (String) map.get("singer");
        String song = (String) map.get("song");
        mapper.insert(singer, song);
    }
}
