package com.gjob.backend.controller;

import java.util.*;

import com.gjob.backend.model.Pager;
import com.gjob.backend.model.ReviewDTO;
import com.gjob.backend.model.CompanyDTO;
import com.gjob.backend.service.ReviewService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
    
    @GetMapping("searchCompany")
    public @ResponseBody List<CompanyDTO> companylist(String co_name){
        List<CompanyDTO> company = service.companyListS(co_name);
        System.out.println("company: "+company);
        return company;
    }
    
    @PostMapping("del.do")
    public @ResponseBody String delete(String review_seq){
        int review_seq_num = Integer.parseInt(review_seq);
        service.deleteS(review_seq_num);
        return "게시글이 삭제되었습니다.";
    }

    @GetMapping("listGet")
    public @ResponseBody Map<String, Object> reviewboardList(@RequestParam(defaultValue="1") int pageNum){
        int totalBoard = service.selectCountS();
        int pageSize = 10;
        int blockSize = 5;

        Pager pager = new Pager(pageNum, totalBoard, pageSize, blockSize);
        
        Map<String, Object> pagerMap = new HashMap<String, Object>();
        pagerMap.put("startRow", pager.getStartRow());
        pagerMap.put("endRow", pager.getEndRow());

        Map<String, Object> returnMap = new HashMap<String, Object>();
        returnMap.put("board", service.selectAjaxByHitS(pagerMap));
        returnMap.put("pager", pager);
        
        return returnMap;
    }

    @GetMapping("boardview.do")
    public ModelAndView boardview(int review_seq){
        ReviewDTO board = service.boardviewS(review_seq);
        ModelAndView mv = new ModelAndView("review/boardview");
        mv.addObject("board", board);
        System.out.println(mv);
        return mv;
    }

    @GetMapping("selectUpdate.do")
    public ModelAndView updateview(int review_seq){
        ReviewDTO board = service.boardviewS(review_seq);
        ModelAndView mv = new ModelAndView("review/update");
        mv.addObject("update", board);
        System.out.println(mv);
        return mv;
    }

    @PostMapping("update.do")
    public String update(ReviewDTO review){
        System.out.println(review);
        service.updateS(review);
        return "redirect:list.do";
    }

}