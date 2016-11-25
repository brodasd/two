package org.zerock.persistence;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.zerock.domain.BoardVO;
import org.zerock.domain.ReplyVO;
import org.zerock.domain.SearchCriteria;

@Repository
public class ReplyDAOImpl extends AbstractDAO<ReplyVO, Integer> implements ReplyDAO {
	public ReplyDAOImpl() {
		this.NAME = "org.zerock.persistence.replyMapper";
	}

	public List<ReplyVO> list(int bno) throws Exception {
		return sqlSession.selectList(NAME + ".list", bno);
	}
}
