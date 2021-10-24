package com.gjob.backend.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.gjob.backend.config.auth.PrincipalDetails;
import com.gjob.backend.model.CompanyDTO;
import com.gjob.backend.model.Pager;
import com.gjob.backend.model.ReviewDTO;
import com.gjob.backend.service.ReviewService;
import com.nimbusds.jose.shaded.json.JSONArray;
import com.nimbusds.jose.shaded.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ReviewController {
    @Autowired
    private ReviewService service;

    

    @GetMapping("review/list")
    public ModelAndView list(){
        List<ReviewDTO> list = service.listS();
        ModelAndView mv = new ModelAndView("review/review_list","list",list);
        return mv;
    }
    
    @GetMapping("review/insert")
    public String write(){
        return "review/review_insert";
    }
    @PostMapping("review")
    @ResponseBody
    public boolean reviewWrite(ReviewDTO review ,@AuthenticationPrincipal PrincipalDetails principalDetails){
        boolean flag = false;
        try {
            review.setU_seq(principalDetails.getMember().getU_seq());
            service.insertS(review);
            flag = true;
        } catch (Exception e) {
            e.printStackTrace();
            flag = false;
        }
        return flag;
    }
    
    @GetMapping("review/searchCompany")
    public @ResponseBody JSONArray companylist(String co_name){
        List<CompanyDTO> company = service.companyListS(co_name);
        System.out.println("company: "+company);
        JSONArray list = new JSONArray();
        JSONObject object = null;
        for(CompanyDTO comp : company) {
            object = new JSONObject();
            object.put ("data",comp.getCo_name());
            list.add(object);
         }
        return list;
    }
    
    @DeleteMapping("review")
    public @ResponseBody String delete(String review_seq){
        int review_seq_num = Integer.parseInt(review_seq);
        service.deleteS(review_seq_num);
        return "게시글이 삭제되었습니다.";
    }

    @GetMapping("review/listGet")
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

    @GetMapping("review/detail")
    public ModelAndView boardview(int review_seq){
        ReviewDTO board = service.boardviewS(review_seq);
        ModelAndView mv = new ModelAndView("review/review_detail");
        mv.addObject("board", board);
        System.out.println(mv);
        return mv;
    }

    @GetMapping("review/update")
    public ModelAndView updateview(int review_seq){
        ReviewDTO board = service.boardviewS(review_seq);
        ModelAndView mv = new ModelAndView("review/review_update");
        mv.addObject("update", board);
        System.out.println(mv);
        return mv;
    }

    @PutMapping("review")
    @ResponseBody
    public boolean update(ReviewDTO review){
        boolean flag = false;
        try {
           service.updateS(review);
           flag = true;
        } catch (Exception e) {
            flag = false;
        }
        return flag;
    }

}