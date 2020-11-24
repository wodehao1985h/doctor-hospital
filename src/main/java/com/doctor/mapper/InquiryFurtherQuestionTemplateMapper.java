package com.doctor.mapper;

import com.doctor.domain.InquiryFurtherQuestionTemplate;
import com.doctor.domain.InquiryFurtherQuestionTemplateExample;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface InquiryFurtherQuestionTemplateMapper {
    long countByExample(InquiryFurtherQuestionTemplateExample example);

    int deleteByExample(InquiryFurtherQuestionTemplateExample example);

    int deleteByPrimaryKey(Long id);

    int insert(InquiryFurtherQuestionTemplate record);

    int insertSelective(InquiryFurtherQuestionTemplate record);

    List<InquiryFurtherQuestionTemplate> selectByExample(InquiryFurtherQuestionTemplateExample example);

    InquiryFurtherQuestionTemplate selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") InquiryFurtherQuestionTemplate record, @Param("example") InquiryFurtherQuestionTemplateExample example);

    int updateByExample(@Param("record") InquiryFurtherQuestionTemplate record, @Param("example") InquiryFurtherQuestionTemplateExample example);

    int updateByPrimaryKeySelective(InquiryFurtherQuestionTemplate record);

    int updateByPrimaryKey(InquiryFurtherQuestionTemplate record);
}