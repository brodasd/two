package org.zerock.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.zerock.domain.BoardVO;

public abstract class AbstractDAO<E, K> implements GenericDAO<E, K> {

	@Inject
	protected SqlSession sqlSession;
	
	protected String NAME;

	@Override
	public void create(E vo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert(NAME+".create", vo);
	}

	@Override
	public E read(K key) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAME+".read", key);
	}

	@Override
	public void update(E vo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update(NAME+".update", vo);
	}

	@Override
	public void delete(K key) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.delete(NAME+".delete", key);
		
	}
	

}
