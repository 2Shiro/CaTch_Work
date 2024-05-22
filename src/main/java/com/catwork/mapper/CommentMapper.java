package com.catwork.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.catwork.domain.BcommentVo;
import com.catwork.domain.CcommentVo;
import com.catwork.domain.HcommentVo;

@Mapper
public interface CommentMapper {

	List<BcommentVo> getcommentList(int board_idx);

	void update(BcommentVo vo);

	void delete(BcommentVo vo);

	void add(BcommentVo vo);

	List<CcommentVo> getccommentList(int cboard_idx);

	List<HcommentVo> gethBoardList(int hboard_idx);

	void addccomment(CcommentVo vo);

	BcommentVo getcomment(int board_idx);

	BcommentVo getcomment(BcommentVo cvo);

	BcommentVo getcomment();

	List<HcommentVo> gethcommentList(int hboard_idx);

	void addhcomment(HcommentVo vo);

	void updateHcomment(HcommentVo vo);

	void updateCComment(CcommentVo vo);

	void deleteCComment(CcommentVo vo);

	void deleteHComment(HcommentVo vo);

}
