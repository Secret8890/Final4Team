package com.gjob.backend.config.oauth;

import java.util.Map;

public class KakaoUserInfo {
    private Map<String, Object> attributes;

    public KakaoUserInfo(Map<String, Object> attributes) {
        this.attributes = attributes;
    }

    public String getId() {
        return Integer.toString((int) attributes.get("id"));
    }

    public String getProvider() {
        return "kakao";
    }

    public String getGender() {
        @SuppressWarnings("unchecked")
        String gender = String.valueOf(((Map<String, Object>) attributes.get("kakao_account")).get("gender"));
        if (gender.equals("female")) {
            return "F";
        } else if (gender.equals("male")) {
            return "M";
        }
        return null;
    }

    @SuppressWarnings("unchecked")
    public String getEmail() {
        return String.valueOf(((Map<String, Object>) attributes.get("kakao_account")).get("email"));
    }

    @SuppressWarnings("unchecked")
    public String getName() {
        return String.valueOf(((Map<String, Object>) attributes.get("properties")).get("nickname"));
    }

    @SuppressWarnings("unchecked")
    public String getBirthday() {
        return String.valueOf(((Map<String, Object>) attributes.get("kakao_account")).get("birthday"));
    }

    public String getIsManager() {
        return "ROLE_USER";
    }
}
