package com.gjob.backend.config;

import com.gjob.backend.config.oauth.PrincipalOauth2UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@Configuration
@EnableWebSecurity // 스프링 시큐리티를 사용하기 위한 선언
public class SecurityConfig extends WebSecurityConfigurerAdapter {
    @Autowired
    private PrincipalOauth2UserService principalOauth2UserService;

    // 해당 메소드의 리턴되는 오브젝트들을 IoC로 등록해줌->어디서든 쓸 수 있음
    @Bean
    public BCryptPasswordEncoder encodePwd() {
        return new BCryptPasswordEncoder();
    }

    // 스프링 시큐리티 규칙
    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.csrf().disable();
        http.authorizeRequests()
                // user 요청에 대해서는 로그인을 요구
                .antMatchers("/user/**").authenticated()
                // admint 요청에 대해서는 ROLE_ADMIN 역할을 가지고 있어야 함
                .antMatchers("/admin/**").access("hasRole('ROLE_ADMIN')")
                // 나머지 요청에 대해서는 로그인을 요구하지 않음
                .anyRequest().permitAll()
                // 로그인하는 경우에 대한 설정
                .and().formLogin()
                // 로그인 페이지를 제공하는 URL
                .loginPage("/login/loginForm").loginProcessingUrl("/login").defaultSuccessUrl("/")
                // 로그인 실패 페이지를 제공하는 URL
                // .failureUrl("/login/fail")
                // 네이버, 카카오와 같은 로그인을 하는 경우에 대한 설정
                .and()
                // OAuth2 로그인 기능에 대한 여러 설정의 진입점
                .oauth2Login().loginPage("/login/loginForm")
                // OAuth2 로그인 성공 이후 사용자 정보를 가져올 때의 설정 담당
                .userInfoEndpoint()
                // 로그인 성공 시 후속 조치를 진행할 구현체 등록
                .userService(principalOauth2UserService);
        http.logout().logoutUrl("/logout").logoutSuccessUrl("/").invalidateHttpSession(true)
                .deleteCookies("JSESSIONID");
    }
}