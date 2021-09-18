package com.gjob.backend.controller;

import java.util.List;

import com.gjob.backend.model.SaraminDTO;
import com.gjob.backend.service.SaraminService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class IndexController {
    @Autowired
    SaraminService service;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView index() {
        List<SaraminDTO> array = service.APItest();
        ModelAndView mv = new ModelAndView("index", "array", array);
        return mv;
    }
}
