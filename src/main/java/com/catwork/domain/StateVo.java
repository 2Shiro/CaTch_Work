package com.catwork.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@ToString
@NoArgsConstructor
@AllArgsConstructor
public class StateVo {
	private int state_idx;
	private int resume_idx;
	private int apply_idx;
	private int score;
	private String comments;
	private int user_idx;
	
	private int state;

	public int getState_idx() {
		return state_idx;
	}

	public void setState_idx(int state_idx) {
		this.state_idx = state_idx;
	}

	public int getResume_idx() {
		return resume_idx;
	}

	public void setResume_idx(int resume_idx) {
		this.resume_idx = resume_idx;
	}

	public int getApply_idx() {
		return apply_idx;
	}

	public void setApply_idx(int apply_idx) {
		this.apply_idx = apply_idx;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public int getUser_idx() {
		return user_idx;
	}

	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}
	
	
}
