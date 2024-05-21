//package com.catwork.controller;
//
//import java.io.File;
//import java.io.IOException;
//import java.nio.file.Files;
//import java.nio.file.Paths;
//import java.nio.file.StandardCopyOption;
//import java.time.ZonedDateTime;
//import java.time.format.DateTimeFormatter;
//import java.util.ArrayList;
//import java.util.Collections;
//import java.util.Iterator;
//import java.util.HashMap;
//import java.util.List;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.beans.factory.annotation.Value;
//import org.springframework.stereotype.Controller;
//import org.springframework.transaction.annotation.Transactional;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.multipart.MultipartFile;
//import org.springframework.web.servlet.ModelAndView;
//
//import com.catwork.domain.Pagination;
//import com.catwork.domain.PagingResponse;
//import com.catwork.domain.PagingVo;
//import com.catwork.domain.PersonApplyVo;
//import com.catwork.domain.PersonBookmarkVo;
//import com.catwork.domain.PersonVo;
//import com.catwork.domain.PostVo;
//import com.catwork.domain.RecommendPostVo;
//import com.catwork.domain.ResumeVo;
//import com.catwork.domain.Resume_SkillVo;
//import com.catwork.domain.SkillVo;
//import com.catwork.domain.UserVo;
//import com.catwork.mapper.PersonMapper;
//import com.catwork.mapper.ResumeMapper;
//import com.catwork.mapper.UserMapper;
//
//import jakarta.servlet.http.HttpServletRequest;
//
//@Controller
//public class PersonController2 {
//
//	@Autowired
//	private UserMapper userMapper;
//
//	@Autowired
//	private PersonMapper personMapper;
//
//	@Autowired
//	private ResumeMapper resumeMapper;
//
//	@GetMapping("/MyPage")
//	public ModelAndView personMypage(
//	    UserVo userVo, 
//	    PersonVo personVo, 
//	    ResumeVo resumeVo, 
//	    PersonApplyVo personApplyVo, 
//	    PersonBookmarkVo personbookmarkVo,
//	    @RequestParam(value = "nowpage", defaultValue = "1") int nowpage, 
//	    @RequestParam(value = "personNowpage", defaultValue = "1") int personNowpage,
//	    @RequestParam(value = "resumeNowpage", defaultValue = "1") int resumeNowpage,
//	    @RequestParam(value = "applyNowpage", defaultValue = "1") int applyNowpage,
//	    @RequestParam(value = "bookmarkNowpage", defaultValue = "1") int bookmarkNowpage,
//	    @RequestParam(value = "tab", defaultValue = "userinfo") String tab,
//	    HttpServletRequest request) {
//
//	    PersonVo pvo = personMapper.getPersonInfo(personVo, userVo);
//	    List<ResumeVo> resumeList = personMapper.getResumeList(resumeVo);
//	    List<PersonApplyVo> applyList = personMapper.getApplyList(personApplyVo);
//	    List<PersonBookmarkVo> bookmarkList = personMapper.getBookmarkList(personbookmarkVo);
//
//	    int count = resumeMapper.countResumeList(resumeList);
//	    int count1 = resumeMapper.countApplyList(applyList);
//	    int count2 = resumeMapper.countBookmarkList(bookmarkList);
//
//	    PagingResponse<ResumeVo> response = (count < 1) ? new PagingResponse<>(Collections.emptyList(), null) : null;
//	    PagingResponse<PersonApplyVo> response1 = (count1 < 1) ? new PagingResponse<>(Collections.emptyList(), null) : null;
//	    PagingResponse<PersonBookmarkVo> response2 = (count2 < 1) ? new PagingResponse<>(Collections.emptyList(), null) : null;
//
//	    PagingVo pagingVo = new PagingVo();
//	    pagingVo.setPage(personNowpage);
//	    pagingVo.setPageSize(3);
//	    pagingVo.setRecordSize(3);
//
//	    PagingVo pagingVo1 = new PagingVo();
//	    pagingVo1.setPage(applyNowpage);
//	    pagingVo1.setPageSize(2);
//	    pagingVo1.setRecordSize(2);
//
//	    PagingVo pagingVo2 = new PagingVo();
//	    pagingVo2.setPage(bookmarkNowpage);
//	    pagingVo2.setPageSize(2);
//	    pagingVo2.setRecordSize(2);
//
//	    Pagination pagination = new Pagination(count, pagingVo);
//	    pagingVo.setPagination(pagination);
//
//	    Pagination pagination1 = new Pagination(count1, pagingVo1);
//	    pagingVo1.setPagination(pagination1);
//
//	    Pagination pagination2 = new Pagination(count2, pagingVo2);
//	    pagingVo2.setPagination(pagination2);
//
//	    int offset = pagingVo.getOffset();
//	    int pageSize = pagingVo.getPageSize();
//
//	    int offset1 = pagingVo1.getOffset();
//	    int pageSize1 = pagingVo1.getPageSize();
//
//	    int offset2 = pagingVo2.getOffset();
//	    int pageSize2 = pagingVo2.getPageSize();
//
//	    List<ResumeVo> pagingList = resumeMapper.getResumeListPaging(offset, pageSize);
//	    response = new PagingResponse<>(pagingList, pagination);
//
//	    List<PersonApplyVo> pagingList1 = resumeMapper.getApplyListPaging(offset1, pageSize1);
//	    response1 = new PagingResponse<>(pagingList1, pagination1);
//
//	    List<PersonBookmarkVo> pagingList2 = resumeMapper.getBookmarkListPaging(offset2, pageSize2);
//	    response2 = new PagingResponse<>(pagingList2, pagination2);
//
//	    ModelAndView mv = new ModelAndView();
//	    mv.addObject("pvo", pvo);
//	    mv.addObject("resumeList", resumeList);
//	    mv.addObject("bookmarkList", bookmarkList);
//	    mv.addObject("applyList", applyList);
//	    mv.addObject("response", response);
//	    mv.addObject("pagingVo", pagingVo);
//	    mv.addObject("response1", response1);
//	    mv.addObject("pagingVo1", pagingVo1);
//	    mv.addObject("response2", response2);
//	    mv.addObject("pagingVo2", pagingVo2);
//	    mv.addObject("personNowpage", personNowpage);
//	    mv.addObject("resumeNowpage", resumeNowpage);
//	    mv.addObject("applyNowpage", applyNowpage);
//	    mv.addObject("bookmarkNowpage", bookmarkNowpage);
//
//	    mv.setViewName("/person/myPage");
//	    
//	    String isAjax = request.getHeader("X-Requested-With");
//	    if ("XMLHttpRequest".equals(isAjax)) {
//	        mv.setViewName("/person/myPageContentFragment");
//	    } else {
//	        mv.setViewName("/person/myPage");
//	    }
//	    
//	    return mv;
//	}
//	
////	@GetMapping("/MyPage")
////	public ModelAndView personMypage(
////	    UserVo userVo, 
////	    PersonVo personVo, 
////	    ResumeVo resumeVo, 
////	    PersonApplyVo personApplyVo, 
////	    PersonBookmarkVo personbookmarkVo,
////	    @RequestParam(value = "nowpage") int nowpage) {
////	    
////	    PersonVo pvo = personMapper.getPersonInfo(personVo, userVo);
////
////	    // 이력서 리스트 페이징
////	    List<ResumeVo> resumeList = personMapper.getResumeList(resumeVo);
////	    int resumeCount = resumeMapper.countResumeList(resumeList);
////	    PagingResponse<ResumeVo> resumeResponse = createPagingResponse(resumeList, resumeCount, nowpage);
////
////	    // 지원 리스트 페이징
////	    List<PersonApplyVo> applyList = personMapper.getApplyList(personApplyVo);
////	    int applyCount = personMapper.countApplyList(applyList); // countApplyList 메소드 필요
////	    PagingResponse<PersonApplyVo> applyResponse = createPagingResponse(applyList, applyCount, nowpage);
////
////	    // 북마크 리스트 페이징
////	    List<PersonBookmarkVo> bookmarkList = personMapper.getBookmarkList(personbookmarkVo);
////	    int bookmarkCount = personMapper.countBookmarkList(bookmarkList); // countBookmarkList 메소드 필요
////	    PagingResponse<PersonBookmarkVo> bookmarkResponse = createPagingResponse(bookmarkList, bookmarkCount, nowpage);
////
////	    ModelAndView mv = new ModelAndView();
////	    mv.addObject("pvo", pvo);
////	    mv.addObject("resumeResponse", resumeResponse);
////	    mv.addObject("applyResponse", applyResponse);
////	    mv.addObject("bookmarkResponse", bookmarkResponse);
////	    mv.addObject("nowpage", nowpage);
////
////	    mv.setViewName("/person/myPage");
////
////	    return mv;
////	}
////
////	private <T> PagingResponse<T> createPagingResponse(List<T> list, int count, int nowpage) {
////	    PagingResponse<T> response;
////	    if (count < 1) {
////	        response = new PagingResponse<>(Collections.emptyList(), null);
////	    } else {
////	        // 페이징을 위한 초기 설정값
////	        PagingVo pagingVo = new PagingVo();
////	        pagingVo.setPage(nowpage);
////	        pagingVo.setPageSize(3); // 각 리스트마다 페이지 크기를 다르게 설정할 수 있음
////	        pagingVo.setRecordSize(3);
////
////	        // Pagination 객체를 생성해서 페이지 정보 계산 후 PagingVo 타입의 객체에 계산된 페이지 정보 저장
////	        Pagination pagination = new Pagination(count, pagingVo);
////	        pagingVo.setPagination(pagination);
////
////	        int offset = pagingVo.getOffset();
////	        int pageSize = pagingVo.getPageSize();
////
////	        // 페이징된 리스트를 가져오는 로직
////	        List<T> pagingList = getPagedList(list, offset, pageSize);
////	        response = new PagingResponse<>(pagingList, pagination);
////	    }
////	    return response;
////	}
////
////	private <T> List<T> getPagedList(List<T> list, int offset, int pageSize) {
////	    int toIndex = Math.min(offset + pageSize, list.size());
////	    if (offset > list.size()) {
////	        return Collections.emptyList();
////	    }
////	    return list.subList(offset, toIndex);
////	}
//
//	@GetMapping("/MyPage/UpdateForm")
//	public ModelAndView myPageUpdateForm(UserVo userVo, PersonVo personVo) {
//		PersonVo pvo = personMapper.getPersonInfo(personVo,userVo);
//		PersonVo vo =personMapper.getPwd(personVo);
//		ModelAndView mv = new ModelAndView();
//		mv.setViewName("/person/myPageUpdate");
//		mv.addObject("pvo",pvo);
//		mv.addObject("vo",vo);
//		return mv;
//
//	}
//
//	@PostMapping("/MyPageUpdate")
//
//	public ModelAndView myPageUpdate(UserVo userVo, PersonVo personVo, @RequestParam("address2") String address2) {
//		
//		
//		
//		
//		
//		String pwd = personVo.getPwd();
//		if(pwd != null) {
//			String add = personVo.getAddress();
//			personMapper.updateMyInfo(personVo); 
//			add +=  ", " + address2;
//			System.out.println(add);
//			personVo.setAddress(add);
//			
//			personMapper.updateMyInfo2(personVo);
//			
//			
//		}else {
//			
//		}
//		
//		ModelAndView mv = new ModelAndView();
//		mv.setViewName("redirect:/MyPage");
//		return mv;
//
//		
//	}
//
//	@GetMapping("/PersonDelete")
//	public ModelAndView personDelete(UserVo userVo) {
//		personMapper.personDelete(userVo);
//		ModelAndView mv = new ModelAndView();
//		mv.setViewName("redirect:/MyPage");
//		return mv;
//
//	}
//
//	@GetMapping("/MyPage/Resume/WriteForm")
//	public ModelAndView resumeWriteForm(SkillVo skillVo) {
//		
//		List<SkillVo> skillList = resumeMapper.getSkillList(skillVo);
//
//		ModelAndView mv = new ModelAndView();
//		mv.setViewName("/person/resume_WriteForm");
//		mv.addObject("skillList",skillList);
//		return mv;
//
//	}
//
//	@PostMapping("/MyPage/Resume/Write")
//	public ModelAndView resumeWrite(ResumeVo resumeVo) {
//
//		System.out.println("===-----------------------======" + resumeVo);
//
//		resumeMapper.insertResume(resumeVo);
//
////		System.out.println("이력서 스킬 넣는 중3333"+resumeSkillList);
//		List<Resume_SkillVo> resumeSkillList = new ArrayList<>();
//		String[] skillList = resumeVo.getSkill_idx().split(",");
////		System.out.println("이력서 스킬 넣는 중12"+Arrays.toString(skillList));
//		for (String s_skill_idx : skillList) {
//
//			resumeSkillList.add(new Resume_SkillVo(Integer.parseInt(s_skill_idx)));
//		}
//		System.out.println("이력서 스킬 넣는 중" + resumeSkillList);
//		resumeMapper.insertResumeSkill(resumeSkillList);
//
//		ModelAndView mv = new ModelAndView();
//		mv.setViewName("redirect:/MyPage");
//		return mv;
//
//	}
//
//	@GetMapping("/Resume/View")
//	public ModelAndView resumeView(ResumeVo resumeVo) {
//
//		ResumeVo vo = resumeMapper.getView(resumeVo);
//		ModelAndView mv = new ModelAndView();
//		mv.addObject("vo", vo);
//		mv.setViewName("/person/resume_View");
//		return mv;
//	}
//
//	@GetMapping("/Resume/UpdateForm")
//	public ModelAndView resumeUpdateForm(ResumeVo resumeVo,SkillVo skillVo) {
//		
//		List<SkillVo> skillList = resumeMapper.getSkillList(skillVo);
//		//List<Resume_SkillVo> reskillList = resumeMapper.getReskillList(resume_SkillVo);
//		
//
//		ResumeVo vo = resumeMapper.getResumeDetailView(resumeVo);
//
//		//System.out.println("==========================---------==========="+resumeUpdateVo);
//		
//		ModelAndView mv = new ModelAndView();
//		//mv.addObject("reskillList",reskillList);
//		mv.addObject("skillList",skillList);
//		mv.addObject("vo",vo);
//		mv.setViewName("/person/resume_Update");
//		
//		return mv;
//
//	}
//	@Transactional
//	@PostMapping("/Resume/Update")
//	public ModelAndView resumeUpdate(ResumeVo resumeVo ,@RequestParam("file") MultipartFile file,
//			@Value("${file.upload-dir}") String uploadDir) {
//		
//		if (file != null && !file.isEmpty()) {
//			try {
//				// 파일 저장 경로 구성
//				String baseDir = System.getProperty("user.dir");
//				String imagesDirPath = baseDir + uploadDir; // application.properties에서 설정된 값을 사용
//
//				File directory = new File(imagesDirPath);
//				if (!directory.exists()) {
//					directory.mkdirs();
//				}
//				DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyyMMdd");
//				ZonedDateTime current = ZonedDateTime.now();
//				String namePattern = current.format(format);
//
//				// 파일의 원래 이름을 가져옵니다.
//				String originalFileName = file.getOriginalFilename();
//				// 파일 확장자를 추출합니다.
//				String extension = "";
//				if (originalFileName != null && originalFileName.contains(".")) {
//					extension = originalFileName.substring(originalFileName.lastIndexOf("."));
//				}
//
//				// System.out.println(namePattern);
//				String fileName = namePattern + "_" + originalFileName; //??
//				//String fileName = originalFileName; //??
//				String filePath = Paths.get(imagesDirPath, fileName).toString();
//
//				// 파일 저장 //여기 문제 있음
//				Files.copy(file.getInputStream(), Paths.get(filePath), StandardCopyOption.REPLACE_EXISTING);
//
//				// 데이터베이스에 저장할 파일 경로 설정
//				String relativePath = "/img/" + fileName;
//				resumeVo.setImage(relativePath);
//
//			} catch (IOException e) {
//				e.printStackTrace();
//				// 에러 처리 로직
//			}
//		} else {
//			// 파일이 선택되지 않았거나 비어 있는 경우, 기본 이미지 경로를 사용
//			String relativePath = "/img/logo_default.jpg";
//			resumeVo.setImage(relativePath);
//		
//		}
//		int resume_idx = resumeVo.getResume_idx();
//		
//		
//		
//
//
//		resumeMapper.updateResume(resumeVo);
//
//		
//		resumeMapper.deleteSkillByResumeIdx(resume_idx);
//
////		System.out.println("이력서 스킬 넣는 중3333"+resumeSkillList);
////		List<Resume_SkillVo> resumeSkillList = new ArrayList<>();
////		String [] skillList = resumeVo.getSkill_idx().split(",");
////		System.out.println("이력서 스킬 넣는 중12"+Arrays.toString(skillList));
////		for(String s_skill_idx : skillList ) {
//			
////			resumeSkillList.add(new Resume_SkillVo( Integer.parseInt(s_skill_idx)));			
////		}
////		System.out.println("이력서 스킬 넣는 중"+resumeSkillList);
//	
////		resumeMapper.insertResumeSkill(resumeSkillList);
//		
////		String [] skillList = resumeVo.getSkill_idx().split(",");
////		for (String string : skillList) {
////			System.out.println(skillList);
////		}
////        String[] reskillIdxArray = skillIdxString.split(",");
////        
////        // 배열의 각 skill_idx에 대해 작업을 수행합니다.
////        for (String reskillIdx : reskillIdxArray) {
////            // skillIdx를 이용하여 작업을 수행하고, 예를 들어서 resumeVo를 업데이트합니다.
////            // 여기서는 예시로 resumeMapper.updateResume(resumeVo)를 호출합니다.
////            ResumeVo vo = new ResumeVo();
////            // updatedResumeVo에 필요한 데이터를 설정합니다.
////            vo.setReskill_idx(reskillIdx.trim()); // skill_idx를 Integer로 변환하여 설정
////            
////            // resumeMapper를 통해 업데이트 작업을 수행합니다.
////            resumeMapper.updateResumeSkill(vo);
//		
//		List<Resume_SkillVo> resumeSkillList = new ArrayList<>();
//		String [] skillList = resumeVo.getSkill_idx().split(",");
//		for(String s_skill_idx : skillList ) {
//			
//			resumeSkillList.add(new Resume_SkillVo( Integer.parseInt(s_skill_idx), resume_idx));			
//			//resumeSkillList.add(new Resume_SkillVo( resume_idx));			
//
//		}
//		System.out.println("이력서 스킬 넣는 중"+resumeSkillList);
//		resumeMapper.insertResumeSkill2(resumeSkillList);
//		
//
//
//		ModelAndView mv = new ModelAndView();
//		mv.setViewName("redirect:/MyPage");
//		return mv;
//
//	}
//
//	@GetMapping("/Resume/Delete")
//	public ModelAndView resumeDelete(ResumeVo resumeVo) {
//
//		resumeMapper.resumeDelete(resumeVo);
//		ModelAndView mv = new ModelAndView();
//		mv.setViewName("redirect:/MyPage");
//		return mv;
//
//	}
//	@GetMapping("/Resume/GetrecommendList")
//	public ModelAndView resumeRecommendList(RecommendPostVo recommendPostVo, ResumeVo resumeVo, @RequestParam(value = "nowpage") int nowpage) {
//	    ResumeVo vo = resumeMapper.getResumeDetailView(resumeVo);
//	    List<RecommendPostVo> postList = resumeMapper.getPostList(recommendPostVo);
//
//	    // 이력서 리스트 페이징
//	    int count = resumeMapper.countRecommensPostList(resumeVo.getResume_idx());
//
//	    PagingResponse<RecommendPostVo> response;
//	    if (count < 1) {
//	        response = new PagingResponse<>(Collections.emptyList(), null);
//	    } 
//	        // 페이징을 위한 초기 설정값
//	        PagingVo pagingVo = new PagingVo();
//	        pagingVo.setPage(nowpage);
//	        pagingVo.setPageSize(1);
//	        pagingVo.setRecordSize(1);
//
//	        // Pagination 객체를 생성해서 페이지 정보 계산 후 SearchDto 타입의 객체인 params에 계산된 페이지 정보 저장
//	        Pagination pagination = new Pagination(count, pagingVo);
//	        pagingVo.setPagination(pagination);
//
//	        int offset = pagingVo.getOffset();
//	        System.out.println(offset);
//	        int pageSize = pagingVo.getPageSize();
//	        System.out.println(pageSize);
//
//	        List<RecommendPostVo> pagingList = resumeMapper.getPostListPaging(resumeVo.getResume_idx(),offset, pageSize);
//	        response = new PagingResponse<>(pagingList, pagination);
//
//	    ModelAndView mv = new ModelAndView();
//	    mv.addObject("response", response);
//	    mv.addObject("pagingVo", pagingVo);
//	    mv.addObject("nowpage", nowpage);
//	    mv.addObject("vo", vo);
//	    mv.addObject("postList", postList);
//	    mv.setViewName("/person/recommendPost");
//	    return mv;
//	}
//	
//	// 특정 구직자의 특정 공고에 지원하기( 중복 안되게 할것( 이미 지원한 공고라면 지원하기 버튼 없애는 방법 또는 지원하기 눌렀을때 이미
//	// 지원한 공고라고 알람 출력 ) )
//	@RequestMapping("/Person/JoinPost")
//	public ModelAndView joinpost(@RequestParam HashMap<String, Object> map/* , HttpServletRequest request */) {
//
//		int com_idx = Integer.parseInt((String.valueOf(map.get("com_idx"))));
//		int resume_idx = Integer.parseInt((String.valueOf(map.get("resume_idx"))));
//		int post_idx = Integer.parseInt((String.valueOf(map.get("post_idx"))));
//		//String user_idx = request.getUserPrincipal().getName(); // 현재 로그인한 사용자의 ID를 가져옵니다.
//		int user_idx = Integer.parseInt((String.valueOf(map.get("user_idx"))));	// HomeController 의 /Company/Viewpost 부분에서도 같이 지워줘야함
//		// 이미 지원한 공고인지 확인
//		boolean alreadyApplied = personMapper.checkIfAlreadyApplied(user_idx, post_idx);
//
//		ModelAndView mv = new ModelAndView();
//
//		if (alreadyApplied) {
//			// 이미 지원한 공고라면 알람을 출력하거나 다른 처리를 할 수 있습니다.
//			// 예를 들어, 사용자에게 메시지를 보여주는 페이지로 리디렉션
//			mv.addObject("message", "이미 지원한 공고입니다.");
//			mv.setViewName("redirect:/Company/Viewpost?post_idx=" + post_idx + "&com_idx=" + com_idx);
//		} else {
//			// 아직 지원하지 않은 공고라면 지원 로직을 진행
//			personMapper.insertProposal(resume_idx, post_idx);
//
//			// 뷰 이름 설정 (예: 공고 보기 페이지로 리디렉션)
//			mv.setViewName("redirect:/Company/Viewpost?post_idx=" + post_idx + "&com_idx=" + com_idx);
//		}
//
//		return mv;
//	}
//
//}
