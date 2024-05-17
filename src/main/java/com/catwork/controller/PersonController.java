package com.catwork.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.catwork.domain.Pagination;
import com.catwork.domain.PagingResponse;
import com.catwork.domain.PagingVo;
import com.catwork.domain.PersonApplyVo;
import com.catwork.domain.PersonBookmarkVo;
import com.catwork.domain.PersonVo;
import com.catwork.domain.PostVo;
import com.catwork.domain.RecommendPostVo;
import com.catwork.domain.ResumeVo;
import com.catwork.domain.Resume_SkillVo;
import com.catwork.domain.SkillVo;
import com.catwork.domain.UserVo;
import com.catwork.mapper.PersonMapper;
import com.catwork.mapper.ResumeMapper;
import com.catwork.mapper.UserMapper;

@Controller
public class PersonController {
	
	
	@Autowired
	private UserMapper userMapper;
	
	@Autowired
	private PersonMapper personMapper;
	
	@Autowired
	private ResumeMapper resumeMapper;
	
	@GetMapping("/MyPage")
	public ModelAndView personMypage(UserVo userVo, PersonVo personVo, ResumeVo resumeVo, PersonApplyVo personApplyVo, PersonBookmarkVo personbookmarkVo,@RequestParam(value = "nowpage") int nowpage) {
		
		PersonVo pvo = personMapper.getPersonInfo(personVo,userVo);
		
		List<ResumeVo> resumeList = personMapper.getResumeList(resumeVo);
		
		
		//공고 리스트 페이징
				int count = resumeMapper.countResumeList(resumeList);
				//int count1 = resumeMapper.countRecommensPostList(resumeList);
				//int count = resumeMapper.countResumeList(resumeList);
				
				//int count = resumeListInfo.size();
				PagingResponse<ResumeVo> response = null;
				if (count < 1) {
					response = new PagingResponse<>(Collections.emptyList(), null);
				}
				// 페이징을 위한 초기 설정값
				PagingVo pagingVo = new PagingVo();
				pagingVo.setPage(nowpage);
				pagingVo.setPageSize(3);
				pagingVo.setRecordSize(3);

				// Pagination 객체를 생성해서 페이지 정보 계산 후 SearchDto 타입의 객체인 params에 계산된 페이지 정보 저장
				Pagination pagination = new Pagination(count, pagingVo);
				pagingVo.setPagination(pagination);

				int offset = pagingVo.getOffset();
				System.out.println(offset);
				int pageSize = pagingVo.getPageSize();
				System.out.println(pageSize);
				
				
				
				List<ResumeVo> pagingList = resumeMapper.getResumeListPaging(offset, pageSize);
				response = new PagingResponse<>(pagingList, pagination);
				
		
		List<PersonApplyVo> applyList = personMapper.getApplyList(personApplyVo);
		
		List<PersonBookmarkVo> bookmarkList = personMapper.getBookmarkList(personbookmarkVo);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("pvo",pvo);
		mv.addObject("resumeList",resumeList);
		mv.addObject("bookmarkList",bookmarkList);
		mv.addObject("applyList",applyList);
		mv.addObject("response", response);
		mv.addObject("pagingVo", pagingVo);
		mv.addObject("nowpage", nowpage);
		mv.setViewName("/person/myPage");
		
		return mv;
	}
	
	@GetMapping("/MyPage/UpdateForm")
	public ModelAndView myPageUpdateForm(UserVo userVo, PersonVo personVo) {
		PersonVo pvo = personMapper.getPersonInfo(personVo,userVo);
		PersonVo vo =personMapper.getPwd(personVo);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/person/myPageUpdate");
		mv.addObject("pvo",pvo);
		mv.addObject("vo",vo);
		return mv;
		
		
	}
	
	@PostMapping("/MyPageUpdate")
	public ModelAndView myPageUpdate(UserVo userVo, PersonVo personVo, @RequestParam("address2") String address2) {
		
		
		
		
		
		String pwd = personVo.getPwd();
		if(pwd != null) {
			String add = personVo.getAddress();
			personMapper.updateMyInfo(personVo); 
			add +=  ", " + address2;
			System.out.println(add);
			personVo.setAddress(add);
			
			personMapper.updateMyInfo2(personVo);
			
			
		}else {
			
		}
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/MyPage");
		return mv;

		
	}
	
