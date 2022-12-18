package com.kh.saeha.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.saeha.vo.ProductVO;
import com.kh.saeha.vo.SearchCriteria;

@Repository
public class ProductDAOImpl implements ProductDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	// 상품 등록
	@Override
	public void productwrite(ProductVO goodsVO) throws Exception {
		sqlSession.insert("productMapper.insert", goodsVO);
	}
	
	
	// 굿즈 리스트
	@Override
	public List<ProductVO> goodslist(SearchCriteria scri) throws Exception {
		return sqlSession.selectList("productMapper.goodslist", scri);
	}
	
	// 한복 리스트
	@Override
	public List<ProductVO> hanboklist(SearchCriteria scri) throws Exception {
		
		return sqlSession.selectList("productMapper.hanboklist", scri);
	}
	
	// 상품 조회
	@Override
	public ProductVO read(int pd_bno) throws Exception {
		return sqlSession.selectOne("productMapper.read", pd_bno);
	}
	
	// 상품 수정
	@Override
	public void gupdate(ProductVO goodsVO) throws Exception {
		sqlSession.update("productMapper.update", goodsVO);
	}
	
	
	// 상품 삭제
	@Override
	public void gdelete(int pd_bno) throws Exception {
		sqlSession.delete("productMapper.delete", pd_bno);
	}

	// 굿즈 카운트
	@Override
	public int glistCount(SearchCriteria scri) throws Exception {
		return sqlSession.selectOne("productMapper.glistCount", scri);
	}

	// 상품 조회수
	@Override
	public ProductVO readcount(int pd_bno) throws Exception {
		return sqlSession.selectOne("productMapper.readCount", pd_bno);
	}

	// 한복 카운트
	@Override
	public int hlistCount(SearchCriteria scri) throws Exception {
		return sqlSession.selectOne("productMapper.hlistCount", scri);
	}



}
