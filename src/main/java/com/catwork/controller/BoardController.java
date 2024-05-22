package com.catwork.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.catwork.domain.BcommentVo;
import com.catwork.domain.BoardVo;
import com.catwork.domain.CBoardVo;
import com.catwork.domain.CcommentVo;
import com.catwork.domain.FaqVo;
import com.catwork.domain.HBoardVo;
import com.catwork.domain.HcommentVo;
import com.catwork.domain.Pagination;
import com.catwork.domain.PagingResponse;
import com.catwork.domain.PagingVo;
import com.catwork.domain.ResumeVo;
import com.catwork.domain.UserVo;
import com.catwork.mapper.BoardMapper;
import com.catwork.mapper.CommentMapper;
import com.catwork.mapper.PersonMapper;
import com.catwork.mapper.UserMapper;

@Controller
@RequestMapping("/Board")
public class BoardController {
	
	@Autowired
	private BoardMapper boardMapper;
	
	@Autowired
	private PersonMapper personMapper;
	
	@Autowired
	private CommentMapper commentMapper;
	
	@Autowired
	private UserMapper userMapper;
	
	
	// 커뮤니티 게시판 글 목록
	@RequestMapping("")
	public ModelAndView list(BoardVo boardVo,CBoardVo cBoardVo,HBoardVo hBoardVo,
							@RequestParam(value = "nowpage") int nowpage,
							@RequestParam(value = "nowpage2") int nowpage2,
							@RequestParam(value = "nowpage3") int nowpage3,
							@SessionAttribute("login") UserVo userVo
			) {		
		
		ModelAndView mv = new ModelAndView();
		
		int user_idx = userMapper.getUser_idx(userVo.getId());
		UserVo usertype = userMapper.getUserInfoById(user_idx);
		
		// 자유게시판 게시글
		List<BoardVo> boardList = boardMapper.getBoardList();
		mv.addObject("boardList",boardList);
		
		// 기업 Q&A 게시글
		List<CBoardVo> cBoardList = boardMapper.getcBoardList();
		mv.addObject("cBoardList", cBoardList);
	
		// 홈페이지 Q&A 게시글
		List<HBoardVo> hBoardList = boardMapper.gethBoardList();
		mv.addObject("hBoardList", hBoardList);
		
		// FAQ
		List<FaqVo> faqList = boardMapper.getList();
		mv.addObject("faqList", faqList);

		List<FaqVo> faqList2 = boardMapper.getList2();
		mv.addObject("faqList2",faqList2);
		
	      // 페이징
	      int count = boardMapper.countBoardList(boardList);
	      //int count = resumeListInfo.size();
	      PagingResponse<BoardVo> response = null;
	      if (count < 1) {
	         response = new PagingResponse<>(Collections.emptyList(), null);
	      }
	      
	      int count2 = boardMapper.countCboardList(cBoardList);
	      PagingResponse<CBoardVo> response2 = null;
	      if (count2 < 1) {
	         response2 = new PagingResponse<>(Collections.emptyList(), null);
	      }
	      
	      int count3 = boardMapper.countHboardList(hBoardList);
	      PagingResponse<HBoardVo> response3 = null;
	      if (count3 < 1) {
	         response3 = new PagingResponse<>(Collections.emptyList(), null);
	      }
	      
	      // 페이징을 위한 초기 설정값
	      PagingVo pagingVo = new PagingVo();
	      pagingVo.setPage(nowpage);
	      pagingVo.setPageSize(5);
	      pagingVo.setRecordSize(3);
	      
	      PagingVo pagingVo2 = new PagingVo();
	      pagingVo2.setPage(nowpage2);
	      pagingVo2.setPageSize(5);
	      pagingVo2.setRecordSize(3);
	      
	      PagingVo pagingVo3 = new PagingVo();
	      pagingVo3.setPage(nowpage3);
	      pagingVo3.setPageSize(5);
	      pagingVo3.setRecordSize(3);

	      // Pagination 객체를 생성해서 페이지 정보 계산 후 SearchDto 타입의 객체인 params에 계산된 페이지 정보 저장
	      Pagination pagination = new Pagination(count, pagingVo);
	      pagingVo.setPagination(pagination);
	      Pagination pagination2 = new Pagination(count2, pagingVo2);
	      pagingVo2.setPagination(pagination2);
	      Pagination pagination3 = new Pagination(count3, pagingVo3);
	      pagingVo3.setPagination(pagination3);

	      int offset = pagingVo.getOffset();
	      int pageSize = pagingVo.getPageSize();
	      
	      int offset2 = pagingVo2.getOffset();
	      int pageSize2 = pagingVo2.getPageSize();
	      
	      int offset3 = pagingVo3.getOffset();
	      int pageSize3 = pagingVo3.getPageSize();

	      List<BoardVo> pagingList = boardMapper.getBoardListPaging(offset, pageSize);
	      List<CBoardVo> pagingList2 = boardMapper.getCBoardListPaging(offset2, pageSize2);
	      List<HBoardVo> pagingList3 = boardMapper.getHBoardListPaging(offset3,pageSize3);
	      
	      response = new PagingResponse<>(pagingList, pagination);
	      response2 = new PagingResponse<>(pagingList2, pagination2);
	      response3 = new PagingResponse<>(pagingList3, pagination3);
	      
	      //response = new PagingResponse<>(pagingList, pagination, resumeListInfo, offset);
	      
	      //System.out.println("list: " + response.getList());
	      
	      mv.addObject("boardList", boardList);
	      mv.addObject("response", response);
	      mv.addObject("response2", response2);
	      mv.addObject("response3", response3);	  
	      mv.addObject("pagingVo", pagingVo);
	      mv.addObject("pagingVo2", pagingVo2);
	      mv.addObject("pagingVo3", pagingVo3);
	      mv.addObject("nowpage", nowpage);
	      mv.addObject("nowpage2", nowpage2);
	      mv.addObject("nowpage3", nowpage3);
	
		mv.setViewName("board/board");
				
		return mv;
	}
	
