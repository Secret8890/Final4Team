package com.gjob.backend.controller;

import java.util.List;

import com.gjob.backend.model.ApplyDTO;
import com.gjob.backend.model.IncruitDTO;
import com.gjob.backend.service.ApplyService;
import com.gjob.backend.service.IncruitService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
@RequestMapping("/company")
public class CompanyController {

    @Autowired
    private IncruitService service;
    @Autowired
    private ApplyService applyService;

    @GetMapping("write.do")
    public String write() {
        return "client/company_write";
    }

    @GetMapping("update.do")
    public ModelAndView viewContent(@RequestParam String co_seq) {
        IncruitDTO dto = service.selectBySeqS(co_seq);
        ModelAndView mv = new ModelAndView("client/company_write", "content", dto);
        return mv;
    }

    @PostMapping("write.do")
    public String insert(IncruitDTO dto) {
        service.insertS(dto);
        System.out.println("INSERT");
        return "redirect:list.do";
    }

    @GetMapping("list.do")
    public ModelAndView list() {
        List<IncruitDTO> list = service.selectS();
        ModelAndView mv = new ModelAndView("client/company_list", "list", list);
        return mv;
    }

    @GetMapping("listCompany.do")
    public ModelAndView listCompany(@RequestParam String co_name) {
        List<IncruitDTO> listcompany = service.selectNameS(co_name);
        ModelAndView mv = new ModelAndView("client/company_list", "list", listcompany);
        return mv;
    }

    @GetMapping("content.do")
    public ModelAndView content(@RequestParam String co_seq) {
        IncruitDTO dto = service.selectBySeqS(co_seq);
        ModelAndView mv = new ModelAndView("client/company_content", "content", dto);
        return mv;
    }

    @GetMapping("listApply")
    public ModelAndView listApply(@RequestParam int co_seq) {
        List<ApplyDTO> dto = applyService.listApplyS(co_seq);

        ModelAndView mv = new ModelAndView("client/company_applyList", "apply", dto);
        System.out.println("LISTAPPLY" + dto);
        return mv;
    }

    @PutMapping("update.do")
    @ResponseBody
    public String update(IncruitDTO dto) {
        service.updateCompanyS(dto);
        System.out.println("UPDATE" + dto);
        return "redirect:list.do";
    }

    @DeleteMapping("delete.do")
    @ResponseBody
    public boolean delete(@RequestParam int co_seq) {
        boolean flag = false;
        try {
            service.deleteS(co_seq);
            flag = true;
        } catch (Exception e) {
            System.out.println("delete Exception" + e);
            flag = false;
        }
        return flag;
    }

}
