package com.gjob.backend.config.oauth;

import java.util.Map;

public class NaverUserInfo {
    private Map<String, Object> attributes; // oauth2User.getAttributes();

    public NaverUserInfo(Map<String, Object> attributes) {
        this.attributes = attributes;
    }

    public String getId() {
        return (String) attributes.get("id");
    }

    public String getProvider() {
        return "naver";
    }

    public String getGender() {
        return (String) attributes.get("gender");
    }

    public String getEmail() {
        return (String) attributes.get("email");
    }

    public String getName() {
        return (String) attributes.get("name");
    }

    public String getBirthday() {
        return (String) attributes.get("birthday");
    }

}
