package com.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.model.HotelUserVo;
import com.publicMapper.IHotelMemberMapper;
import com.util.EncodingUtil;

import lombok.extern.java.Log;

@Log
@Service
public class MemberService {

//	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	// == Service ======================================================
//	@Autowired
//	private IMemberMapper memberMapper;
	
	@Autowired
	private IHotelMemberMapper memberMapper;
	// == method ======================================================
	
	/*
	 * ***** login *****
	 */
	public HotelUserVo loginEmail(HotelUserVo hotelMemberVo) throws Exception {
		// TODO login Email
		log.info(" $$$$- loginEmail -$$$$ ");
		log.info(" - memberVo : " + hotelMemberVo);
		EncodingUtil util = new EncodingUtil();
		
		String pw = hotelMemberVo.getPwd();
		
		hotelMemberVo.setPwd(util.encrypt(pw));
		hotelMemberVo = memberMapper.loginEmail(hotelMemberVo);
		System.out.println("hotelMemberVo========="+ hotelMemberVo);
		if( !pw.equals(util.decrypt(hotelMemberVo.getPwd())) ) return null;
		
		return memberMapper.loginEmail(hotelMemberVo);
	}
	
//	/**
//	 * 회원가입] 처리
//	 * 
//	 * @param params
//	 */
//	public Boolean joinMember(MemberVo mvo) {
//
//		Boolean isJoin = false;
//		if (mvo.getGuestPwd().equals(mvo.getGuestPwd_Re() )) {
//			
//			mvo.setGuestPwd(SecurityUtils.sha256(mvo.getGuestPwd()));
//			
//			int joinVal = memberMapper.insertMember(mvo);
//			if (joinVal > 0) {
//				isJoin = true;
//			} else {
//				isJoin = false;
//			}
//		}
//		return isJoin;
//	}
//
//	/**
//	 * 회원가입] ID 중복 체크
//	 * 
//	 * @param mvo
//	 * @return
//	 */
//	public Boolean EmailChk(MemberVo mvo) {
//		MemberVo result = memberMapper.selectOne(mvo);
//		if (result == null) {
//			return true;
//		} else {
//			if( "Y".equals(result.getGuest_draw() ) ){
//				return false;	
//			}
//			return false;
//		}
//	}
	
//	public String changeUserPw( MemberVo vo ){
//		
//		logger.info("============" +  vo.getMemId());
//		String dataVal = "";
//		MemberVo resultVo = memberMapper.selectOne(vo);
//		try {
//			
//			if( resultVo != null ){
//				
//				if( vo.getMemId() != resultVo.getMemId() ){
//					dataVal = "아이디(Email)정보가 틀립니다.";	
//				}else{
//					resultVo.setMemRePw(vo.getMemPw());
//					memberMapper.updateMemberPassword(resultVo);
//					dataVal = "정상처리되었습니다.";
//				}
//				
//			}else{
//				dataVal = "아이디(Email)정보가 틀립니다.";
//			}	
//		} catch (Exception e) {
//			// TODO: handle exception
//			dataVal = "처리중 오류가 발생하였습니다.";
//		}
//		
//		return dataVal;
//	}
//	
//	public String updateMemberEmail(MemberVo mvo, String userEmail) {
//		String resultMsg = "";
//		// 이메일 주소를 변경한경우
//		if (memberMapper.updateMemberEmail(mvo) > 0) {
//			resultMsg = "개인정보 변경이 정상처리되었습니다.";
//		} else {
//			resultMsg = "개인정보 변경중 오류가 발생하였습니다. ";
//		}
//		return resultMsg;
//	}
//	
//	public String updateMemberName(MemberVo mvo, String userEmail) {
//		String resultMsg = "";
//		// 이메일 주소를 변경한경우
//		if (memberMapper.updateMemberName(mvo) > 0) {
//			resultMsg = "개인정보 변경이 정상처리되었습니다.";
//		} else {
//			resultMsg = "개인정보 변경중 오류가 발생하였습니다. ";
//		}
//		return resultMsg;
//	}
//	
//	public String updateMemberPassword(MemberVo mvo) {
//		String resultMsg = "";
//		MemberVo chkUserPw = memberMapper.selectPersionInfo(mvo);
//		
//		if( chkUserPw == null ){
//			resultMsg = "현재 비밀번호가 틀려 정보를 변경 할수없습니다. ";
//		}else{
//			int resultVal = memberMapper.updateMemberPassword(mvo);
//			if( resultVal > 0 ){
//				resultMsg = "개인정보 변경이 정상처리되었습니다.";
//			}else{
//				resultMsg = "개인정보 변경중 오류가 발생하였습니다. "; 
//			}
//		}
//		return resultMsg;
//	}
//	
//	
//	
//	
//	
//	/**
//	 * 로그인] 처리
//	 * 
//	 * @param mvo
//	 * @return
//	 */
//	public boolean login(MemberVo mvo, HttpSession session) {
//		
//		HashMap<String, Object> map = new HashMap<String, Object>();
//		MemberVo result = memberMapper.selectOne(mvo);
//
//		if (result == null) {
//			return false;
//		} else {
//			String oPwd = (String) result.getMemPw();
//			if ("Y".equals(result.getMemDrawYn())) {
//				return false;
//			}else if (oPwd == null) {
//				return false;
//			} else {
//				if (oPwd.equals(mvo.getMemPw())) {
//					
//					session.setAttribute("userId", result.getMemId());
//					session.setAttribute("userEmail", result.getMemEmail());
//					session.setAttribute("userNm", result.getMemNm());
//					session.setAttribute("userLevel", result.getMemLevel());
//					
//					/*result = memberMapper.selectGroupOne(map);
//					session.setAttribute("groupNm", result.getMgrTitle());*/		
//					
//					 Enumeration<String> E = session.getAttributeNames();
//					  while (E.hasMoreElements()) {
//						String string = (String) E.nextElement();
//						logger.info("1============" + "**"+string+">>>>>>"+session.getAttribute(string)+"******");
//					  } 
//					
//					return true;
//					
//				} else {
//					return false;
//				}
//			}
//
//		}
//	}
//
//	
//	/**
//	 * 회원가입] 그룹명 중복 체크
//	 * 
//	 * @param mvo
//	 * @return
//	 */
//	public Boolean GroupChk(MemberVo mvo) {
//		MemberVo result = memberMapper.selectGroup(mvo);
//		if (result == null) {
//			return true;
//		} else {
//			return false;
//		}
//	}
//	
//	

}
