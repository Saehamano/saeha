package com.kh.saeha.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.saeha.dao.ProductDAO;
import com.kh.saeha.vo.ProductVO;
import com.kh.saeha.vo.SearchCriteria;

@Service
public class ProductServiceImpl implements ProductService {

	@Inject
	private ProductDAO dao;

	// 굿즈 등록
	@Override
	public void productwrite(ProductVO goodsVO) throws Exception {
		dao.productwrite(goodsVO);
	}

	// 굿즈 리스트
	@Override
	public List<ProductVO> goodslist(SearchCriteria scri) throws Exception {
		return dao.goodslist(scri);
	}

	// 한복 리스트
	@Override
	public List<ProductVO> hanboklist(SearchCriteria scri) throws Exception {
		
		return dao.hanboklist(scri);
	}

	// 굿즈 조회
	@Override
	public ProductVO read(int pd_bno) throws Exception {
		return dao.read(pd_bno);
	}

	// 굿즈 수정
	@Override
	public void gupdate(ProductVO goodsVO) throws Exception {
		dao.gupdate(goodsVO);
	}

	// 굿즈 삭제
	@Override
	public void gdelete(int pd_bno) throws Exception {
		dao.gdelete(pd_bno);
	}

	// 굿즈 총 개수
	@Override
	public int glistCount(SearchCriteria scri) throws Exception {
		return dao.glistCount(scri);
	}

	// 굿즈 조회수 증가
	@Override
	public ProductVO readcount(int pd_bno) throws Exception {
		return dao.readcount(pd_bno);
	}
	
	// 한복 총 개수
	@Override
	public int hlistCount(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return dao.hlistCount(scri);
	}

}
