package com.kh.saeha.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.saeha.dao.BoardnDAO;
import com.kh.saeha.vo.BoardnVO;

@Service 
public class BoardnServiceImpl implements BoardnService{
	
	@Inject
	private BoardnDAO dao;

	//게시글 목록 조회
	@Override
	public List<BoardnVO> list() throws Exception {
		// TODO Auto-generated method stub
		return dao.list();
	}

}
