package com.kh.saeha.dao;

import java.util.List;

import com.kh.saeha.vo.GoodsVO;
import com.kh.saeha.vo.SearchCriteria;

public interface GoodsDAO {

	// 굿즈 등록
	public void goodswrite(GoodsVO goodsVO) throws Exception;

	// 굿즈상품 리스트
	public List<GoodsVO> goodslist(SearchCriteria scri) throws Exception;

	// 등록 굿즈 조회
	public GoodsVO gread(String go_bno) throws Exception;

	// 등록 굿즈 수정
	public void gupdate(GoodsVO goodsVO) throws Exception;

	// 등록굿즈 삭제
	public void gdelete(String go_bno) throws Exception;
	
	// 굿즈 총 개수
	public int glistCount(SearchCriteria scri) throws Exception;
	
	// 굿즈 조회수 증가
	public GoodsVO readcount(String go_bno) throws Exception;

}
