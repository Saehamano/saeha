package com.kh.saeha.controller;

import java.io.File;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.saeha.service.ProductService;
import com.kh.saeha.vo.ProductVO;
import com.kh.saeha.vo.PageMaker;
import com.kh.saeha.vo.SearchCriteria;

@Controller
@RequestMapping("/sae_product/*")
public class ProductController {

	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);

	@Inject
	ProductService service;

	// 상품 메인화면
	@RequestMapping(value = "/productmain", method = RequestMethod.GET)
	public void productmain() throws Exception {
		logger.info("productmain");
	}

	// 상품 등록
	@RequestMapping(value = "/productwrite", method = RequestMethod.POST)
	public String productwrite(ProductVO prodcutVO) throws Exception {

		String fileName = null;
		MultipartFile uploadFile = prodcutVO.getUploadFile();
		if (!uploadFile.isEmpty()) {
			String originalFileName = uploadFile.getOriginalFilename();
			fileName = originalFileName;
			uploadFile.transferTo(new File(
					"C:\\spring_1123\\workspace_1\\saeha\\src\\main\\webapp\\resources\\productimg\\" + fileName));
		}
		prodcutVO.setPd_file(fileName);

		service.productwrite(prodcutVO);
		logger.info("write");
		return "sae_product/productmain";
	}

	// 굿즈상품 리스트
	@RequestMapping(value = "/goodslist", method = RequestMethod.GET)
	public String goodslist(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {
		logger.info("goodslist");
		model.addAttribute("goodslist", service.goodslist(scri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.glistCount(scri));

		model.addAttribute("gpageMaker", pageMaker);

		return "sae_product/goodslist";
	}

	// 한복상품 리스트
	@RequestMapping(value = "/hanboklist", method = RequestMethod.GET)
	public String hanboklist(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {
		logger.info("hanboklist");
		model.addAttribute("hanboklist", service.hanboklist(scri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.hlistCount(scri));

		model.addAttribute("hpageMaker", pageMaker);

		return "sae_product/hanboklist";
	}

	// 상품 등록 화면
	@RequestMapping(value = "/registerView", method = RequestMethod.GET)
	public void registerView() throws Exception {
		logger.info("registerView");
	}

	// 상품 상세보기
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public String read(ProductVO prodcutVO, @ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception {
		logger.info("read");

		model.addAttribute("read", service.read(prodcutVO.getPd_bno()));
		model.addAttribute("readcount", service.readcount(prodcutVO.getPd_bno()));
		model.addAttribute("scri", scri);

		return "sae_product/productView";
	}

	// 상품 삭제
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String delete(ProductVO prodcutVO, @ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr)
			throws Exception {
		logger.info("delete");
		String type = "g";
		if(prodcutVO.getPd_type().equals(type)) {
			service.gdelete(prodcutVO.getPd_bno());

			rttr.addAttribute("page", scri.getPage());
			rttr.addAttribute("perPageNum", scri.getPerPageNum());
			rttr.addAttribute("searchType", scri.getSearchType());
			rttr.addAttribute("keyword", scri.getKeyword());
			
			return "redirect:/sae_product/goodslist";
		} else {
			service.gdelete(prodcutVO.getPd_bno());
			rttr.addAttribute("page", scri.getPage());
			rttr.addAttribute("perPageNum", scri.getPerPageNum());
			rttr.addAttribute("searchType", scri.getSearchType());
			rttr.addAttribute("keyword", scri.getKeyword());
			
			return "redirect:/sae_product/hanboklist";
		}
	
	}

	// 상품 수정화면
	@RequestMapping(value = "/updateView", method = RequestMethod.GET)
	public String updateView(ProductVO prodcutVO, @ModelAttribute("scri") SearchCriteria scri, Model model)
			throws Exception {
		logger.info("updateView");

		model.addAttribute("update", service.read(prodcutVO.getPd_bno()));
		model.addAttribute("scri", scri);

		return "sae_product/productupdate";
	}

}
