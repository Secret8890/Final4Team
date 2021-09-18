package com.gjob.backend.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.java.Log;

@Log
@Service
public class FileUploadServiceImpl implements FileUploadService {

	@Override
	public String saveStore(MultipartFile file) {
		String ofname = file.getOriginalFilename();
		int idx = ofname.lastIndexOf("."); // dfsfsdf.ppt (뒤에 확장명 분리하기 위해)
		String ofheader = ofname.substring(0, idx); // 파일명
		String ext = ofname.substring(idx); // 확장명
		long ms = System.currentTimeMillis(); // 시간
		StringBuilder sb = new StringBuilder();
		sb.append(ofheader);
		sb.append("_");
		sb.append(ms);
		sb.append(ext);
		// 겹치치않는 파일 이름
		String saveFileName = sb.toString();

		long fsize = file.getSize();
		log.info("ofname: " + ofname + ", saveFileName: " + saveFileName + ", fsize: " + fsize);

		boolean flag = writeFile(file, saveFileName);
		if (flag) {
			log.info("#업로드 성공");
		} else {
			log.info("#업로드 실패");
		}

		return Path.FILE_STORE + saveFileName;
	}

	@Override
	public boolean writeFile(MultipartFile file, String saveFileName) {
		File rDir = new File(Path.FILE_STORE);
		if (!rDir.exists()) {
			rDir.mkdirs();
		}
		FileOutputStream fos = null;
		try {
			byte data[] = file.getBytes();
			System.out.println("data bytes:" + data.length);
			fos = new FileOutputStream(Path.FILE_STORE + saveFileName);
			fos.write(data);
			fos.flush();

			return true;
		} catch (IOException ie) {
			System.out.println(ie);
			return false;
		} finally {
			try {
				if (fos != null)
					fos.close();
			} catch (IOException ie) {
			}
		}
	}
}