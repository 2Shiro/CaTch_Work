package com.catwork.controller;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
							@RequestParam(value = "nowpage") int nowpage) {		
		
		ModelAndView mv = new ModelAndView();
		
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
	      pagingVo.setPageSize(3);
	      pagingVo.setRecordSize(3);
	      
	      PagingVo pagingVo2 = new PagingVo();
	      pagingVo2.setPage(nowpage);
	      pagingVo2.setPageSize(3);
	      pagingVo2.setRecordSize(3);
	      
	      PagingVo pagingVo3 = new PagingVo();
	      pagingVo3.setPage(nowpage);
	      pagingVo3.setPageSize(3);
	      pagingVo3.setRecordSize(3);

	      // Pagination 객체를 생성해서 페이지 정보 계산 후 SearchDto 타입의 객체인 params에 계산된 페이지 정보 저장
	      Pagination pagination = new Pagination(count, pagingVo);
	      pagingVo.setPagination(pagination);

	      int offset = pagingVo.getOffset();
	      int pageSize = pagingVo.getPageSize();

	      List<BoardVo> pagingList = boardMapper.getBoardListPaging(offset, pageSize);
	      List<CBoardVo> pagingList2 = boardMapper.getCBoardListPaging(offset, pageSize);
	      List<HBoardVo> pagingList3 = boardMapper.getHBoardListPaging(offset,pageSize);
	      
	      response = new PagingResponse<>(pagingList, pagination);
	      response2 = new PagingResponse<>(pagingList2, pagination);
	      response3 = new PagingResponse<>(pagingList3, pagination);
	      
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
	
		mv.setViewName("board/board");
				
		return mv;
	}
	
	// 자유게시판 글 작성폼
	@RequestMapping("/WriteForm")
	public String WriteForm() {
		return "board/write";
	}
	
	// 자유게시판 글 작성
	@RequestMapping("/Write")
	public ModelAndView Write(BoardVo boardVo) {
		
		ModelAndView mv = new ModelAndView();
		boardMapper.insert(boardVo);
		
		mv.setViewName("redirect:/Board?nowpage=1");
		
		return mv;
	}
	
	// 자유게시판 글 수정폼
	@RequestMapping("/UpdateForm")
	public ModelAndView updateForm(BoardVo boardVo,@RequestParam("board_idx") int board_idx) {
		ModelAndView mv = new ModelAndView();
		
		BoardVo vo = boardMapper.getboard(boardVo);
		mv.addObject("vo", vo);
		
		mv.setViewName("board/updateboard");
		return mv;
	}
	
	// 자유게시판 글 수정(세션 추가 예정)
	@RequestMapping("/Update")
	public ModelAndView update(BoardVo vo) {
		
		ModelAndView mv = new ModelAndView();
		boardMapper.updateboard(vo);
		mv.addObject("vo", vo);
		
		int board_idx = vo.getBoard_idx();

		mv.setViewName("redirect:/Board/View?board_idx="+board_idx);
		return mv;
	}
	
	// 자유게시판 글 상세페이지
	@RequestMapping("/View")
	public ModelAndView view(BoardVo boardVo, BcommentVo cvo) {
		
		// 조회수 증가
		boardMapper.ahit(boardVo);
		
		System.out.println("alsdjfhlkjajsdhflkasdjflsa"+boardVo);
		// 자유게시판 특정 글 상세
		BoardVo vo = boardMapper.getboard(boardVo);
		
		vo.setBoard_idx(boardVo.getBoard_idx());
		
		//System.out.println("vo:"+vo);
		//List<BcommentVo> bvo = boardMapper.getCommentView(cvo);
		//System.out.println("bvo:" + bvo);
		//System.out.println("alsdjfhlkjajsdhflkasdjflsa"+boardVo);
		String id = "user";
		int user_idx = personMapper.getUser_idx(id);
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
		// 자유게시판 댓글리스트
		List<BcommentVo> commentList = commentMapper.getcommentList(vo.getBoard_idx());
		System.out.println("commentList: " + commentList);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("commentList", commentList);
		//mv.addObject("cvo",bcomment_idx);
		mv.addObject("user_idx", user_idx);
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
	public ModelAndView updateComment(BcommentVo vo) {
		ModelAndView mv = new ModelAndView();
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
	public ModelAndView deleteComment(BcommentVo vo) {
		ModelAndView mv = new ModelAndView();
		
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
	public ModelAndView cwriteForm() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("board/cwrite");
		return mv;
	}
	
	// 기업 Q&A 게시글 작성
	@RequestMapping("/CWrite")
	public ModelAndView cwrite(CBoardVo vo) {
		
		ModelAndView mv = new ModelAndView();
		boardMapper.cwrite(vo);
		
		mv.setViewName("redirect:/Board");
	
		return mv;
	}
	
	// 기업 Q&A 상세페이지
	@RequestMapping("/CView")
	public ModelAndView view(CBoardVo cBoardVo,CcommentVo cvo,@RequestParam String id ) {
		
		ModelAndView mv = new ModelAndView();
	
		//조회수 증가
		boardMapper.chit(cBoardVo);
		
		
		// 기업게시판 특정 글 상세
		CBoardVo vo = boardMapper.getcboard(cBoardVo);
		
		vo.setCboard_idx(cBoardVo.getCboard_idx());
		
		int user_idx = personMapper.getUser_idx(id);
		mv.addObject("user_idx", user_idx);
		
		// 기업게시판 댓글리스트
		List<CcommentVo> commentList = commentMapper.getccommentList(vo.getCboard_idx());
		mv.addObject("commentList",commentList);
		mv.addObject("vo", vo);
		mv.setViewName("board/cview");
		
		return mv;
	}
	
	// 홈페이지 Q&A 게시글 작성
	@RequestMapping("/HWrite")
	public ModelAndView hwrite(HBoardVo vo) {
		
		ModelAndView mv = new ModelAndView();		
		boardMapper.hwrite(vo);
		
		mv.setViewName("redirect:/Board?nowpage=1");
		return mv;
	}
	
	// 홈페이지 Q&A 상세페이지
	@RequestMapping("/HView")
	public ModelAndView hview(HBoardVo hBoardVo,HcommentVo hvo) {
		ModelAndView mv = new ModelAndView();
		
		// 조회수 증가
		boardMapper.hhit(hBoardVo);
		
		// 홈 게시판 특정글 상세
		HBoardVo vo = boardMapper.gethboard(hBoardVo);
		mv.addObject("vo", vo);
		
		// 댓글 리스트 가져오기
		List<HcommentVo> commentList = commentMapper.gethcommentList(vo.getHboard_idx());
		mv.addObject("commentList",commentList);
			
		mv.setViewName("board/hview");
		return mv;
	}
	
	// 
	@PostMapping("/AddCComment")
	public ModelAndView addccomment(CcommentVo vo) {
		ModelAndView mv = new ModelAndView();
		
		commentMapper.addccomment(vo);
		
		mv.setViewName("/Board");
		return mv;
	}
	
	// 홈페이지 Q&A

	// FAQ 
	@RequestMapping("/FAQ")
	public ModelAndView faq() {
		ModelAndView mv = new ModelAndView();

		mv.setViewName("board/faq");
		
		return mv;
	}

}
