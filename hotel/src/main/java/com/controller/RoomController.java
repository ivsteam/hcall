//package com.controller;
//
//import java.util.HashMap;
//import java.util.Map;
//
//import javax.servlet.http.Cookie;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpSession;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.transaction.annotation.Transactional;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.ResponseBody;
//
//import com.model.ReqServiceMgrVo;
//import com.model.RoomVo;
//import com.privateMapper.INotifyMapper;
//import com.privateMapper.IReqServiceMgrMapper;
//import com.privateMapper.IRoomMapper;
//import com.service.RoomService;
//
//@Controller
//@RequestMapping("/room")
//public class RoomController {
//
//	@Autowired
//	private RoomService roomservice;
//
//	@Autowired
//	private IRoomMapper roomMapper;
//
//	@Autowired
//	private IReqServiceMgrMapper reqServiceMgrmapper;
//
//	
//	// [화상]==============================================================
//	@RequestMapping("/roomOnetoOne")
//	public String roomOnetoOne(Model model, HttpServletRequest request, HttpSession session) {
//
//		return "/room/roomOnetoOne";
//	}
//
//	@RequestMapping("/hTroomOnetoOne")
//	public String hTroomOnetoOne(Model model, HttpServletRequest request, HttpSession session) {
//
//		return "/room/hTroomOnetoOne";
//	}
//	
//	@RequestMapping("/reciveFaceChat")
//	public String ReciveFaceChat(Model model, HttpServletRequest request, HttpSession session) {
//		
//		Cookie[] cookies = request.getCookies();
//		String cValue = "";
//		if (cookies != null) {
//			for (int i = 0; i < cookies.length; i++) {
//				Cookie c = cookies[i];
//				// 저장된 쿠키 이름을 가져온다
//				String cName = c.getName();
//				// 쿠키값을 가져온다
//
//				if( cName.equals("hcallHTno")){
//					cValue = c.getValue();	
//				}
//			}
//		}
//		System.out.println("reqServiceMgrreqServiceMgrreqServiceMgrreqServiceMg="+ cValue);
//		
//		
//		
//		
//		ReqServiceMgrVo reqSvo = new ReqServiceMgrVo();
//		reqSvo.setRoom_no( Integer.parseInt(request.getParameter("cid")) );
//		reqSvo.setHotel_no(cValue);
//		reqServiceMgrmapper.reciveChat(reqSvo);
//		
//		RoomVo rvo = new RoomVo();
//		rvo.setRoom_no( Integer.parseInt(cValue) );
//		RoomVo roomInfoVo = roomMapper.selectReqChatInfo(rvo);
//		model.addAttribute("roomInfoVo", roomInfoVo);
//		
//		return "/room/reciveFaceChat";
//	}
//
//	@RequestMapping("/faceChat")
//	public String faceChat(Model model, HttpServletRequest request) {
//		
//		String htGuestId = request.getParameter("participation");
//		String uuid = request.getParameter("uuid");
//		String hno = request.getParameter("hno");
//
//		RoomVo rvo = new RoomVo();
//		rvo.setRoom_create_id(htGuestId);
//		rvo.setRoom_title(uuid);
//		rvo.setHotel_no(hno);
//		
//		Boolean isVal = roomservice.roomTxtChatCreateProc(rvo, "F");
//		if (isVal) {
//			model.addAttribute("htGuestId", htGuestId);
//			model.addAttribute("uuid", uuid);
//			model.addAttribute("success", true);
//		} else {
//			model.addAttribute("success", false);
//		}
//		
//		return "/room/faceChat";
//	}
//	
//
//	// [채팅]==============================================================
//
//	/**
//	 * 체팅 요청]
//	 * 
//	 * @param rVo
//	 * @return
//	 */
//	@Transactional
//	@ResponseBody
//	@RequestMapping(value = "/txtChatProc")
//	public Map<String, Object> txtChatProc(RoomVo rVo) {
//		Map<String, Object> jsonObject = new HashMap<String, Object>();
//
//		Boolean isVal = roomservice.roomTxtChatCreateProc(rVo, "T");
//
//		if (isVal) {
//			jsonObject.put("success", true);
//		} else {
//			jsonObject.put("success", false);
//		}
//
//		return jsonObject;
//	}
//
//	@RequestMapping("/txtChat")
//	public String roomFrm(Model model, HttpServletRequest request) {
//
//		String htGuestId = request.getParameter("participation");
//		String uuid = request.getParameter("uuid");
//		String hno = request.getParameter("hno");
//
//		RoomVo rvo = new RoomVo();
//		rvo.setRoom_create_id(htGuestId);
//		rvo.setRoom_title(uuid);
//		rvo.setHotel_no(hno);
//		
//		Boolean isVal = roomservice.roomTxtChatCreateProc(rvo, "T");
//		if (isVal) {
//			model.addAttribute("htGuestId", htGuestId);
//			model.addAttribute("uuid", uuid);
//			model.addAttribute("success", true);
//		} else {
//			model.addAttribute("success", false);
//		}
//
//		return "/room/txtChat";
//	}
//
//	@RequestMapping("/reciveTxtChat")
//	public String ReciveTxtChat(Model model, HttpServletRequest request, HttpSession session) {
//		
//		Cookie[] cookies = request.getCookies();
//		String cValue = "";
//		if (cookies != null) {
//			for (int i = 0; i < cookies.length; i++) {
//				Cookie c = cookies[i];
//				// 저장된 쿠키 이름을 가져온다
//				String cName = c.getName();
//				// 쿠키값을 가져온다
//
//				if( cName.equals("hcallHTno")){
//					cValue = c.getValue();	
//				}
//			}
//		}
//		System.out.println("reqServiceMgrreqServiceMgrreqServiceMgrreqServiceMg="+ cValue);
//		
//		
//		
//		
//		ReqServiceMgrVo reqSvo = new ReqServiceMgrVo();
//		reqSvo.setRoom_no( Integer.parseInt(request.getParameter("cid")) );
//		reqSvo.setHotel_no(cValue);
//		reqServiceMgrmapper.reciveChat(reqSvo);
//		
//		RoomVo rvo = new RoomVo();
//		rvo.setRoom_no( Integer.parseInt(request.getParameter("cid")) );
//		RoomVo roomInfoVo = roomMapper.selectReqChatInfo(rvo);
//		model.addAttribute("roomInfoVo", roomInfoVo);
//		
//		return "/room/reciveTxtChat";
//	}
//
//}
