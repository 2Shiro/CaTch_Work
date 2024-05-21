package com.catwork.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.catwork.domain.BcommentVo;
import com.catwork.domain.BoardVo;
import com.catwork.domain.CBoardVo;
import com.catwork.domain.FaqVo;
import com.catwork.domain.HBoardVo;
import com.catwork.domain.HcommentVo;

@Mapper
public interface BoardMapper {

	List<BoardVo> getBoardList();

	void ahit(BoardVo boardVo);

	BoardVo getboard(BoardVo boardVo);

	List<FaqVo> getList();

	List<FaqVo> getList2();

	void insert(BoardVo boardVo);

	void delete(BoardVo vo);

	List<CBoardVo> getcBoardList();

	List<HBoardVo> gethBoardList();

	void updateboard(BoardVo boardVo);

	void deleteboard(BoardVo vo);

	void cwrite(CBoardVo vo);

	void hwrite(HBoardVo vo);

	void chit(CBoardVo vo);

	CBoardVo getcboard(CBoardVo cBoardVo);

	int countBoardList(List<BoardVo> boardList);

	List<BoardVo> getBoardListPaging(int offset, int pageSize);

	int countCboardList(List<CBoardVo> cBoardList);

	int countHboardList(List<HBoardVo> hBoardList);

	List<CBoardVo> getCBoardListPaging(int offset, int pageSize);

	List<HBoardVo> getHBoardListPaging(int offset, int pageSize);

	List<BcommentVo> getCommentView(BcommentVo cvo);

	BcommentVo getCommentView(int bcomment_idx);

	void hhit(HBoardVo hBoardVo);

	HBoardVo gethboard(HBoardVo hBoardVo);

}
