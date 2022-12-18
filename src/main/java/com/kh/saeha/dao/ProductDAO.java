package com.kh.saeha.dao;

import java.util.List;

import com.kh.saeha.vo.ProductVO;
import com.kh.saeha.vo.SearchCriteria;

public interface ProductDAO {

	// 굿즈 등록
	public void productwrite(ProductVO goodsVO) throws Exception;

	// 굿즈상품 리스트
	public List<ProductVO> goodslist(SearchCriteria scri) throws Exception;
	
	// 한복상품 리스트
	public List<ProductVO> hanboklist(SearchCriteria scri) throws Exception;
	
	// 등록 굿즈 조회
	public ProductVO read(int pd_bno) throws Exception;

	// 등록 굿즈 수정
	public void gupdate(ProductVO goodsVO) throws Exception;

	// 등록굿즈 삭제
	public void gdelete(int pd_bno) throws Exception;
	
	// 굿즈 총 개수
	public int glistCount(SearchCriteria scri) throws Exception;
	
	// 굿즈 조회수 증가
	public ProductVO readcount(int pd_bno) throws Exception;
	
	// 한복 총 개수
	public int hlistCount(SearchCriteria scri) throws Exception;

}
