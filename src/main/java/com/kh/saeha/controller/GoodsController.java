package com.kh.saeha.controller;



import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;

import org.apache.commons.io.FilenameUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.kh.saeha.service.GoodsService;
import com.kh.saeha.vo.GoodsVO;
import com.kh.saeha.vo.PageMaker;
import com.kh.saeha.vo.SearchCriteria;




@Controller
@RequestMapping("/sae_product/*")
public class GoodsController {

	private static final Logger logger = LoggerFactory.getLogger(GoodsController.class);
	
	@Inject
	GoodsService service;
	
		// 굿즈 등록
		@RequestMapping(value = "/goodswrite", method = RequestMethod.POST)
		public String goodswrite(GoodsVO goodsVo) throws Exception{
			
			
			String fileName=null;
			MultipartFile uploadFile = goodsVo.getUploadFile();
			if (!uploadFile.isEmpty()) {
				String originalFileName = uploadFile.getOriginalFilename();
				String ext = FilenameUtils.getExtension(originalFileName);	//확장자 구하기
				fileName=originalFileName+"."+ext;
				uploadFile.transferTo(new File("C:\\spring_1123\\workspace_1\\saeha\\src\\main\\webapp\\resources\\goodsimg\\" + fileName));
			}
			goodsVo.setGo_file(fileName);
		
			service.goodswrite(goodsVo);
			logger.info("write");
			return "redirect:/sae_product/goodslist";
		}
	
	// 굿즈상품 리스트
	@RequestMapping(value = "/goodslist", method = RequestMethod.GET)
	public String goodslist(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {
		logger.info("goodslist");
		model.addAttribute("goodslist", service.goodslist(scri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.glistCount(scri));
		
		model.addAttribute("pageMaker", pageMaker);
		
		return "sae_product/goodslist";
	}
	
	// 굿즈상품 등록 화면
	@RequestMapping(value = "/goodsregisterView", method = RequestMethod.GET)
	public void goodsregisterView() throws Exception {
		logger.info("goodsregisterView");
	}
	
	// 굿즈 상세보기
	@RequestMapping(value =  "/gread", method = RequestMethod.GET)
	public String read(GoodsVO goodsVO, @ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception{
		logger.info("gread");
		
		model.addAttribute("gread", service.gread(goodsVO.getGo_bno()));
		model.addAttribute("readcount", service.readcount(goodsVO.getGo_bno()));
		model.addAttribute("scri", scri);
		
		return "sae_product/goodsView";
	}

}
