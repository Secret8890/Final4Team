package com.gjob.backend.config.auth;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Map;

import com.gjob.backend.model.MemberDTO;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.oauth2.core.user.OAuth2User;

import lombok.Data;

@Data
public class PrincipalDetails implements UserDetails, OAuth2User {
    private MemberDTO member;
    private Map<String, Object> attributes;

    // 일반 로그인 생성자
    public PrincipalDetails(MemberDTO member) {
        this.member = member;
    }

    // OAuth2 로그인 생성자
    public PrincipalDetails(MemberDTO member, Map<String, Object> attributes) {
        this.member = member;
        this.attributes = attributes;
    }

    // 해당 사용자의 권한을 리턴
    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        Collection<GrantedAuthority> collect = new ArrayList<>();
        collect.add(new GrantedAuthority() {
            @Override
            public String getAuthority() {
                return member.getIsManager();
            }
        });
        return collect;
    }

    @Override
    public String getPassword() {
        return member.getU_password();
    }

    @Override
    public String getUsername() {
        return member.getU_id();
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return true;
    }

    @Override
    public Map<String, Object> getAttributes() {
        return attributes;
    }

    @Override
    public String getName() {
        return null;
    }
}
