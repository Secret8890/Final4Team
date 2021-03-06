package com.gjob.backend.controller;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import javax.servlet.http.HttpServletResponse;

import com.gjob.backend.config.auth.PrincipalDetails;
import com.gjob.backend.model.ChatBotDTO;
import com.gjob.backend.model.ChatMessageDTO;
import com.gjob.backend.model.MemberDTO;
import com.gjob.backend.service.ChatBotServiceImpl;
import com.gjob.backend.service.Path;
import com.gjob.backend.service.RecVoiceServiceImpl;

import org.apache.tomcat.util.codec.binary.Base64;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ChatController {
    @Autowired
    private ChatBotServiceImpl serviceChat;
    // @Autowired
    // private FileUploadService serviceFile;

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
    public String sendMessage(ChatMessageDTO dto) throws IOException {
        System.out.println("#chat: " + dto.getMessage() + ", " + dto.getWriter());
        String chatMessage = dto.getMessage();

        URL url = new URL(apiUrl);

        String message = getReqMessage(chatMessage);
        // ????????? ?????? ?????????
        String encodeBase64String = makeSignature(message, secretKey);

        // api?????? ?????? (?????? -> ?????? ??????)
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
        if (responseCode == 200) { // ?????? ??????
            BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
            String decodedString;
            String jsonString = "";
            while ((decodedString = in.readLine()) != null) {
                jsonString = decodedString;
            }

            // ????????? ?????? ???????????? ??????
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
        } else { // ?????? ??????
            chatMessage = con.getResponseMessage();
        }
        System.out.println("???????????? ?????????: " + chatMessage);
        return chatMessage;
    }

    // ?????? ???????????? ??????????????? ???????????? ???????????? ??????????????? ?????????
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

    // ?????? ???????????? ????????? ????????? ???????????? ??????????????? ?????????
    @SuppressWarnings("unchecked")
    public static String getReqMessage(String voiceMessage) {

        String requestBody = "";

        try {
            long timestamp = new Date().getTime();
            System.out.println("# timestamp: " + timestamp);

            Map<String, Object> map_obj = new HashMap<String, Object>();
            map_obj.put("version", "v2");
            map_obj.put("userId", "U47b00b58c90f8e47428af8b7bddc1231heo2");
            map_obj.put("timestamp", timestamp);
            map_obj.put("event", "send");

            Map<String, Object> map_data_obj = new HashMap<String, Object>();
            map_data_obj.put("description", voiceMessage);
            Map<String, Object> map_bubbles_obj = new HashMap<String, Object>();
            map_bubbles_obj.put("type", "text");
            map_bubbles_obj.put("data", map_data_obj);
            JSONObject bubbles_obj = new JSONObject(map_bubbles_obj);

            JSONArray bubbles_array = new JSONArray();
            bubbles_array.add(bubbles_obj);
            map_obj.put("bubbles", bubbles_array);
            JSONObject obj = new JSONObject(map_obj);

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

    @ResponseBody
    @PostMapping("insertChatBot")
    public String insert(String chatArr, MemberDTO memberdto) {
        System.out.println("!chatArr:" + chatArr);
        System.out.println("!memberdto:" + memberdto);
        serviceChat.changeToJson(chatArr, memberdto);

        File f = new File(Path.FILE_STORE);
        File ftxt = new File(Path.FILE_STORE + "/temp.txt"); // ?????? txt?????? git?????? ??????????????????!
        File files[] = f.listFiles();
        for (File fi : files) {
            fi.delete();
        }
        try {
            ftxt.createNewFile(); // ?????? txt?????? git?????? ??????????????????!
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    @GetMapping("interview/list")
    public ModelAndView interviewListView(@AuthenticationPrincipal PrincipalDetails principalDetails) {
        int u_seq = principalDetails.getMember().getU_seq();
        List<ChatBotDTO> list = serviceChat.listS(u_seq);
        ModelAndView mv = new ModelAndView("client/interview_list", "list", list);
        return mv;
    }

    @GetMapping("interview/content")
    public ModelAndView interviewContent(String seq, @AuthenticationPrincipal PrincipalDetails principalDetails) {
        int interview_seq = Integer.parseInt(seq);
        int u_seq = principalDetails.getMember().getU_seq();
        List<ChatBotDTO> dto = serviceChat.selectContentS(u_seq, interview_seq);
        ModelAndView mv = new ModelAndView("client/interview_content", "board", dto);
        return mv;
    }
}