	// 자유게시판
	@RequestMapping("/PersonBoard")
	public ModelAndView search(@RequestParam(value="keyword",defaultValue = "none") String keyword,
												@SessionAttribute("login") UserVo userVo,
												@RequestParam(value = "nowpage") int nowpage){
		
		ModelAndView mv = new ModelAndView();
		int user_idx = userMapper.getUser_idx(userVo.getId());
		UserVo usertype = userMapper.getUserInfoById(user_idx);
		
		String origin = keyword;
		
		//검색어 공백 제거
		keyword = keyword.replaceAll(" ", "");
					
		// 보드 목록 가져오기
		List<BoardVo> resultList = new ArrayList<>();
		if(keyword.equals("none")) {
			resultList = boardMapper.getBoardList();	

		} else {
			resultList= boardMapper.getresultList(keyword); 
		}
		
		
		// 페이징
		int count= 0;
		
		// 검색어 별 count
		if(keyword.equals("none")) {
			count = boardMapper.countresult(resultList);
		} else {
			for(int i = 0; i < resultList.size(); i++) {
				count++;
			}
		}
		
		PagingResponse<BoardVo> response = null;
		if (count < 1) {
			response = new PagingResponse<>(Collections.emptyList(), null);
		}
		// 페이징을 위한 초기 설정값
		PagingVo pagingVo = new PagingVo();
		pagingVo.setPage(nowpage);
		pagingVo.setPageSize(5);
		pagingVo.setRecordSize(3);//

		// Pagination 객체를 생성해서 페이지 정보 계산 후 SearchDto 타입의 객체인 params에 계산된 페이지 정보 저장
		Pagination pagination = new Pagination(count, pagingVo);
		pagingVo.setPagination(pagination);

		int offset = pagingVo.getOffset();
		int pageSize = pagingVo.getPageSize();

		List<BoardVo> pagingList = new ArrayList<>();
		
		if(keyword.equals("none")) {
			pagingList = boardMapper.getResultListPaging(offset, pageSize);
		} else {
			pagingList = boardMapper.getResultListPagingSearch(offset, pageSize, keyword);
		}
		
		response = new PagingResponse<>(pagingList, pagination);
		//response = new PagingResponse<>(pagingList, pagination, resumeListInfo, offset);
		
		System.out.println("list: " + response.getList());
		
		//검색어 원래 값으로 돌리기
		keyword = origin;
		
		mv.addObject("response", response); 
	    mv.addObject("pagingVo", pagingVo);
	    mv.addObject("nowpage", nowpage);
	    mv.addObject("keyword", keyword);
	    mv.addObject("usertype", usertype);
		
		mv.setViewName("board/personboard");
		return mv;
		
		
		}	

