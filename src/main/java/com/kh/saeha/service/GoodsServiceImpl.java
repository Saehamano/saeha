package com.kh.saeha.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.saeha.dao.GoodsDAO;
import com.kh.saeha.vo.GoodsVO;
import com.kh.saeha.vo.SearchCriteria;


@Service
public class GoodsServiceImpl implements GoodsService {

	@Inject 
	private GoodsDAO dao;
	
	
	// 굿즈 등록
	@Override
	public void goodswrite(GoodsVO goodsVO) throws Exception {
		dao.goodswrite(goodsVO);
	}
	
	// 굿즈 리스트
	@Override
	public List<GoodsVO> goodslist(SearchCriteria scri) throws Exception {
		return dao.goodslist(scri);
	}
	
	// 굿즈 조회
	@Override
	public GoodsVO gread(String go_bno) throws Exception {
		return dao.gread(go_bno);
	}
	
	// 굿즈 수정
	@Override
	public void gupdate(GoodsVO goodsVO) throws Exception {
		dao.gupdate(goodsVO);
	}
	
	// 굿즈 삭제
	@Override
	public void gdelete(String go_bno) throws Exception {
		dao.gdelete(go_bno);
	}
	
	
	// 굿즈 총 개수
	@Override
	public int glistCount(SearchCriteria scri) throws Exception {
		return dao.glistCount(scri);
	}
	
	// 굿즈 조회수 증가
	@Override
	public GoodsVO readcount(String go_bno) throws Exception {
		return dao.readcount(go_bno);
	}
	
}
