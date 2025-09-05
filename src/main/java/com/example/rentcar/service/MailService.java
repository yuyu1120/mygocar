package com.example.rentcar.service;

import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class MailService {
    private final JavaMailSender mailSender;

    public MailService(JavaMailSender mailSender) {
        this.mailSender = mailSender;
    }

    public String sendVerificationCode(String toEmail) {
        // 隨機產生 6 位驗證碼
        String code = String.valueOf((int) ((Math.random() * 9 + 1) * 100000));

        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(toEmail);
        message.setSubject("驗證碼通知");
        message.setText("您的驗證碼是：" + code);
        message.setFrom("lu84053077@gmail.com");

        mailSender.send(message);

        return code; // 讓 controller 或 service 拿來存 session 比對
    }
}