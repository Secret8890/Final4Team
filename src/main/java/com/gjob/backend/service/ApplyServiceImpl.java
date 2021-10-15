package com.gjob.backend.service;

import java.util.List;

import com.gjob.backend.mapper.ApplyMapper;
import com.gjob.backend.mapper.ResumeMapper;
import com.gjob.backend.mapper.SelfMapper;
import com.gjob.backend.model.ApplyDTO;
import com.gjob.backend.model.CareerDTO;
import com.gjob.backend.model.LanguageDTO;
import com.gjob.backend.model.LicenseDTO;
import com.gjob.backend.model.QuesDTO;

import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class ApplyServiceImpl implements ApplyService {
    
    private ApplyMapper applyMapper;
    private SelfMapper selfMapper;
    private ResumeMapper resumeMapper;


    @Override
    public List<ApplyDTO> listS(int u_seq) {
        return applyMapper.list(u_seq);
    }

    @Override
    public void insertS(ApplyDTO apply) {
        int re_seq = apply.getRe_seq();
        System.out.println("re_seq"+re_seq);
        resumeMapper.copyResume(re_seq); // 카피후 새데이터 넣기
        int lastResumeSeq = resumeMapper.FindlastInsert().getRe_seq();
        resumeMapper.applyUpdate(lastResumeSeq); // 방금넣은친구 APPLY TRUE
        System.out.println(re_seq);
        // 기존데이터의 하위요소를 상위 seq를 기준으로 리스트로 뽑아와 새로 데이터를 넣음.
        List<CareerDTO> careers = resumeMapper.detailCareer(String.valueOf(re_seq));
        System.out.println(careers); 
        List<LanguageDTO> languages = resumeMapper.detailLanguage(String.valueOf(re_seq));
        System.out.println(languages);
        List<LicenseDTO> licenses = resumeMapper.detailLicense(String.valueOf(re_seq));
        System.out.println(licenses);
        for(CareerDTO career : careers) {
            career.setRe_seq(lastResumeSeq);
            resumeMapper.insertCareer(career);
        }
        for(LanguageDTO language : languages) {
            language.setRe_seq(lastResumeSeq);
            resumeMapper.insertLanguage(language);
        }
        for(LicenseDTO license : licenses) {
            license.setRe_seq(lastResumeSeq);
            resumeMapper.insertLicense(license);
        }
        int self_seq = apply.getSelf_seq();
        selfMapper.copySelf(self_seq); // 자기소개서 카피후 인서트
        int lastSelfSeq = selfMapper.lastInsertSelf().getSelf_seq(); // 마지막으로 추가한 부모요소의 seq
        selfMapper.applyUpdate(lastSelfSeq); // apply true
        List<QuesDTO> quesList = selfMapper.QuesDetail(self_seq);
        for(QuesDTO ques : quesList) {
            ques.setSelf_seq(lastSelfSeq);
            selfMapper.insertQues(ques);
        }
        ApplyDTO resultApply = apply;
        resultApply.setRe_seq(lastResumeSeq); // 카피한 이력서의 번호
        resultApply.setSelf_seq(lastSelfSeq); // 카피한 자소서의 번호

        applyMapper.insert(resultApply);
    }

}
