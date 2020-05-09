package com.doctor.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;

/**
 * =======================================================
 *
 * @Company 高济医疗
 * @Date ：2020-05-09
 * @Author ：hanzhifeng
 * @Version ：0.0.1
 * @Description ：
 * ========================================================
 */
@Controller
public class PageController {

    @RequestMapping(value="/",method= RequestMethod.GET)
    public String index(Model model, HttpSession session) {

        return "index";
    }
}
