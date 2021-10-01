package com.gjob.backend.controller;

import java.util.List;

import com.gjob.backend.model.ReviewDTO;
import com.gjob.backend.service.ReviewService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping("review")
public class ReviewController {
    @Autowired
    private ReviewService service;

    @GetMapping("list.do")
    public ModelAndView list(){
        List<ReviewDTO> list = service.listS();
        ModelAndView mv = new ModelAndView("review/list","list",list);
        return mv;
    }
    
    @GetMapping("boardform.do")
    public String write(){
        return "review/boardform";
    }
    @PostMapping("boardform.do")
    public String write(ReviewDTO review){
        service.insertS(review);
        return "redirect:list.do";
    }
    @GetMapping("del.do")
    public String delete(@RequestParam int review_seq){
        service.deleteS(review_seq);
        return "redirect:list.do";
    }
}