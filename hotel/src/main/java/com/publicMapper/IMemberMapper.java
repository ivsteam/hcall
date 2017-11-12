package com.publicMapper;

import java.util.HashMap;
import java.util.List;

import com.model.MemberVo;

public interface IMemberMapper {

	public MemberVo selectOne(MemberVo mvo);
	
	public int insertMember(MemberVo mvo);
	
	public int selectDupCheckID(MemberVo mvo);
	
//	============================================


	public int updateMemberPassword(MemberVo mvo);

	public int updateMemberDraw(MemberVo mvo) throws Exception;
	
	public int updateMemberEmail(MemberVo mvo);
	
	public int updateMemberName(MemberVo mvo);

	public int deleteMember(String id);


	public MemberVo selectOneMemId(MemberVo mvo);

	public MemberVo selectPersionInfo(MemberVo mvo);

	public List<HashMap<String, Object>> selectAll();
	
	public MemberVo selectGroup(MemberVo mvo);
	
	// 회원 가입 시 그룹 생성시 회원 가입 쿼리, 그룹 생성 쿼리, 가입 한 회원에게 새로 생성된 그룹 추가 쿼리의 세 단계를 동시에 진행 
	public int insertMemberAndGroup(MemberVo mvo); // 회원 가입 
	public int insertGroup(MemberVo mvo); // 그룹 생성 
	public int updateMgrId(MemberVo mvo); // 회원에게 신규 그룹 업데이트
	
    // 그룹 정보 추출 하기
    public MemberVo selectGroupOne(HashMap<String, Object> map);

    
    public MemberVo selectFindUserPw(MemberVo vo);

    public MemberVo selectOneMemChk(MemberVo vo);
}
