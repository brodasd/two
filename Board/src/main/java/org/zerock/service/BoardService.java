package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.BoardVO;
import org.zerock.domain.SearchCriteria;
import org.zerock.persistence.BoardDAOImpl;

@Service
public class BoardService {

	@Autowired
	BoardDAOImpl boardDAO;

	public void create(BoardVO vo) throws Exception {
		boardDAO.create(vo);
	}

	public BoardVO read(int bno) throws Exception {
		return boardDAO.read(bno);

	}

	public void update(BoardVO vo) throws Exception {
		boardDAO.update(vo);
	}

	public void delete(int bno) throws Exception {
		boardDAO.delete(bno);
	}

	public List<BoardVO> listPage(int page) throws Exception {
		return boardDAO.page(page);
	}

	public int count() throws Exception {
		return boardDAO.count();

	}
	
	public int searchCount(SearchCriteria cri) throws Exception {
		return boardDAO.searchCount(cri);
	}

	public int countReply(int rno) throws Exception {
		return boardDAO.countReply(rno);
	}

	public List<BoardVO> search(SearchCriteria cri) throws Exception {
		return boardDAO.search(cri);
	}
}
