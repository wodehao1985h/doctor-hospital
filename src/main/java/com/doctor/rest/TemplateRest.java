package com.doctor.rest;

import com.doctor.service.TemplateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.Objects;

/**
 * =======================================================
 *
 * @Company 高济医疗
 * @Date ：2020/11/24
 * @Author ：hanzhifeng
 * @Version ：0.0.1
 * @Description ：
 * ========================================================
 */
@RestController
public class TemplateRest {

    @Autowired
    private TemplateService templateService;

    @GetMapping(value = "/getAll", produces = "application/json;charset=UTF-8")
    @ResponseBody
    public Object getAll(@RequestParam("id") Long id) {
        return templateService.getAll(id);
    }
}
