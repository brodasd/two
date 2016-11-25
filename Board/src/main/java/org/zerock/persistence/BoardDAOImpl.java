package org.zerock.persistence;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.SearchCriteria;

@Repository
public class BoardDAOImpl extends AbstractDAO<BoardVO, Integer> implements BoardDAO {

	public BoardDAOImpl() {
		this.NAME = "org.zerock.persistence.BoardMapper";
	}

	public List<BoardVO> page(int page) throws Exception {

		if (page <= 0) {
			page = 1;
		}
		page = (page - 1) * 10;
		return sqlSession.selectList(NAME + ".listPage", page);
	}

	public int count() throws Exception {
		return sqlSession.selectOne(NAME + ".countPaging");
	}
	

	public int searchCount(SearchCriteria cri) throws Exception {
		return sqlSession.selectOne(NAME + ".listSearchCount", cri);
	}

	public int countReply(int rno) throws Exception {
		return sqlSession.selectOne(NAME + ".countReply", rno);
	}

	public List<BoardVO> search(SearchCriteria cri) throws Exception {
		
		
		return sqlSession.selectList(NAME + ".listSearch", cri);
	}
}