	// 홈페이지 게시판
	@RequestMapping("/HomeBoard")
	public ModelAndView homeBoard(@RequestParam(value = "nowpage") int nowpage,
								@SessionAttribute("login") UserVo userVo,
								@RequestParam(value="keyword",defaultValue = "none") String keyword) {
		ModelAndView mv = new ModelAndView();
		
		int user_idx = personMapper.getUser_idx(userVo.getId());
		UserVo usertype = userMapper.getUserInfoById(user_idx);
		
		//검색어 공백 제거
		keyword = keyword.replaceAll(" ", "");
		
		// 홈페이지 Q&A 게시글 목록 가져오기
		List<HBoardVo> hBoardList = new ArrayList<>();
		if(keyword.equals("none")) {
			hBoardList = boardMapper.gethBoardList();	
		} else {
			hBoardList = boardMapper.getSearchHBoardList(keyword);
		}
		
		mv.addObject("hBoardList", hBoardList);
		
	      // 페이징
	      int count = boardMapper.countHboardList(hBoardList);
	      PagingResponse<HBoardVo> response = null;
	      if (count < 1) {
	         response = new PagingResponse<>(Collections.emptyList(), null);
	      }
	      
	      // 페이징을 위한 초기 설정값
	      PagingVo pagingVo = new PagingVo();
	      pagingVo.setPage(nowpage);
	      pagingVo.setPageSize(5);
	      pagingVo.setRecordSize(3);

	      // Pagination 객체를 생성해서 페이지 정보 계산 후 SearchDto 타입의 객체인 params에 계산된 페이지 정보 저장
	      Pagination pagination = new Pagination(count, pagingVo);
	      pagingVo.setPagination(pagination);

	      int offset = pagingVo.getOffset();
	      int pageSize = pagingVo.getPageSize();
	      
	      List<HBoardVo> pagingList =new ArrayList<>();

	      if(keyword.equals("none")) {
	    	  pagingList = boardMapper.getResultHListPaging(offset, pageSize);
	      } else {
	    	  pagingList = boardMapper.getHResultListPagingSearch(offset, pageSize, keyword);
	      }	         
	      
	      response = new PagingResponse<>(pagingList, pagination);
	      
	      mv.addObject("response", response); 
	      mv.addObject("pagingVo", pagingVo);
	      mv.addObject("nowpage", nowpage);
	      mv.addObject("usertype", usertype);
	
		mv.setViewName("board/homeboard");
				
		return mv;
	}
	
	// 기업게시판
	@RequestMapping("/CompanyBoard")
	public ModelAndView companyBoard( @RequestParam(value = "nowpage") int nowpage,
										@SessionAttribute("login") UserVo userVo,
										@RequestParam(value="keyword",defaultValue = "none") String keyword
										) {
		ModelAndView mv = new ModelAndView();
		
		int user_idx = personMapper.getUser_idx(userVo.getId());
		
		String origin = keyword;
		
		// 검색어 공백 제거
		keyword = keyword.replaceAll(" ", "");
		
		// 기업 Q&A 게시글
		List<CBoardVo> cBoardList = new ArrayList<>();
		if(keyword.equals("none")) {
			cBoardList = boardMapper.getcBoardList();	

		} else {
			cBoardList= boardMapper.getcresultList(keyword);
		}		
		mv.addObject("cBoardList", cBoardList);
		
	      // 페이징
	      int count = boardMapper.countCboardList(cBoardList);
	      PagingResponse<CBoardVo> response = null;
	      if (count < 1) {
	         response = new PagingResponse<>(Collections.emptyList(), null);
	      }
	      
	      // 페이징을 위한 초기 설정값
	      PagingVo pagingVo = new PagingVo();
	      pagingVo.setPage(nowpage);
	      pagingVo.setPageSize(5);
	      pagingVo.setRecordSize(3);

	      // Pagination 객체를 생성해서 페이지 정보 계산 후 SearchDto 타입의 객체인 params에 계산된 페이지 정보 저장
	      Pagination pagination = new Pagination(count, pagingVo);
	      pagingVo.setPagination(pagination);

	      int offset = pagingVo.getOffset();
	      int pageSize = pagingVo.getPageSize();
      
		  List<CBoardVo> pagingList = new ArrayList<>();
			
		  if(keyword.equals("none")) {
				pagingList = boardMapper.getCBoardListPaging(offset, pageSize);
		  } else {
				pagingList = boardMapper.getCResultListPagingSearch(offset, pageSize, keyword);
	      }
	      
	      response = new PagingResponse<>(pagingList, pagination);
	      UserVo usertype = userMapper.getUserInfoById(user_idx);
		  mv.addObject("usertype", usertype);
	      mv.addObject("response", response); 
	      mv.addObject("pagingVo", pagingVo);
	      mv.addObject("nowpage", nowpage);
	
		mv.setViewName("board/companyboard");
				
		return mv;
	}
	
