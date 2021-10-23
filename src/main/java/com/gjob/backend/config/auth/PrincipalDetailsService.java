package com.gjob.backend.config.auth;

import com.gjob.backend.mapper.MemberMapper;
import com.gjob.backend.model.MemberDTO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

//SecurityConfig.java에서 loginProcessing("/login") 이 실행되면
//즉, 로그인 요청이 오면 자동으로 UserDetailsService 타입으로 IoC되어 있는 loadUserByUsername 함수가 실행
@Service
public class PrincipalDetailsService implements UserDetailsService {
    @Autowired
    private MemberMapper memberMapper;

    // 시큐리티 session(내부 Authentication(내부 UserDetails))
    @Override
    public UserDetails loadUserByUsername(@AuthenticationPrincipal String username) throws UsernameNotFoundException {
        MemberDTO userEntity = memberMapper.findById(username);
        if (userEntity != null) {
            return new PrincipalDetails(userEntity); // 로그인 성공
        }
        return null; // 로그인 실패
    }

}