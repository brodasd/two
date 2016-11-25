package org.zerock.persistence;

public interface GenericDAO<E, K> {

	public void create(E vo) throws Exception;

	public E read(K key) throws Exception;

	public void update(E vo) throws Exception;

	public void delete(K key) throws Exception;

	
}