	// 자주 묻는 질문
	@RequestMapping("/Faq")
	public ModelAndView faqBoard(@SessionAttribute("login") UserVo userVo) {
		ModelAndView mv = new ModelAndView();
		
		// FAQ
		List<FaqVo> faqList = boardMapper.getList();
		mv.addObject("faqList", faqList);

		List<FaqVo> faqList2 = boardMapper.getList2();
		mv.addObject("faqList2",faqList2);
		
		int user_idx = personMapper.getUser_idx(userVo.getId());
		mv.addObject("user_idx", user_idx);
		
		UserVo usertype = userMapper.getUserInfoById(user_idx);
		mv.addObject("usertype", usertype);

		
		mv.setViewName("board/faqboard");
		
		return mv;
	}
	
	// 자유게시판 글 작성폼
	@RequestMapping("/WriteForm")
	public ModelAndView WriteForm(@SessionAttribute("login") UserVo userVo) {
		ModelAndView mv = new ModelAndView();
		
		int user_idx = personMapper.getUser_idx(userVo.getId());
		mv.addObject("user_idx", user_idx);
		
		UserVo usertype = userMapper.getUserInfoById(user_idx);
		mv.addObject("usertype", usertype);
		mv.setViewName("board/write");
		return mv;
	}
	
	// 자유게시판 글 작성
	@RequestMapping("/Write")
	public ModelAndView Write(BoardVo boardVo,
			@SessionAttribute("login") UserVo userVo
			) {
		
		ModelAndView mv = new ModelAndView();
		boardMapper.insert(boardVo);
		
		mv.setViewName("redirect:/Board/PersonBoard?nowpage=1");
		
		return mv;
	}
	
	// 자유게시판 글 수정폼
	@RequestMapping("/UpdateForm")
	public ModelAndView updateForm(BoardVo boardVo
			,@RequestParam("board_idx") int board_idx
			,@SessionAttribute("login") UserVo userVo
			) {
		ModelAndView mv = new ModelAndView();
		
		int user_idx = userMapper.getUser_idx(userVo.getId());
		mv.addObject("user_idx", user_idx);
		UserVo usertype = userMapper.getUserInfoById(user_idx);
		mv.addObject("usertype", usertype);
		
		BoardVo vo = boardMapper.getboard(boardVo);
		mv.addObject("vo", vo);
		
		mv.setViewName("board/updateboard");
		return mv;
	}
	
	// 자유게시판 글 수정(세션 추가 예정)
	@RequestMapping("/Update")
	public ModelAndView update(BoardVo vo,@SessionAttribute("login") UserVo userVo) {
	
		ModelAndView mv = new ModelAndView();
		
		int user_idx = userMapper.getUser_idx(userVo.getId());
		UserVo usertype = userMapper.getUserInfoById(user_idx);
		
		boardMapper.updateboard(vo);
		mv.addObject("vo", vo);
		
		System.out.println("vo:  "+vo);
		System.out.println("uservo:  "+userVo);
		int board_idx = vo.getBoard_idx();
		mv.addObject("board_idx", board_idx);
		System.out.println("으아아아아아아아아아"+board_idx);

		mv.setViewName("redirect:/Board/View?board_idx="+board_idx);

		return mv;
	}
	
