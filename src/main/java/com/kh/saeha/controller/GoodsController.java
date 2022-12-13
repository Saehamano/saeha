package com.kh.saeha.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/sae_product/*")
public class GoodsController {
	
	
	
	private static final Logger logger = LoggerFactory.getLogger(GoodsController.class);
	
	
	
	@RequestMapping(value = "/hi", method = RequestMethod.GET)
	public void writeView() throws Exception{
		logger.info("sae_product");
	}
	
}
