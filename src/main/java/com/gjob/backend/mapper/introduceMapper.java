package com.gjob.backend.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;
import com.gjob.backend.model.TestIntroDTO;
import java.util.*;

@Repository
@Mapper
public interface introduceMapper {
    void insert(TestIntroDTO selfintro);

    List<TestIntroDTO> select();

    TestIntroDTO selectBySeq(long seq);
    void update(TestIntroDTO selfintro);
    
    void delete(long seq);


}