	//자유게시판 글 삭제
	@RequestMapping("/DeleteBoard")
	public ModelAndView deleteBoard(BoardVo vo,@SessionAttribute("login") UserVo userVo) {
		ModelAndView mv = new ModelAndView();
		
		int user_idx = userMapper.getUser_idx(userVo.getId());
		UserVo usertype = userMapper.getUserInfoById(user_idx);
		
		int board_idx = vo.getBoard_idx();
		
		boardMapper.deleteboard(board_idx);
		
		mv.setViewName("redirect:/Board/PersonBoard?nowpage=1");
		return mv;
	}
	
	// 자유게시판 글 상세페이지
	@RequestMapping("/View")
	public ModelAndView view(BoardVo boardVo, BcommentVo cvo,
			@SessionAttribute("login") UserVo userVo) {
		
		ModelAndView mv = new ModelAndView();
		
		// 조회수 증가
		boardMapper.ahit(boardVo);
		
		//System.out.println("alsdjfhlkjajsdhflkasdjflsa"+boardVo);
		// 자유게시판 특정 글 상세
		BoardVo vo = boardMapper.getboard(boardVo);
		
//		vo.setBoard_idx(boardVo.getBoard_idx());
		
		//System.out.println("vo:"+vo);
		//List<BcommentVo> bvo = boardMapper.getCommentView(cvo);
		//System.out.println("bvo:" + bvo);
		//System.out.println("alsdjfhlkjajsdhflkasdjflsa"+boardVo);
//		String id = "user";
//		int user_idx = personMapper.getUser_idx(id);
		//int bcomment_idx = cvo.getBcomment_idx();
		// \n -> <br>
//		String content = vo.getContent();
//		if(content != null) {
//			content = content.replace("\n","<br>");
//			vo.setContent(content);
//		}
		
//		//자유게시판 댓글	
//		BcommentVo bvo = commentMapper.getcomment(cvo);
//		mv.addObject("cvo", bvo);
		
		int user_idx = personMapper.getUser_idx(userVo.getId());
		mv.addObject("user_idx", user_idx);

		UserVo usertype = userMapper.getUserInfoById(user_idx);
		mv.addObject("usertype", usertype);
		
		// 자유게시판 댓글리스트
		List<BcommentVo> commentList = commentMapper.getcommentList(vo.getBoard_idx());
		System.out.println("commentList: " + commentList);
		mv.addObject("commentList", commentList);
		//mv.addObject("cvo",bcomment_idx);
		
		mv.addObject("vo",vo);
		//mv.addObject("bvo",bvo);
	
		mv.setViewName("board/view");
		return mv;
	}
	
	// 자유게시판 댓글 작성
	@RequestMapping("/Add")
	public ModelAndView add(BcommentVo vo
							,@RequestParam("id") String id) {
		
		ModelAndView mv = new ModelAndView();
		
		int user_idx = userMapper.getUser_idx(id);
		vo.setUser_idx(user_idx);
		mv.addObject("vo", vo);
		
		commentMapper.add(vo);
		
		int board_idx = vo.getBoard_idx();
	
		mv.setViewName("redirect:/Board/View?board_idx="+ board_idx);
		
		return mv;
	}
	
	// 자유게시판 댓글 수정
	@RequestMapping("/UpdateComment")
	public ModelAndView updateComment(BcommentVo vo
			,@SessionAttribute("login") UserVo userVo) {
		ModelAndView mv = new ModelAndView();
		
		int user_idx = userMapper.getUser_idx(userVo.getId());
		UserVo usertype = userMapper.getUserInfoById(user_idx);
		
		System.out.println("vo : " + vo);

		commentMapper.update(vo);
		System.out.println("vo : " + vo);
		mv.addObject(vo);
		
		int board_idx = vo.getBoard_idx();
		
		System.out.println("board_idx: " + board_idx);
	
		mv.setViewName("redirect:/Board/View?board_idx="+board_idx);
		return mv;
	}
	
	// 자유게시판 댓글 삭제
	@RequestMapping("/DeleteComment")
	public ModelAndView deleteComment(BcommentVo vo
			,@SessionAttribute("login") UserVo userVo) {
		ModelAndView mv = new ModelAndView();

		int user_idx = userMapper.getUser_idx(userVo.getId());
		UserVo usertype = userMapper.getUserInfoById(user_idx);
		
		//System.out.println("delete1: " + vo);
		
		commentMapper.delete(vo);
		
		//System.out.println("delete2: " + vo);
		
		int board_idx = vo.getBoard_idx();
		
		//System.out.println("delete3: " + vo);
		
		mv.setViewName("redirect:/Board/View?board_idx="+board_idx);
		return mv;
	}
	
