package com.doctor.service;

import com.doctor.domain.InquiryFurtherQuestionTemplate;

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
public interface TemplateService {
    List<InquiryFurtherQuestionTemplate> getAll(Long id);
}
