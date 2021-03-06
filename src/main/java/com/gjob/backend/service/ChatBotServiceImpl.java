package com.gjob.backend.service;

import com.gjob.backend.model.MemberDTO;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import java.util.List;
import com.gjob.backend.mapper.ChatBotMapper;
import com.gjob.backend.model.ChatBotDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ChatBotServiceImpl implements ChatBotService {
    @Autowired
    private ChatBotMapper mapper;

    @Override
    public void insertS(ChatBotDTO chatbotdto){
        mapper.insert(chatbotdto);
    }
    public void changeToJson(String chatArr , MemberDTO memberdto ){
        JSONParser parser= new JSONParser();
        try {
            int interview_seq=mapper.selectMax(memberdto.getU_seq());
            JSONArray jsonArr= (JSONArray)parser.parse(chatArr);
            System.out.println(interview_seq);
            for(int i=0;i<jsonArr.size();i++){
                ChatBotDTO chatbotdto=new ChatBotDTO();
                JSONObject obj=(JSONObject)parser.parse(jsonArr.get(i).toString());
                chatbotdto.setChat_q(obj.get("chat_q").toString());
                chatbotdto.setChat_a(obj.get("chat_a").toString());
                chatbotdto.setU_seq(memberdto.getU_seq());
                chatbotdto.setInterview_seq(interview_seq);
                insertS(chatbotdto);
            }
        } catch (ParseException e) {
            e.printStackTrace();
        }
    }   

    @Override
    public List<ChatBotDTO> listS(int u_seq) {
        return mapper.list(u_seq);
    }

    @Override
    public List<ChatBotDTO> selectContentS(int u_seq, int interview_seq) {
        return mapper.selectContent(u_seq, interview_seq);
    }
    @Override
    public List<ChatBotDTO> aiCountS(){
        return mapper.aiCount();
    }
    @Override
    public int aiCountviewS(){
        return mapper.aiCountview();
    }
}