	// 기업 Q&A 게시글 작성폼
	@RequestMapping("/CWriteForm")
	public ModelAndView cwriteForm(@SessionAttribute("login") UserVo userVo) {
		ModelAndView mv = new ModelAndView();
		int user_idx = personMapper.getUser_idx(userVo.getId());
		mv.addObject("user_idx", user_idx);
		
		UserVo usertype = userMapper.getUserInfoById(user_idx);
		mv.addObject("usertype", usertype);
		mv.setViewName("board/cwrite");
		return mv;
	}
	
	// 기업 Q&A 게시글 작성
	@RequestMapping("/CWrite")
	public ModelAndView cwrite(CBoardVo vo) {
		
		ModelAndView mv = new ModelAndView();
		boardMapper.cwrite(vo);
		
		mv.setViewName("redirect:/Board/CompanyBoard?nowpage=1");
	
		return mv;
	}
	
	// 기업 Q&A 상세페이지
	@RequestMapping("/CView")
	public ModelAndView view(CBoardVo cBoardVo,CcommentVo cvo
			, @SessionAttribute("login") UserVo userVo) {
		
		ModelAndView mv = new ModelAndView();
	
		//조회수 증가
		boardMapper.chit(cBoardVo);
			
		// 기업게시판 특정 글 상세
		CBoardVo vo = boardMapper.getcboard(cBoardVo);
		System.out.println("cvovo: " + vo);
		mv.addObject("vo", vo);
		
		// 기업게시판 댓글리스트
		List<CcommentVo> commentList = commentMapper.getccommentList(vo.getCboard_idx());
		mv.addObject("commentList",commentList);
		
		int user_idx = personMapper.getUser_idx(userVo.getId());
		mv.addObject("user_idx", user_idx);
		
		int ccommnet_idx = cvo.getCcomment_idx();
		mv.addObject("ccommnet_idx", ccommnet_idx);
		
		UserVo usertype = userMapper.getUserInfoById(user_idx);
		mv.addObject("usertype", usertype);
		
		mv.setViewName("board/cview");
		
		return mv;
	}
	
	// 기업게시판 글 수정폼
	@RequestMapping("/UpdateCForm")
	public ModelAndView updateForm(CBoardVo boardVo,
			@RequestParam("cboard_idx") int board_idx
			,@SessionAttribute("login") UserVo userVo) {
		ModelAndView mv = new ModelAndView();
		
		int user_idx = userMapper.getUser_idx(userVo.getId());
		UserVo usertype = userMapper.getUserInfoById(user_idx);
		mv.addObject("usertype", usertype);
		
		CBoardVo vo = boardMapper.getcboard(boardVo);
		mv.addObject("vo", vo);
		
		mv.setViewName("board/updatecboard");
		return mv;
	}
	
	// 기업게시판 글 수정(세션 추가 예정)
	@RequestMapping("/UpdateCBoard")
	public ModelAndView update(CBoardVo vo,@SessionAttribute("login") UserVo userVo) {
		
		ModelAndView mv = new ModelAndView();
		
		int user_idx = userMapper.getUser_idx(userVo.getId());

		UserVo usertype = userMapper.getUserInfoById(user_idx);
		
		boardMapper.updatecboard(vo);
		mv.addObject("vo", vo);
		
		int cboard_idx = vo.getCboard_idx();

		mv.setViewName("redirect:/Board/CView?cboard_idx="+cboard_idx);
		return mv;
	}
	
	// 기업게시판 글 삭제
	@RequestMapping("/DeleteCBoard")
	public ModelAndView deleteCBoard(CBoardVo vo,
			@SessionAttribute("login") UserVo userVo) {
		ModelAndView mv = new ModelAndView();
		
		int user_idx = userMapper.getUser_idx(userVo.getId());

		UserVo usertype = userMapper.getUserInfoById(user_idx);
		
		int cboard_idx = vo.getCboard_idx();
		
		boardMapper.deletecboard(cboard_idx);
		
		mv.setViewName("redirect:/Board/CompanyBoard?nowpage=1");
		return mv;
	}

