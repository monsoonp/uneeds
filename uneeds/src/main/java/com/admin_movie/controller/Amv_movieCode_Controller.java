package com.admin_movie.controller;

import java.io.File;

import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.stereotype.Controller;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.movie.domain.MovieVO;
import com.movie.service.MovieService;


@Controller
public class Amv_movieCode_Controller {
	
	@Inject
	private MovieService mservice;
	
	//업로드경로
	@Resource(name="uploadPath") //servlet-context에 설정한 경로 문자열을 주입
	private String uploadPath;
	
	//업로드 + 등록
	@RequestMapping(value = "up_Movie", method=RequestMethod.POST)
    public String up_Movie(MultipartHttpServletRequest multi, MovieVO mvo) throws Exception{
		System.out.println("hi");
		
        String newFileName = ""; // 업로드 되는 파일명
		Iterator<String> files = multi.getFileNames();
        while(files.hasNext()){
            String uploadFile = files.next();
            MultipartFile mFile = multi.getFile(uploadFile);
            String fileName = mFile.getOriginalFilename();
            System.out.println("실제 파일 이름 : " +fileName);
            newFileName = System.currentTimeMillis()+"."
                    +fileName.substring(fileName.lastIndexOf(".")+1);
            
            mvo.setImgpath(newFileName);
            File saveFile = new File(uploadPath,newFileName);
            
			FileCopyUtils.copy(mFile.getBytes(), saveFile);//파일저장
            
            //System.out.println(mvo.getImgpath());
            //System.out.println(mvo.getOpenDt());
        }
        
        mservice.insert_movie(mvo);
        
        return "redirect:main";
    }
	
	//보유영화
	@RequestMapping(value="list_Movies", method=RequestMethod.GET)
	public @ResponseBody List<MovieVO> list_Movies() throws Exception{
		return mservice.listall_movie();
	}
	
	//영화삭제
	@RequestMapping(value="delete_Movies", method=RequestMethod.POST)
	public String delete_Movies(MovieVO mvo) throws Exception{
		mservice.delete_movie(mvo);
		return "redirect:main";
	}
	
	//관람등급카운팅
	@RequestMapping(value="wgradecd_count", method=RequestMethod.POST)
	public @ResponseBody int wgradecd_count(MovieVO mvo) throws Exception{
		int x = mservice.wgradecd_count(mvo);
		return x;
	}
}
