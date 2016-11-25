package org.zerock.web;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.zerock.domain.ReplyVO;
import org.zerock.service.ReplyService;

@Controller
@RequestMapping("/reply/*")
public class ReplyController {

	private static final Logger logger = LoggerFactory.getLogger(ReplyController.class);

	@Autowired
	ReplyService replyService;

	@RequestMapping(value = "/addReply", method = RequestMethod.POST)
	public @ResponseBody String addReply(ReplyVO vo) throws Exception {
		logger.info("addReply" + vo);
		replyService.create(vo);
		return "addReplySuccess";
	}

	@RequestMapping(value = "/updateReply", method = RequestMethod.POST)
	public String updateReply(ReplyVO vo) throws Exception {
		logger.info("updateReply" + vo);
		replyService.update(vo);
		return "redirect:./list?page=1";
	}

	@RequestMapping(value = "/delReply", method = RequestMethod.POST)
	public @ResponseBody String deleteReply(int rno) throws Exception {
		logger.info("del페이지호출" + rno);
		replyService.delete(rno);
		return "delReplySuccess";

	}

	@GetMapping(value = "/view")
	public @ResponseBody List<ReplyVO> view(int bno) throws Exception {
		return replyService.list(bno);

	}
}
