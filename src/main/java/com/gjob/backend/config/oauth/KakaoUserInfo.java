package com.gjob.backend.config.oauth;

import java.util.Map;

public class KakaoUserInfo {
    private Map<String, Object> attributes; // oauth2User.getAttributes();

    public KakaoUserInfo(Map<String, Object> attributes) {
        this.attributes = attributes;
    }

    // 정보들 가공해주세요!!
    public String getId() {
        return Integer.toString((int) attributes.get("id"));
    }

    public String getProvider() {
        return "kakao";
    }

    public String getGender() {
        String gender = String.valueOf(((Map) attributes.get("kakao_account")).get("gender"));
        if (gender.equals("female")) {
            return "F";
        } else if (gender.equals("male")) {
            return "M";
        }
        return null;
    }

    public String getEmail() {
        return null;
    }

    public String getName() {
        return null;
    }

    public String getBirthday() {
        return null;
    }
}
