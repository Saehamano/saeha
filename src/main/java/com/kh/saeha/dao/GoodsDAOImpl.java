package com.kh.saeha.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.saeha.vo.GoodsVO;
import com.kh.saeha.vo.SearchCriteria;

@Repository
public class GoodsDAOImpl implements GoodsDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	// 굿즈 등록
	@Override
	public void goodswrite(GoodsVO goodsVO) throws Exception {
		sqlSession.insert("goodsMapper.insert", goodsVO);
	}
	
	
	// 굿즈 리스트
	@Override
	public List<GoodsVO> goodslist(SearchCriteria scri) throws Exception {
		return sqlSession.selectList("goodsMapper.goodslist", scri);
	}
	
	// 굿즈 조회
	@Override
	public GoodsVO gread(String go_bno) throws Exception {
		return sqlSession.selectOne("goodsMapper.read", go_bno);
	}
	
	// 굿즈 수정
	@Override
	public void gupdate(GoodsVO goodsVO) throws Exception {
		sqlSession.update("goodsMapper.update", goodsVO);
	}
	
	
	// 굿즈 삭제
	@Override
	public void gdelete(String go_bno) throws Exception {
		sqlSession.delete("goodsMapper.delete", go_bno);
	}

	// 굿즈 카운트
	@Override
	public int glistCount(SearchCriteria scri) throws Exception {
		return sqlSession.selectOne("goodsMapper.listCount", scri);
	}


	@Override
	public GoodsVO readcount(String go_bno) throws Exception {
		return sqlSession.selectOne("goodsMapper.readCount", go_bno);
	}

}
