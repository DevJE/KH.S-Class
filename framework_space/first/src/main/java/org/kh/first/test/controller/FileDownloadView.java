package org.kh.first.test.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

@Component("filedown")
public class FileDownloadView extends AbstractView{
	//파일다운로드 처리용 클래스
	//일반 클래스를 뷰리졸버가 실행시키려면 반드시 스프링이 제공하는 AbstractView를 상속받은 후손클래스이어야 한다.
	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		//파일 다운로드 처리 코드 작성함
		//컨트롤러에 뷰리졸버로 리턴한 모델 정보가 자동으로 전달되어있음.
		//System.out.println("downFile : " + ((File)model.get("downfile")).getName());
		
		File downFile = (File)model.get("downFile");
		String fileName = downFile.getName();
		
		response.setContentType("text/plain; charset=utf-8");
		response.addHeader("Content-Disposition", "attatchment; filename=\""
						   + new String(fileName.getBytes("utf-8"), "ISO-8859-1") + "\"");
		
		response.setContentLength((int)downFile.length());
		OutputStream out = response.getOutputStream();
		//FileInputStream fin = null;
		
		try(FileInputStream fin = new FileInputStream(downFile);) 
		{
			FileCopyUtils.copy(fin, out);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
}
