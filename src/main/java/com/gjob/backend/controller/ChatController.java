package com.gjob.backend.controller;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Date;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import javax.servlet.http.HttpServletResponse;

import com.gjob.backend.service.RecVoiceServiceImpl;

import org.apache.tomcat.util.codec.binary.Base64;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class ChatController {
    @Autowired
    private RecVoiceServiceImpl service;
    private static String secretKey = "cnFnV0hoTFBwSGNoaXZycXNKWFNWSWx5b1pjR3F5VHc=";
    private static String apiUrl = "https://68f5bb7b52bf4dd2a9ef516957a66ede.apigw.ntruss.com/custom/v1/5324/b3af073a757c466c5b86d95cff9a455afb138aaa2051a080bcf2278de74a45d9";

    @PostMapping("/record")
    @ResponseBody
    public String forTest(MultipartFile audio_data, HttpServletResponse response) {
        return service.RecResult(audio_data, response);
    }

    @MessageMapping("/sendMessage")
    @SendTo("/topic/public")
    public String sendMessage(@Payload String chatMessage) throws IOException {

        URL url = new URL(apiUrl);

        String message = getReqMessage(chatMessage);
        String encodeBase64String = makeSignature(message, secretKey);

        // api서버 접속 (서버 -> 서버 통신)
        HttpURLConnection con = (HttpURLConnection) url.openConnection();
        con.setRequestMethod("POST");
        con.setRequestProperty("Content-Type", "application/json;UTF-8");
        con.setRequestProperty("X-NCP-CHATBOT_SIGNATURE", encodeBase64String);

        con.setDoOutput(true);
        DataOutputStream wr = new DataOutputStream(con.getOutputStream());

        wr.write(message.getBytes("UTF-8"));
        wr.flush();
        wr.close();
        int responseCode = con.getResponseCode();
        if (responseCode == 200) { // 정상 호출

            BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
            String decodedString;
            String jsonString = "";
            while ((decodedString = in.readLine()) != null) {
                jsonString = decodedString;
            }

            // 받아온 값을 세팅하는 부분
            JSONParser jsonparser = new JSONParser();
            try {
                JSONObject json = (JSONObject) jsonparser.parse(jsonString);
                JSONArray bubblesArray = (JSONArray) json.get("bubbles");
                JSONObject bubbles = (JSONObject) bubblesArray.get(0);
                JSONObject data = (JSONObject) bubbles.get("data");
                String description = "";
                description = (String) data.get("description");
                chatMessage = description;
            } catch (Exception e) {
                System.out.println("error");
                e.printStackTrace();
            }

            in.close();
        } else { // 에러 발생
            chatMessage = con.getResponseMessage();
        }
        return chatMessage;
    }

    // 보낼 메세지를 네이버에서 제공해준 암호화로 변경해주는 메소드
    public static String makeSignature(String message, String secretKey) {

        String encodeBase64String = "";

        try {
            byte[] secrete_key_bytes = secretKey.getBytes("UTF-8");

            SecretKeySpec signingKey = new SecretKeySpec(secrete_key_bytes, "HmacSHA256");
            Mac mac = Mac.getInstance("HmacSHA256");
            mac.init(signingKey);

            byte[] rawHmac = mac.doFinal(message.getBytes("UTF-8"));
            encodeBase64String = Base64.encodeBase64String(rawHmac);

            return encodeBase64String;

        } catch (Exception e) {
            System.out.println(e);
        }

        return encodeBase64String;

    }

    // 보낼 메세지를 네이버 챗봇에 포맷으로 변경해주는 메소드
    public static String getReqMessage(String voiceMessage) {

        String requestBody = "";

        try {

            JSONObject obj = new JSONObject();

            long timestamp = new Date().getTime();

            System.out.println("##" + timestamp);

            obj.put("version", "v2");
            obj.put("userId", "U47b00b58c90f8e47428af8b7bddc1231heo2");
            obj.put("timestamp", timestamp);

            JSONObject bubbles_obj = new JSONObject();

            bubbles_obj.put("type", "text");

            JSONObject data_obj = new JSONObject();
            data_obj.put("description", voiceMessage);

            bubbles_obj.put("type", "text");
            bubbles_obj.put("data", data_obj);

            JSONArray bubbles_array = new JSONArray();
            bubbles_array.add(bubbles_obj);

            obj.put("bubbles", bubbles_array);
            obj.put("event", "send");

            requestBody = obj.toString();

        } catch (Exception e) {
            System.out.println("## Exception : " + e);
        }

        return requestBody;

    }

    @ResponseBody
    @PostMapping("botSound")
    public String botSound(String say) {
        System.out.println(say);
        File file = service.textToSound(say);
        return file.getName();
    }

}