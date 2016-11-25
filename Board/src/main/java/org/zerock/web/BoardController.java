package org.zerock.web;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.UUID;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.zerock.domain.BoardVO;
import org.zerock.domain.SearchCriteria;
import org.zerock.service.BoardService;
import org.zerock.service.ReplyService;
import org.zerock.util.PageMaker;

@Controller
@RequestMapping(value = "/board/*")
public class BoardController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	@Autowired
	BoardService boardService;

	@Autowired
	ReplyService replyService;

	@GetMapping("/list")
	public void list(Model model, int page) throws Exception {
		logger.info("보드페이지호출.........");
		PageMaker pm = new PageMaker(page, boardService.count());
		model.addAttribute("list", boardService.listPage(page));
		model.addAttribute("count", boardService.count());
		model.addAttribute("page", pm);
	}

	@GetMapping("/listSearch")
	public String listSearch(Model model, @ModelAttribute SearchCriteria cri) throws Exception {
		// @ModelAttribute("cri")
		logger.info("보드페이지호출....search.....");

		logger.info(cri.toString());
		PageMaker pm = new PageMaker(cri.getPage(), boardService.searchCount(cri));

		model.addAttribute("list", boardService.search(cri));

		model.addAttribute("page", pm);

		return "/board/list";

	}

	@GetMapping("/view")
	public void view(int bno, Model model) throws Exception {
		model.addAttribute("read", boardService.read(bno));
		model.addAttribute("reply", replyService.list(bno));
	}

	@GetMapping("/register")
	public void register(Model model) throws Exception {
		logger.info("등록페이지.........");
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String createRegister(BoardVO vo) throws Exception {
		logger.info("등록합니다.");
		System.out.println(vo);
		boardService.create(vo);

		return "redirect:./list?page=1";
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String updateView(BoardVO vo) throws Exception {
		boardService.update(vo);
		return "redirect:./list?page=1";
	}

	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String delete(int bno) throws Exception {
		boardService.delete(bno);
		return "redirect:./list?page=1";
	}

	@PostMapping("/uploadFile")
	@ResponseBody // 이건 순수한문자열만 리턴해준다는 의미.
	public String uploadFile(MultipartFile file) throws Exception {

		UUID uid = UUID.randomUUID();

		String fileName = file.getOriginalFilename();

		String uploadName = uid + "_" + fileName;

		FileOutputStream fos = new FileOutputStream("C:\\zzz\\" + uploadName);

		IOUtils.copy(file.getInputStream(), fos);

		fos.close();

		return uploadName;
	}

	@GetMapping(value = "/show", produces = { "image/gif", "image/jpeg", "image/jpg", "image/png" }) // 마임타입
	public @ResponseBody byte[] show(String name) throws Exception {

		InputStream in = new FileInputStream("C:\\zzz\\" + name);

		return IOUtils.toByteArray(in);
		
		
	}

}
