package com.doctor;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

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
@MapperScan("com.doctor.mapper")
@SpringBootApplication
@ComponentScan(basePackages = "com.doctor.*")
public class DoctorHospitalApplication {
    public static void main(String[] args) {
        SpringApplication.run(DoctorHospitalApplication.class, args);
    }

}
