package org.kh.first.member.model.service;

import java.util.ArrayList;

import org.kh.first.member.model.dao.MemberDao;
import org.kh.first.member.model.vo.Member;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("memberService")
public class MemberServiceImpl implements MemberService {
	//mybatis 연동객체 선언
	@Autowired
	private SqlSessionTemplate mybatisSession;
	@Autowired
	private MemberDao memberDao;

	@Override
	public Member selectLogin(Member member) {
	
		return memberDao.selectLogin(mybatisSession, member);
	}

	@Override
	public int insertMember(Member member) {
		int result = memberDao.insertMember(mybatisSession, member);
		/*if(result > 0)
			mybatisSession.commit();
		else
			mybatisSession.rollback();*/
		
		return result;
	}

	@Override
	public int updateMember(Member member) {
		int result = memberDao.updateMember(mybatisSession, member);
		
		return result;
	}

	@Override
	public int deleteMember(String userid) {
		int result = memberDao.deleteMember(mybatisSession, userid);
		
		return result;
	}

	@Override
	public ArrayList<Member> selectList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Member selectMember(String userid) {
		
		return memberDao.selectMember(mybatisSession, userid);
	}

}