	@GetMapping("/PersonDelete")
	public ModelAndView personDelete(UserVo userVo) {
		personMapper.personDelete(userVo);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/MyPage");
		return mv;
		
	}
	
	@GetMapping("/MyPage/Resume/WriteForm")
	public ModelAndView resumeWriteForm(SkillVo skillVo) {
		
		List<SkillVo> skillList = resumeMapper.getSkillList(skillVo);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/person/resume_WriteForm");
		mv.addObject("skillList",skillList);
		return mv;
		
	}
	@PostMapping("/MyPage/Resume/Write")
	public ModelAndView resumeWrite(ResumeVo resumeVo) {
		
		
		System.out.println("===-----------------------======"+resumeVo);
			
		
		resumeMapper.insertResume(resumeVo);
		
//		System.out.println("이력서 스킬 넣는 중3333"+resumeSkillList);
		List<Resume_SkillVo> resumeSkillList = new ArrayList<>();
		String [] skillList = resumeVo.getSkill_idx().split(",");
//		System.out.println("이력서 스킬 넣는 중12"+Arrays.toString(skillList));
		for(String s_skill_idx : skillList ) {
			
			resumeSkillList.add(new Resume_SkillVo( Integer.parseInt(s_skill_idx)));			
		}
		System.out.println("이력서 스킬 넣는 중"+resumeSkillList);
		resumeMapper.insertResumeSkill(resumeSkillList);
		
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/MyPage");
		return mv;
		
	}
	
	@GetMapping("/Resume/View")
	public ModelAndView resumeView(ResumeVo resumeVo) {
		
		ResumeVo vo = resumeMapper.getView(resumeVo);
		ModelAndView mv = new ModelAndView();
		mv.addObject("vo", vo);
		mv.setViewName("/person/resume_View");
		return mv;
	}
	
