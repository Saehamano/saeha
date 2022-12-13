package com.kh.saeha.dao;

import java.util.List;

import com.kh.saeha.vo.BoardnVO;

public interface BoardnDAO {

	//공지 게시판 글 목록을 불러온다
	public List<BoardnVO> list() throws Exception;
}