	// 기업게시판 댓글 추가
	@PostMapping("/AddCComment")
	public ModelAndView addccomment(CcommentVo vo,@RequestParam("id") String id) {
		ModelAndView mv = new ModelAndView();
		
		int user_idx = userMapper.getUser_idx(id);
		vo.setUser_idx(user_idx);
		mv.addObject("vo", vo);
		
		commentMapper.addccomment(vo);
		
		int cboard_idx = vo.getCboard_idx();
		
		mv.setViewName("redirect:/Board/CView?cboard_idx="+cboard_idx);
		return mv;
	}
	
	// 기업게시판 댓글 수정
	@RequestMapping("/UpdateCComment")
	public ModelAndView updateCCommnet(CcommentVo vo
			,@SessionAttribute("login") UserVo userVo) {
		
		int user_idx = userMapper.getUser_idx(userVo.getId());

		UserVo usertype = userMapper.getUserInfoById(user_idx);
		
		ModelAndView mv = new ModelAndView();
		
		commentMapper.updateCComment(vo);
		mv.addObject("vo", vo);
		
		int cboard_idx = vo.getCboard_idx();
		
		mv.setViewName("redirect:/Board/CView?cboard_idx="+cboard_idx);
		return mv;
	}
	// 기업게시판 댓글 삭제
	@RequestMapping("/DeleteCComment")
	public ModelAndView deleteCComment(CcommentVo vo
			,@SessionAttribute("login") UserVo userVo) {
		ModelAndView mv = new ModelAndView();
		
		int user_idx = userMapper.getUser_idx(userVo.getId());

		UserVo usertype = userMapper.getUserInfoById(user_idx);
		
		commentMapper.deleteCComment(vo);
		
		int cboard_idx = vo.getCboard_idx();
		
		mv.setViewName("redirect:/Board/CView?cboard_idx="+cboard_idx);
		return mv;
	}
	
	// 홈페이지 Q&A 게시글 작성폼
	@RequestMapping("/HWriteForm")
	public ModelAndView hwriteForm(@SessionAttribute("login") UserVo userVo) {
		ModelAndView mv = new ModelAndView();
		int user_idx = personMapper.getUser_idx(userVo.getId());
		mv.addObject("user_idx", user_idx);
		
		UserVo usertype = userMapper.getUserInfoById(user_idx);
		mv.addObject("usertype", usertype);
		
		mv.setViewName("board/hwrite");
		return mv;
	}
	
	// 홈페이지 Q&A 게시글 작성
	@RequestMapping("/HWrite")
	public ModelAndView hwrite(HBoardVo vo) {
		
		ModelAndView mv = new ModelAndView();		
		boardMapper.hwrite(vo);
		System.out.println("lskdfldskdjf"+vo);
		
		mv.setViewName("redirect:/Board/HomeBoard?nowpage=1");
		return mv;
	}
	
	// 홈페이지 Q&A 상세페이지
	@RequestMapping("/HView")
	public ModelAndView hview(HBoardVo hBoardVo,HcommentVo hvo,
							@SessionAttribute("login") UserVo userVo) {
		ModelAndView mv = new ModelAndView();
				
		// 조회수 증가
		boardMapper.hhit(hBoardVo);
		
		// 홈 게시판 특정글 상세
		HBoardVo vo = boardMapper.gethboard(hBoardVo);
		mv.addObject("vo", vo);
		
		// 댓글 리스트 가져오기
		List<HcommentVo> commentList = commentMapper.gethcommentList(vo.getHboard_idx());
		mv.addObject("commentList",commentList);
		
		String id = "user";
//		int user_idx = personMapper.getUser_idx(id);
//		mv.addObject("user_idx", user_idx);
		
		int hcomment_idx = hvo.getHcomment_idx();
		mv.addObject("hcomment_idx", hcomment_idx);
		
		int user_idx = personMapper.getUser_idx(userVo.getId());
		mv.addObject("user_idx", user_idx);
		
		UserVo usertype = userMapper.getUserInfoById(user_idx);
		mv.addObject("usertype", usertype);
		
		mv.setViewName("board/hview");
		return mv;
	}
	
