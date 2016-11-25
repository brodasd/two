package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.zerock.domain.ReplyVO;
import org.zerock.persistence.ReplyDAOImpl;

@Service
public class ReplyService {

	@Autowired
	ReplyDAOImpl replyDAO;

	public void create(ReplyVO vo) throws Exception {
		replyDAO.create(vo);
	}

	public ReplyVO read(int bno) throws Exception { 
		return replyDAO.read(bno);
	}

	public void update(ReplyVO vo) throws Exception {
		replyDAO.update(vo);
	}

	public void delete(int rno) throws Exception {
		replyDAO.delete(rno);
	}

	public List<ReplyVO> list(int bno) throws Exception {
		return replyDAO.list(bno);
	}

}
