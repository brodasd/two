package org.zerock.web;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.BoardVO;
import org.zerock.persistence.BoardDAOImpl;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml" })
public class BoardTester {

	@Autowired
	BoardDAOImpl board;

	@Test
	public void createTest() throws Exception {
		BoardVO createVo = new BoardVO();
		createVo.setTitle("���̾�");
		createVo.setContent("���̾�");
		createVo.setWriter("���̾�");
		board.create(createVo);
	}

	@Test
	public void readTest() throws Exception {

		System.out.println(board.read(3));
	}

	@Test
	public void updateTest() throws Exception {
		BoardVO updateVo = new BoardVO();
		
		updateVo.setContent("���̾�");
		updateVo.setBno(3);
		board.update(updateVo);
	}

	@Test
	public void deleteTest() throws Exception {
		
		board.delete(3);
	}

}