	// 홈 게시판 글 수정폼
	@RequestMapping("/UpdateHForm")
	public ModelAndView homeupdateForm(HBoardVo hBoardVo
			,@RequestParam("hboard_idx") int hboard_idx
			,@SessionAttribute("login") UserVo userVo) {
		ModelAndView mv = new ModelAndView();
		
		int user_idx = userMapper.getUser_idx(userVo.getId());
		UserVo usertype = userMapper.getUserInfoById(user_idx);
		mv.addObject("usertype", usertype);
		
		HBoardVo vo = boardMapper.gethboard(hBoardVo);
		mv.addObject("vo", vo);
		
		mv.setViewName("board/updatehboard");
		return mv;
	}
	
	// 홈 게시판 글 수정
	@RequestMapping("/UpdateHBoard")
	public ModelAndView homeupdate(HBoardVo vo
			,@SessionAttribute("login") UserVo userVo) {
		ModelAndView mv = new ModelAndView();
		
		int user_idx = userMapper.getUser_idx(userVo.getId());
		UserVo usertype = userMapper.getUserInfoById(user_idx);
		
		boardMapper.updatehboard(vo);
		mv.addObject("vo", vo);
		
		int hboard_idx = vo.getHboard_idx();
		
		mv.setViewName("redirect:/Board/HView?hboard_idx="+hboard_idx);
		return mv;
	}
	
	// 홈 게시판 글 삭제
	@RequestMapping("/DeleteHBoard")
	public ModelAndView deleteHBoard(HBoardVo vo
			,@SessionAttribute("login") UserVo userVo) {
		ModelAndView mv = new ModelAndView();
		
		int user_idx = userMapper.getUser_idx(userVo.getId());
		UserVo usertype = userMapper.getUserInfoById(user_idx);
		
		int hboard_idx = vo.getHboard_idx();
		
		boardMapper.deletehboard(hboard_idx);
		
		mv.setViewName("redirect:/Board/HomeBoard?nowpage=1");
		return mv;
	}

	// 홈페이지 Q&A 상세페이지 댓글추가
	@PostMapping("/AddHComment")
	public ModelAndView addhcomment(@RequestParam String id,HcommentVo vo) {
		ModelAndView mv = new ModelAndView();
		
		int user_idx = userMapper.getUser_idx(id);
		vo.setUser_idx(user_idx);
		mv.addObject("user_idx", user_idx);
		
		commentMapper.addhcomment(vo);
		
		int hboard_idx = vo.getHboard_idx();
		mv.setViewName("redirect:/Board/HView?hboard_idx="+hboard_idx);
		return mv;
	}
	
	// 홈페이지 Q&A 상세페이지 댓글 수정
	@RequestMapping("/UpdateHComment")
	public ModelAndView updateHcomment(HcommentVo vo) {
		System.out.println("hvo: " + vo);
		
		ModelAndView mv = new ModelAndView();
		
		commentMapper.updateHcomment(vo);
		//System.out.println("updatehvo: " + vo);
		mv.addObject("vo", vo);
		
		int hboard_idx = vo.getHboard_idx();
		System.out.println("hboard_idx: " + hboard_idx);
		
		mv.setViewName("redirect:/Board/HView?hboard_idx="+hboard_idx);
		return mv;
	}


	// 홈페이지 게시판 댓글 삭제
	@RequestMapping("/DeleteHComment")
	public ModelAndView deleteHComment(HcommentVo vo
			,@SessionAttribute("login") UserVo userVo) {
		ModelAndView mv = new ModelAndView();
		
		int user_idx = userMapper.getUser_idx(userVo.getId());
		UserVo usertype = userMapper.getUserInfoById(user_idx);
		
		commentMapper.deleteHComment(vo);
		
		int hboard_idx = vo.getHboard_idx();
		mv.setViewName("redirect:/Board/HView?hboard_idx="+hboard_idx);
		return mv;
	}

	// FAQ 
	@RequestMapping("/FAQ")
	public ModelAndView faq(@SessionAttribute("login") UserVo userVo) {
		ModelAndView mv = new ModelAndView();
		
		int user_idx = personMapper.getUser_idx(userVo.getId());
		mv.addObject("user_idx", user_idx);
		
		UserVo usertype = userMapper.getUserInfoById(user_idx);
		mv.addObject("usertype", usertype);

		mv.setViewName("board/faq");
		
		return mv;
	}
	

		
}


