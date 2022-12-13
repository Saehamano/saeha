package com.kh.saeha.controller;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/sae_boardn/*")
public class BoardnController {
//sae_boardn으로 들어오는 모든 파일 처리
	
	private static final Logger logger = LoggerFactory.getLogger(BoardnController.class);

		//공지게시판 목록을 보여줌
		@RequestMapping(value = "/nlist", method = RequestMethod.GET)
		public void nlist(Locale locale, Model model) {
			logger.info("공지게시판 보기 성공");
			
		}
		
		//공지게시판의 글 작성 폼을 보여줌
		@RequestMapping(value = "nwrite_view", method = RequestMethod.GET)
		public void nwrite_view() throws Exception {
			logger.info("nwrite_view");
		}
		
	}

