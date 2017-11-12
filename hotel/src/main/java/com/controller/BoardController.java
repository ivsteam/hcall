//package com.controller;
//
//import java.util.HashMap;
//import java.util.Map;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.bind.annotation.ResponseBody;
//import org.springframework.web.bind.annotation.RestController;
//
//import com.model.BoardVo;
//import com.service.BoardService;
//
//
//@RestController
//@RequestMapping("/board")
//public class BoardController {
//
//	@Autowired
//	private BoardService boardService;
//	
//	
//	/**
//	 * 
//	 * @param userid
//	 * @return
//	 */
//	@ResponseBody
//	@RequestMapping(value="/view")
//	public Map<String, Object> pageDetail(@RequestParam("userid") String userid){
//		
//		Map<String, Object> jsonObject = new HashMap<String, Object>();
//		BoardVo vo = boardService.userInfoData(userid);
//		
//		jsonObject.put("success", true);
//		jsonObject.put("viewData", vo);
//		
//		return jsonObject;
//	}
//	
//}
