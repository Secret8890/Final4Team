package com.gjob.backend.service;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.java.Log;

@Log
@Service
public class RecVoiceServiceImpl {

    @Autowired
    private FileUploadServiceImpl service;

    public String RecResult(MultipartFile audio_data, HttpServletResponse response) {
        log.info("catgo" + audio_data);

        String ofname = audio_data.getOriginalFilename();
        log.info("ofname:" + ofname);

        if (ofname != null) {
            ofname = ofname.trim();
        }
        if (ofname.length() != 0) {
            String url = service.saveStore(audio_data);
            log.info("#url: " + url);

            toCSR(url);
            return toCSR(url);
        }

        return null;
    }

    public String toCSR(String url2) {
        String clientId = "0p5051g8ru"; // Application Client ID";
        String clientSecret = "hHnRa5AifnBLD0FfsnE76JSPQK9hsEgt4ccMhhUJ"; // Application Client Secret";

        try {
            String imgFile = url2;
            File voiceFile = new File(imgFile);

            String language = "Kor"; // 언어 선택 ( Kor, Jpn, Eng, Chn )
            String apiURL = "https://naveropenapi.apigw.ntruss.com/recog/v1/stt?lang=" + language;
            URL url = new URL(apiURL);

            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setUseCaches(false);
            conn.setDoOutput(true);
            conn.setDoInput(true);
            conn.setRequestProperty("Content-Type", "application/octet-stream");
            conn.setRequestProperty("X-NCP-APIGW-API-KEY-ID", clientId);
            conn.setRequestProperty("X-NCP-APIGW-API-KEY", clientSecret);

            OutputStream outputStream = conn.getOutputStream();
            FileInputStream inputStream = new FileInputStream(voiceFile);
            byte[] buffer = new byte[4096];
            int bytesRead = -1;
            while ((bytesRead = inputStream.read(buffer)) != -1) {
                outputStream.write(buffer, 0, bytesRead);
            }
            outputStream.flush();
            inputStream.close();
            BufferedReader br = null;
            int responseCode = conn.getResponseCode();
            if (responseCode == 200) {
                br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            } else {
                System.out.println("error!!!!!!! responseCode= " + responseCode);
                br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            }
            String inputLine;

            if (br != null) {
                StringBuffer response = new StringBuffer();
                while ((inputLine = br.readLine()) != null) {
                    response.append(inputLine);
                }
                br.close();
                JSONParser pas = new JSONParser();
                JSONObject obj = (JSONObject) pas.parse(response.toString());
                String text = obj.get("text").toString();
                return text;

            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public File textToSound(String say) {
        String clientId = "0p5051g8ru";// 애플리케이션 클라이언트 아이디값";
        String clientSecret = "hHnRa5AifnBLD0FfsnE76JSPQK9hsEgt4ccMhhUJ";// 애플리케이션 클라이언트 시크릿값";
        File result = null;
        try {
            String text = URLEncoder.encode(say, "UTF-8"); // 13자
            String apiURL = "https://naveropenapi.apigw.ntruss.com/tts-premium/v1/tts";
            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection) url.openConnection();
            con.setRequestMethod("POST");
            con.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
            con.setRequestProperty("X-NCP-APIGW-API-KEY-ID", clientId);
            con.setRequestProperty("X-NCP-APIGW-API-KEY", clientSecret);
            // post request
            // String assist[] = {"aa","bb"}

            String postParams = "speaker=njihun&volume=0&speed=0&pitch=0&emotion=0&format=mp3&text=" + text;
            con.setDoOutput(true);
            DataOutputStream wr = new DataOutputStream(con.getOutputStream());
            wr.writeBytes(postParams);
            wr.flush();
            wr.close();
            int responseCode = con.getResponseCode();
            BufferedReader br;
            System.out.println("응답코드 : " + responseCode);
            if (responseCode == 200) { // 정상 호출
                InputStream is = con.getInputStream();
                int read = 0;
                byte[] bytes = new byte[1024];
                // 랜덤한 이름으로 mp3 파일 생성
                String tempname = Long.valueOf(new Date().getTime()).toString();
                File f = new File(Path.FILE_STORE + "AI" + tempname + ".mp3");
                f.createNewFile();
                result = f;
                OutputStream outputStream = new FileOutputStream(f);
                while ((read = is.read(bytes)) != -1) {
                    outputStream.write(bytes, 0, read);
                }
                is.close();
                outputStream.close();
            } else { // 오류 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
                String inputLine;
                StringBuffer response = new StringBuffer();
                while ((inputLine = br.readLine()) != null) {
                    response.append(inputLine);
                }
                br.close();
                System.out.println(response.toString());
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return result;
    }
}
