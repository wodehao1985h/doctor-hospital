package com.doctor.service.impl;

import com.doctor.domain.InquiryFurtherQuestionTemplate;
import com.doctor.domain.InquiryFurtherQuestionTemplateExample;
import com.doctor.mapper.InquiryFurtherQuestionTemplateMapper;
import com.doctor.service.TemplateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

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
@Service
public class TemplateServiceImpl implements TemplateService {

    @Autowired
    private InquiryFurtherQuestionTemplateMapper inquiryFurtherQuestionTemplateMapper;

    @Override
    public List<InquiryFurtherQuestionTemplate> getAll(Long id) {
        InquiryFurtherQuestionTemplateExample example = new InquiryFurtherQuestionTemplateExample();
        example.createCriteria().andIdGreaterThan(id);
        List<InquiryFurtherQuestionTemplate> inquiryFurtherQuestionTemplates = inquiryFurtherQuestionTemplateMapper.selectByExample(example);
        return inquiryFurtherQuestionTemplates;
    }
}
