package com.gjob.backend.service;

import com.gjob.backend.mapper.MemberMapper;
import com.gjob.backend.model.MailDTO;

import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class MailService {
    private MemberMapper memberMapper;
    private BCryptPasswordEncoder bCryptPasswordEncoder;
    private JavaMailSender mailSender;

    public MailDTO createMailAndChangePassword(String u_email, String u_name) {
        String str = getTempPassword();
        MailDTO mail = new MailDTO();
        mail.setAddress(u_email);
        mail.setTitle(u_name + "님의 [그것이 알고JOB다] 임시비밀번호 안내 이메일입니다.");
        mail.setMessage("안녕하세요. [그것이 알고JOB다] 임시비밀번호 안내 관련 이메일입니다." + "[" + u_name + "]" + "님의 임시비밀번호는 " + str + "입니다");
        updatePassword(str, u_email);
        return mail;
    }

    // 임시 비밀번호 생성
    public String getTempPassword() {
        char[] charSet = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F',
                'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' };
        String str = "";

        int idx = 0;
        for (int i = 0; i < 10; i++) {
            idx = (int) (charSet.length * Math.random());
            str += charSet[idx];
        }
        return str;
    }

    // 비밀번호 수정
    public void updatePassword(String str, String u_email) {
        String encPassword = bCryptPasswordEncoder.encode(str);
        memberMapper.changePwd(encPassword, u_email);
    }

    public void mailSend(MailDTO mail) {
        System.out.println("이메일 전송 완료");
        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(mail.getAddress());
        message.setSubject(mail.getTitle());
        message.setText(mail.getMessage());

        mailSender.send(message);
    }
}