	@GetMapping("/Resume/UpdateForm")
	public ModelAndView resumeUpdateForm(ResumeVo resumeVo,SkillVo skillVo) {
		
		List<SkillVo> skillList = resumeMapper.getSkillList(skillVo);
		//List<Resume_SkillVo> reskillList = resumeMapper.getReskillList(resume_SkillVo);
		
		ResumeVo vo = resumeMapper.getResumeDetailView(resumeVo);

		//System.out.println("==========================---------==========="+resumeUpdateVo);
		
		ModelAndView mv = new ModelAndView();
		//mv.addObject("reskillList",reskillList);
		mv.addObject("skillList",skillList);
		mv.addObject("vo",vo);
		mv.setViewName("/person/resume_Update");
		
		return mv;
		
	}
	@Transactional
	@PostMapping("/Resume/Update")
	public ModelAndView resumeUpdate(ResumeVo resumeVo ,@RequestParam("file") MultipartFile file,
			@Value("${file.upload-dir}") String uploadDir) {
		
		if (file != null && !file.isEmpty()) {
			try {
				// 파일 저장 경로 구성
				String baseDir = System.getProperty("user.dir");
				String imagesDirPath = baseDir + uploadDir; // application.properties에서 설정된 값을 사용

				File directory = new File(imagesDirPath);
				if (!directory.exists()) {
					directory.mkdirs();
				}
				DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyyMMdd");
				ZonedDateTime current = ZonedDateTime.now();
				String namePattern = current.format(format);

				// 파일의 원래 이름을 가져옵니다.
				String originalFileName = file.getOriginalFilename();
				// 파일 확장자를 추출합니다.
				String extension = "";
				if (originalFileName != null && originalFileName.contains(".")) {
					extension = originalFileName.substring(originalFileName.lastIndexOf("."));
				}

				// System.out.println(namePattern);
				String fileName = namePattern + "_" + originalFileName; //??
				//String fileName = originalFileName; //??
				String filePath = Paths.get(imagesDirPath, fileName).toString();

				// 파일 저장 //여기 문제 있음
				Files.copy(file.getInputStream(), Paths.get(filePath), StandardCopyOption.REPLACE_EXISTING);

				// 데이터베이스에 저장할 파일 경로 설정
				String relativePath = "/img/" + fileName;
				resumeVo.setImage(relativePath);

			} catch (IOException e) {
				e.printStackTrace();
				// 에러 처리 로직
			}
		} else {
			// 파일이 선택되지 않았거나 비어 있는 경우, 기본 이미지 경로를 사용
			String relativePath = "/img/logo_default.jpg";
			resumeVo.setImage(relativePath);
		
		}
		int resume_idx = resumeVo.getResume_idx();
		
		
		
		System.out.println("==========================="+resumeVo.getResume_idx());
		resumeMapper.updateResume(resumeVo);
		System.out.println("==========================="+resumeVo.getResume_idx());
		System.out.println("==========================="+resumeVo.getResume_idx());
		System.out.println("==========================="+resumeVo.getResume_idx());
		
		resumeMapper.deleteSkillByResumeIdx(resume_idx);
		System.out.println("==========================="+resumeVo.getResume_idx());
		System.out.println("==========================="+resumeVo.getResume_idx());
		
//		System.out.println("이력서 스킬 넣는 중3333"+resumeSkillList);
//		List<Resume_SkillVo> resumeSkillList = new ArrayList<>();
//		String [] skillList = resumeVo.getSkill_idx().split(",");
//		System.out.println("이력서 스킬 넣는 중12"+Arrays.toString(skillList));
//		for(String s_skill_idx : skillList ) {
			
//			resumeSkillList.add(new Resume_SkillVo( Integer.parseInt(s_skill_idx)));			
//		}
//		System.out.println("이력서 스킬 넣는 중"+resumeSkillList);
	
//		resumeMapper.insertResumeSkill(resumeSkillList);
		
//		String [] skillList = resumeVo.getSkill_idx().split(",");
//		for (String string : skillList) {
//			System.out.println(skillList);
//		}
//        String[] reskillIdxArray = skillIdxString.split(",");
//        
//        // 배열의 각 skill_idx에 대해 작업을 수행합니다.
//        for (String reskillIdx : reskillIdxArray) {
//            // skillIdx를 이용하여 작업을 수행하고, 예를 들어서 resumeVo를 업데이트합니다.
//            // 여기서는 예시로 resumeMapper.updateResume(resumeVo)를 호출합니다.
//            ResumeVo vo = new ResumeVo();
//            // updatedResumeVo에 필요한 데이터를 설정합니다.
//            vo.setReskill_idx(reskillIdx.trim()); // skill_idx를 Integer로 변환하여 설정
//            
//            // resumeMapper를 통해 업데이트 작업을 수행합니다.
//            resumeMapper.updateResumeSkill(vo);
		
		List<Resume_SkillVo> resumeSkillList = new ArrayList<>();
		String [] skillList = resumeVo.getSkill_idx().split(",");
		for(String s_skill_idx : skillList ) {
			
			resumeSkillList.add(new Resume_SkillVo( Integer.parseInt(s_skill_idx), resume_idx));			
			//resumeSkillList.add(new Resume_SkillVo( resume_idx));			
		}
		System.out.println("이력서 스킬 넣는 중"+resumeSkillList);
		resumeMapper.insertResumeSkill2(resumeSkillList);
		

		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/MyPage");
		return mv;
		
	}
	
	@GetMapping("/Resume/Delete")
	public ModelAndView resumeDelete(ResumeVo resumeVo) {
		
		resumeMapper.resumeDelete(resumeVo);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/MyPage");
		return mv;
		
	}
	@GetMapping("/Resume/GetrecommendList")
	public ModelAndView resumeRecommendList(RecommendPostVo recommendPostVo, ResumeVo resumeVo) {
		
		ResumeVo vo = resumeMapper.getResumeDetailView(resumeVo);
		List<RecommendPostVo> postList = resumeMapper.getPostList(recommendPostVo);
		ModelAndView mv = new ModelAndView();
		mv.addObject("vo",vo);
		mv.addObject("postList",postList);
		mv.setViewName("/person/recommendPost");
		return mv;
	}
	

	
	
	
}
