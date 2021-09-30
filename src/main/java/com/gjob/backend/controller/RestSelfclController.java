package com.gjob.backend.controller;

import com.gjob.backend.model.SelfDTO;
import com.gjob.backend.service.SelfService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("rest")
public class RestSelfclController {

    @Autowired
    SelfService service;

    @PostMapping("insert")
    public void insertQA(SelfDTO selfdto){
        service.insertQAS(selfdto);
    }

    @PostMapping("deleteQA.do")
    public void deleteQA(int qa_seq) {
		service.deleteQAS(qa_seq);
    } 
}
