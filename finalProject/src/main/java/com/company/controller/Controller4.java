package com.company.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.company.answer.service.AnswerService;
import com.company.answer.service.AnswerVO;
import com.company.board.service.BoardSearchVO;
import com.company.board.service.BoardService;
import com.company.board.service.BoardVO;
import com.company.common.FileRenamePolicy;
import com.company.common.Paging;
import com.company.common.PagingVOCr4;
import com.company.eventAndNotice.service.EventAndNoticeSearchVO;
import com.company.eventAndNotice.service.EventAndNoticeService;
import com.company.eventAndNotice.service.EventAndNoticeVO;
import com.company.member.service.MemberService;
import com.company.member.service.MemberVO;
import com.company.question.service.QuestionService;
import com.company.question.service.QuestionVO;

/*
 * @author 김찬영
 * 
 * 
 * */
@Controller
public class Controller4 {

	// 서비스
	@Autowired
	MemberService memberService; // 맴버
	@Autowired
	BoardService boardService; // 게시판
	@Autowired
	EventAndNoticeService eventAndNoticeService; // 이벤트 & 공지사항
	@Autowired
	QuestionService questionService; // 신고하기 관리자가 확인.
	@Autowired
	AnswerService answerService;

	// 컨트롤러 4의 페이지로 가기
	@GetMapping("/getSearchCr4")
	public String getSearchCr4() {

		return "admin/getSearchCr4";

	}

	// ####★★맴버에 관한 컨트롤러★★
	// 맴버전체조회
	@RequestMapping("/getSearchMember")
	public String getSearchMember(MemberVO vo, Model model) {
		model.addAttribute("list", memberService.getSearchMember(vo));
		return "member/getSearchMember";
	}

	// 맴버 단건조회
	@GetMapping("/getMemberCr4")
	public String getMember(MemberVO vo, Model model) {
		// session 값 조회
		System.out.println(vo);
		// 맴버정보 조회
		memberService.getMemberCr4(vo);
		model.addAttribute("getMemberCr4", memberService.getMemberCr4(vo));
		return "member/getMemberCr4";
	}
//	//맴버 입력-> 내가만드는거 아님.
//	@GetMapping("/insertMember")
//	public String insertMember(MemberVO vo) {
//		return "member/insertMember";
//	}
//	//맴버입력 -> 내가 만드는거 아님.
//	@PostMapping("/inserMember")
//	public String insertMemberProc(MemberVO vo) {
//		memberService.insertMember(vo);
//		return "redirect:/getSearchMember";
//	}

//	}
	@PostMapping("/deleteMember")
	public String deleteMemberProc(MemberVO vo) {
		System.out.println("맴버삭제 vo " + vo);
		memberService.deleteMember(vo);
		return "redirect:getSearchMember";
	}

	// ###★★게시판에 관한 컨트롤러★★

	//////////////////////////////////////////////////////////////
	// 자유게시판 시작 (1번)
	//////////////////////////////////////////////////////////////

	// 게시판 전체조회 관리자 -- 삭제확인
	@RequestMapping("/getSearchBoard")
	public String getSearchBoard(Model model, BoardVO vo) {

		model.addAttribute("list", boardService.getSearchBoard(vo));
		System.out.println(vo);
		return "board/getSearchBoard";

	}

	// 1번 자유게시판 조회
	@GetMapping("/getSearchBoardCategiry1")
	public String getSearchBoardCategiry1(PagingVOCr4 vo, Model model,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage) {

		int total = boardService.countBoard();
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "5";
		}
		vo = new PagingVOCr4(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", vo);
		model.addAttribute("board", boardService.getSearchBoardCategiry1(vo));
		return "board/getSearchBoardCategiry1";
	}

	// 1번 자유게시판 단건 조회
	@GetMapping("/getBoard")
	public String getBoard(Model model, BoardVO vo) {
		model.addAttribute("board", boardService.getBoard(vo));

		// 조회수 +1
		boardService.updateViews(vo);

		return "board/getBoard";
	}

	// 자유게시판 수정 폼
	@GetMapping("/updateBoard")
	public String updateBoard(BoardVO vo, Model model) {
		System.out.println("관리자 게시판관리 수정 updateBoard의 vo " + vo);
		boardService.getBoard(vo);
		model.addAttribute("board", boardService.getBoard(vo));
		return "board/updateBoard";
	}

	// 자유게시판 수정 처리
	@PostMapping("/updateBoard")
	public String updateBoardProc(BoardVO vo, HttpServletRequest request) throws IllegalStateException, IOException {
		System.out.println(vo);
		// 첨부파일처리
		// pom, servlet에 추가
		MultipartFile[] images = vo.getUploadFile();
	
		String filenames = "";
		boolean start = true;
		String path = request.getSession().getServletContext().getRealPath("/resources/images/board1");
		// 내 소스 파일에 바로 업로드(servlet-context.xml에 추가해야함)
		// 새로운 파일이 등록되었는지 확인
		String category = vo.getCategory();
		for (MultipartFile image : images) {
			if (image.getOriginalFilename() != null && !image.getOriginalFilename().equals("") && image.getSize() > 0) {
				String filename = image.getOriginalFilename();
				// 파일명 중복체크 -> rename
				File rename = FileRenamePolicy.rename(new File(path, filename));
				// 업로드된 파일명
				// rename.getName()
				if (!start) {
					filenames += ",";
				} else {
					start = false;
				}
				filenames += rename.getName();
				// 파일명을 읽어내는게 getName()
				// 임시폴더에서 업로드 폴더로 파일이동
				image.transferTo(rename); // transferTo:이동한다는뜻 괄호안에 업로드 위치를 정함)

			} else {
				// 새로운 파일이 등록되지않았다면
				// 기존이미지를 그대로 사용
				vo.setImage(request.getParameter("image"));

			}
		}
		vo.setImage(filenames);
		System.out.println("관리자 게시판관리 수정 updateBoard의 vo2의 " + vo);
		boardService.updateBoard(vo);

		return "redirect:getBoard?boardNumber=" + vo.getBoardNumber();

	}

	// 게시판 삭제
	@PostMapping("/deleteBoard")
	public String deleteBoard(BoardVO vo, HttpServletRequest request) {
		System.out.println("삭제 vo " + vo);
		boardService.deleteBoard(vo);
		String old_url = request.getHeader("Referer");
		// 이벤트 삭제시
		if (old_url.contains("getBoard2")) {
			return "redirect:/getSearchBoardCategiry2Form";
			// 공지사항 삭제시
		} else {
			return "redirect:/getSearchBoardCategiry1";

		}
	}

	// 1번 자유게시판 글쓰기
	@GetMapping("/insertBoard")
	public String insertBoard() {
		return "board/insertBoard";
	}

	// 1번 자유게시판 글쓰기 처리
	@PostMapping("/insertBoard")
	public String insertBoardProc(BoardVO vo, HttpServletRequest request) throws IllegalStateException, IOException {
		System.out.println(vo);
		// 첨부파일처리
		// pom, servlet에 추가
		MultipartFile[] images = vo.getUploadFile();
		MultipartFile t_image = vo.getT_uploadFile();
		String filenames = "";
		boolean start = true;
		String path = request.getSession().getServletContext().getRealPath("/resources/images/board1");
		// 내 소스 파일에 바로 업로드(servlet-context.xml에 추가해야함)
		for (MultipartFile image : images) {
			if (image != null && !image.isEmpty() && image.getSize() > 0) {
				String filename = image.getOriginalFilename();
				// 파일명 중복체크 -> rename
				File rename = FileRenamePolicy.rename(new File(path, filename));
				// 업로드된 파일명
				// rename.getName()
				if (!start) {
					filenames += ",";
				} else {
					start = false;
				}
				filenames += rename.getName();
				// 파일명을 읽어내는게 getName()
				// 임시폴더에서 업로드 폴더로 파일이동
				image.transferTo(rename); // transferTo:이동한다는뜻 괄호안에 업로드 위치를 정함)

			}
		}
		vo.setImage(filenames);

//			String path="resources/images";
		boardService.insertBoard(vo);
		return "redirect:/getSearchBoardCategiry1";
	}

	//////////////////////////////////////////////////////////////
	// 2번 자랑하기게시판으로 가기
	//////////////////////////////////////////////////////////////
	// 자랑하기게시판으로 가기

	@RequestMapping("/getSearchBoardCategiry2Form")
	public String getSearchBoardCategiry2Form(BoardVO vo) {
		return "board/getSearchBoardCategiry2";

	}

	// 2번 자랑하기게시판리스트(ajax)
	@RequestMapping("/getSearchBoardCategiry2")
	@ResponseBody
	public Map<String, Object> getSearchBoardCategiry2(BoardSearchVO vo, Paging paging) {
		Map<String, Object> map = new HashMap<String, Object>();
		// 1. 페이지 설정
		paging.setPageUnit(6); // 한페이지에 출력되는 레코드 건수
		paging.setPageSize(10); // 보이는 페이지 번호
		// 2.초기페이지 설정
		if (paging.getPage() == null)
			paging.setPage(1);
		// 3. 값 추가
		paging.setTotalRecord(boardService.getCount(vo));
		vo.setStart(paging.getFirst());
		vo.setEnd(paging.getLast());
		List<BoardVO> list = boardService.getSearchBoardCategiry2(vo);
		map.put("paging", paging);
		map.put("list", list);
		//
		return map;
	}// end of getSearchBoardCategiry2

	// 2번 자랑하기 단건 조회
	@GetMapping("/getBoard2")
	public String getBoard2(Model model, BoardVO vo) {
		model.addAttribute("board", boardService.getBoard(vo));

		// 조회수 +1
		boardService.updateViews(vo);

		return "board/getBoard2";
	}

	// 자랑하기 수정 폼
	@GetMapping("/updateBoard2")
	public String updateBoard2(BoardVO vo, Model model) {
		System.out.println("관리자 게시판관리 수정 updateBoard2의 vo " + vo);
		boardService.getBoard2(vo);
		model.addAttribute("board", boardService.getBoard2(vo));
		return "board/updateBoard2";
	}

	// 자랑하기 수정 처리
	@PostMapping("/updateBoard2")
	public String updateBoard2Proc(BoardVO vo, HttpServletRequest request) throws IllegalStateException, IOException {
		// 첨부파일처리
		// pom, servlet에 추가
		MultipartFile[] images = vo.getUploadFile();
		MultipartFile t_image = vo.getT_uploadFile();
		String filenames = "";
		boolean start = true;
		String path = request.getSession().getServletContext().getRealPath("/resources/images/board2");
		// 내 소스 파일에 바로 업로드(servlet-context.xml에 추가해야함)
		// 새로운 파일이 등록되었는지 확인
		String category = vo.getCategory();
		for (MultipartFile image : images) {
			if (image.getOriginalFilename() != null && !image.getOriginalFilename().equals("") && image.getSize() > 0) {
				String filename = image.getOriginalFilename();
				// 파일명 중복체크 -> rename
				File rename = FileRenamePolicy.rename(new File(path, filename));
				// 업로드된 파일명
				// rename.getName()
				if (!start) {
					filenames += ",";
				} else {
					start = false;
				}
				filenames += rename.getName();
				// 파일명을 읽어내는게 getName()
				// 임시폴더에서 업로드 폴더로 파일이동
				image.transferTo(rename); // transferTo:이동한다는뜻 괄호안에 업로드 위치를 정함)

			} else {
				// 새로운 파일이 등록되지않았다면
				// 기존이미지를 그대로 사용
				vo.setImage(request.getParameter("image"));

			}
		}
		vo.setImage(filenames);
		if (t_image.getOriginalFilename() != null && !t_image.getOriginalFilename().equals("")
				&& t_image.getSize() > 0) {
			String filename = t_image.getOriginalFilename();
			// 파일명 중복체크 -> rename
			File rename = FileRenamePolicy.rename(new File(path, filename));
			// 업로드된 파일명
			// rename.getName()
			// 파일명을 읽어내는게 getName()
			// 임시폴더에서 업로드 폴더로 파일이동
			t_image.transferTo(rename); // transferTo:이동한다는뜻 괄호안에 업로드 위치를 정함)
			vo.setT_image(rename.getName());
		} else {
			// 새로운 파일이 등록되지않았다면
			// 기존이미지를 그대로 사용
			vo.setT_image(request.getParameter("t_image"));
		}
//			String path="resources/images";
		System.out.println("관리자 게시판관리 수정 updateBoard2의 vo2의 " + vo);
		boardService.updateBoard2(vo);

		// 자유게시판 수정시
		return "redirect:getBoard2?boardNumber=" + vo.getBoardNumber();
	}

	// 2번 자랑하기 글쓰기 폼
	@GetMapping("/insertBoard2")
	public String insertBoard2() {

		return "board/insertBoard2";
	}

	// 2번 자랑하기 글쓰기 처리
	@PostMapping("/insertBoard2")
	public String insertBoard2Proc(BoardVO vo, HttpServletRequest request) throws IllegalStateException, IOException {
		System.out.println(vo);
		// 첨부파일처리
		// pom, servlet에 추가
		MultipartFile[] images = vo.getUploadFile();
		MultipartFile t_image = vo.getT_uploadFile();
		String filenames = "";
		boolean start = true;
		String path = request.getSession().getServletContext().getRealPath("/resources/images/board2");
		// 내 소스 파일에 바로 업로드(servlet-context.xml에 추가해야함)
		for (MultipartFile image : images) {
			if (image != null && !image.isEmpty() && image.getSize() > 0) {
				String filename = image.getOriginalFilename();
				// 파일명 중복체크 -> rename
				File rename = FileRenamePolicy.rename(new File(path, filename));
				// 업로드된 파일명
				// rename.getName()
				if (!start) {
					filenames += ",";
				} else {
					start = false;
				}
				filenames += rename.getName();
				// 파일명을 읽어내는게 getName()
				// 임시폴더에서 업로드 폴더로 파일이동
				image.transferTo(rename); // transferTo:이동한다는뜻 괄호안에 업로드 위치를 정함)

			}
		}
		vo.setImage(filenames);

		if (t_image != null && !t_image.isEmpty() && t_image.getSize() > 0) {
			String filename = t_image.getOriginalFilename();
			// 파일명 중복체크 -> rename
			File rename = FileRenamePolicy.rename(new File(path, filename));
			// 업로드된 파일명
			// rename.getName()
			// 파일명을 읽어내는게 getName()
			// 임시폴더에서 업로드 폴더로 파일이동
			t_image.transferTo(rename); // transferTo:이동한다는뜻 괄호안에 업로드 위치를 정함)
			vo.setT_image(rename.getName());
		}
//			String path="resources/images";
		boardService.insertBoard2(vo);
		return "redirect:/getSearchBoardCategiry2Form";
	}

	// ####★★이벤트&공지사항 에 관한 컨트롤러 ★★

	// 이벤트&공지사항 조회
	@RequestMapping("/getSearchEventAndNotice")
	public String getSearchEventAndNotice(EventAndNoticeVO vo, Model model) {
		model.addAttribute("list", eventAndNoticeService.getSearchEventAndNotice(vo));
		return "eventAndNotice/getSearchEventAndNotice";
	}

	// 1번 이벤트 전체조회로 가기

	@RequestMapping("/getSearchEventAndNoticeSelectForm")
	public String getSearchEventAndNoticeSelectForm(EventAndNoticeVO vo) {
		return "eventAndNotice/getSearchEventAndNoticeSelect";

	}

	// 1번 이벤트게시판리스트(ajax)
	@RequestMapping("/getSearchEventAndNoticeSelect")
	@ResponseBody
	public Map<String, Object> getSearchEventAndNoticeSelect(EventAndNoticeSearchVO vo, Paging paging) {
		Map<String, Object> map = new HashMap<String, Object>();
		// 1.페이지 설정
		paging.setPageUnit(6); // 한페이지에 출력되는 레코드 건수
		paging.setPageSize(10); // 보이는 페이지 번호
		// 2.초기페이지 설정
		if (paging.getPage() == null)
			paging.setPage(1);
		// 3.값 추가
		paging.setTotalRecord(eventAndNoticeService.getCount(vo));
		vo.setStart(paging.getFirst());
		vo.setEnd(paging.getLast());
		List<EventAndNoticeVO> list = eventAndNoticeService.getSearchEventAndNoticeSelect(vo);
		map.put("paging", paging);
		map.put("list", list);

		return map;
	}// end of getSearchEventAndNoticeSelect

	// 이벤트 등록

	@GetMapping("/insertEventAndNotice1")
	public String insertEventAndNotice1() {

		return "eventAndNotice/insertEventAndNotice1";

	}

	@PostMapping("/insertEventAndNotice1")
	public String insertEventAndNotice1Proc(EventAndNoticeVO vo, HttpServletRequest request)
			throws IllegalStateException, IOException {
		System.out.println(vo);
		// 첨부파일처리
		// pom, servlet에 추가
		MultipartFile[] images = vo.getUploadFile();
		MultipartFile t_image = vo.getT_uploadFile();
		String filenames = "";
		boolean start = true;
		String path = request.getSession().getServletContext().getRealPath("/resources/images/eventAndNotice1");
		// 내 소스 파일에 바로 업로드(servlet-context.xml에 추가해야함)
		for (MultipartFile image : images) {
			if (image != null && !image.isEmpty() && image.getSize() > 0) {
				String filename = image.getOriginalFilename();
				// 파일명 중복체크 -> rename
				File rename = FileRenamePolicy.rename(new File(path, filename));
				// 업로드된 파일명
				// rename.getName()
				if (!start) {
					filenames += ",";
				} else {
					start = false;
				}
				filenames += rename.getName();
				// 파일명을 읽어내는게 getName()
				// 임시폴더에서 업로드 폴더로 파일이동
				image.transferTo(rename); // transferTo:이동한다는뜻 괄호안에 업로드 위치를 정함)

			}
		}
		vo.setImage(filenames);

		if (t_image != null && !t_image.isEmpty() && t_image.getSize() > 0) {
			String filename = t_image.getOriginalFilename();
			// 파일명 중복체크 -> rename
			File rename = FileRenamePolicy.rename(new File(path, filename));
			// 업로드된 파일명
			// rename.getName()
			// 파일명을 읽어내는게 getName()
			// 임시폴더에서 업로드 폴더로 파일이동
			t_image.transferTo(rename); // transferTo:이동한다는뜻 괄호안에 업로드 위치를 정함)
			vo.setT_image(rename.getName());
		}
//			String path="resources/images";
		eventAndNoticeService.insertEventAndNotice1(vo);

		return "redirect:/getSearchEventAndNoticeSelectForm?category=1";

	}

	// 이벤트 단건조회
	@GetMapping("/getEventAndNotice1")
	public String getEventAndNotice1(EventAndNoticeVO vo, Model model) {
		eventAndNoticeService.getEventAndNotice1(vo);
		model.addAttribute("getEventAndNotice", eventAndNoticeService.getEventAndNotice1(vo));

		// 기존의 게시글 자세히 보기에서 추가된 부분.조회수
		eventAndNoticeService.updateViews(vo);

		return "eventAndNotice/getEventAndNotice1";
	}

	// 이벤트 수정 선택
	@GetMapping("/updateEventAndNotice1")
	public String updateEventAndNotice1(EventAndNoticeVO vo, Model model) {
		System.out.println("updateEventAndNotice1의 vo" + vo);
		eventAndNoticeService.getEventAndNotice1(vo);
		model.addAttribute("getEventAndNotice", eventAndNoticeService.getEventAndNotice1(vo));
		return "eventAndNotice/updateEventAndNotice1";

	}

	// 이벤트 처리
	@PostMapping("/updateEventAndNotice1")
	public String updateEventAndNotice1Proc(EventAndNoticeVO vo, HttpServletRequest request)
			throws IllegalStateException, IOException {

		// 첨부파일처리
		// pom, servlet에 추가
		MultipartFile[] images = vo.getUploadFile();
		MultipartFile t_image = vo.getT_uploadFile();
		String filenames = "";
		boolean start = true;
		String path = request.getSession().getServletContext().getRealPath("/resources/images/eventAndNotice1");
		// 내 소스 파일에 바로 업로드(servlet-context.xml에 추가해야함)
		// 새로운 파일이 등록되었는지 확인
		String category = vo.getCategory();
		for (MultipartFile image : images) {
			if (image.getOriginalFilename() != null && !image.getOriginalFilename().equals("") && image.getSize() > 0) {
				String filename = image.getOriginalFilename();
				// 파일명 중복체크 -> rename
				File rename = FileRenamePolicy.rename(new File(path, filename));
				// 업로드된 파일명
				// rename.getName()
				if (!start) {
					filenames += ",";
				} else {
					start = false;
				}
				filenames += rename.getName();
				// 파일명을 읽어내는게 getName()
				// 임시폴더에서 업로드 폴더로 파일이동
				image.transferTo(rename); // transferTo:이동한다는뜻 괄호안에 업로드 위치를 정함)

			} else {
				// 새로운 파일이 등록되지않았다면
				// 기존이미지를 그대로 사용
				vo.setImage(request.getParameter("image"));

			}
		}
		vo.setImage(filenames);
		if (t_image.getOriginalFilename() != null && !t_image.getOriginalFilename().equals("")
				&& t_image.getSize() > 0) {
			String filename = t_image.getOriginalFilename();
			// 파일명 중복체크 -> rename
			File rename = FileRenamePolicy.rename(new File(path, filename));
			// 업로드된 파일명
			// rename.getName()
			// 파일명을 읽어내는게 getName()
			// 임시폴더에서 업로드 폴더로 파일이동
			t_image.transferTo(rename); // transferTo:이동한다는뜻 괄호안에 업로드 위치를 정함)
			vo.setT_image(rename.getName());
		} else {
			// 새로운 파일이 등록되지않았다면
			// 기존이미지를 그대로 사용
			vo.setT_image(request.getParameter("t_image"));
		}
//			String path="resources/images";
		System.out.println("updateEventAndNotice1Proc의 vo" + vo);
		eventAndNoticeService.updateEventAndNotice1(vo);

		return "redirect:getEventAndNotice1?eanNumber=" + vo.getEanNumber();
	}

	// 공지사항 게시판 선택(전체조회)
	@GetMapping("getSearchEventAndNoticeSelect2")
	public String boardList(PagingVOCr4 vo, Model model,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage) {

		int total = eventAndNoticeService.countBoard();
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "5";
		}
		vo = new PagingVOCr4(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", vo);
		model.addAttribute("getSearchEventAndNoticeSelect2", eventAndNoticeService.getSearchEventAndNoticeSelect2(vo));
		return "eventAndNotice/getSearchEventAndNoticeSelect2";
	}
	// 공지사항 등록

	@GetMapping("/insertEventAndNotice2")
	public String insertEventAndNotice2() {

		return "eventAndNotice/insertEventAndNotice2";

	}

	// 공지사항 등록 처리
	@PostMapping("/insertEventAndNotice2")
	public String insertEventAndNotice2Proc(EventAndNoticeVO vo, HttpServletRequest request)
			throws IllegalStateException, IOException {
		System.out.println(vo);
		// 첨부파일처리
		// pom, servlet에 추가
		MultipartFile[] images = vo.getUploadFile();
		MultipartFile t_image = vo.getT_uploadFile();
		String filenames = "";
		boolean start = true;
		String path = request.getSession().getServletContext().getRealPath("/resources/images/eventAndNotice2");
		// 내 소스 파일에 바로 업로드(servlet-context.xml에 추가해야함)
		for (MultipartFile image : images) {
			if (image != null && !image.isEmpty() && image.getSize() > 0) {
				String filename = image.getOriginalFilename();
				// 파일명 중복체크 -> rename
				File rename = FileRenamePolicy.rename(new File(path, filename));
				// 업로드된 파일명
				// rename.getName()
				if (!start) {
					filenames += ",";
				} else {
					start = false;
				}
				filenames += rename.getName();
				// 파일명을 읽어내는게 getName()
				// 임시폴더에서 업로드 폴더로 파일이동
				image.transferTo(rename); // transferTo:이동한다는뜻 괄호안에 업로드 위치를 정함)

			}
		}
		vo.setImage(filenames);

//			String path="resources/images";
		eventAndNoticeService.insertEventAndNotice2(vo);

		return "redirect:/getSearchEventAndNoticeSelect2";

	}

	// 공지사항 단건조회
	@GetMapping("/getEventAndNotice2")
	public String getEventAndNotice2(EventAndNoticeVO vo, Model model) {
		eventAndNoticeService.getEventAndNotice2(vo);
		model.addAttribute("getEventAndNotice", eventAndNoticeService.getEventAndNotice2(vo));

		// 조회수+1
		eventAndNoticeService.updateViews(vo);
		return "eventAndNotice/getEventAndNotice2";
	}

	// 공지사항 수정 선택
	@GetMapping("/updateEventAndNotice2")
	public String updateEventAndNotice2(EventAndNoticeVO vo, Model model) {
		System.out.println("updateEventAndNotice2의 vo" + vo);
		eventAndNoticeService.getEventAndNotice2(vo);
		model.addAttribute("getEventAndNotice", eventAndNoticeService.getEventAndNotice2(vo));
		return "eventAndNotice/updateEventAndNotice2";

	}

	// 공지사항 처리
	@PostMapping("/updateEventAndNotice2")
	public String updateEventAndNotice2Proc(EventAndNoticeVO vo, HttpServletRequest request)
			throws IllegalStateException, IOException {
		// 첨부파일처리
		// pom, servlet에 추가
		MultipartFile[] images = vo.getUploadFile();
		MultipartFile t_image = vo.getT_uploadFile();
		String filenames = "";
		boolean start = true;
		String path = request.getSession().getServletContext().getRealPath("/resources/images/eventAndNotice2");
		// 내 소스 파일에 바로 업로드(servlet-context.xml에 추가해야함)
		// 새로운 파일이 등록되었는지 확인
		String category = vo.getCategory();
		for (MultipartFile image : images) {
			if (image.getOriginalFilename() != null && !image.getOriginalFilename().equals("") && image.getSize() > 0) {
				String filename = image.getOriginalFilename();
				// 파일명 중복체크 -> rename
				File rename = FileRenamePolicy.rename(new File(path, filename));
				// 업로드된 파일명
				// rename.getName()
				if (!start) {
					filenames += ",";
				} else {
					start = false;
				}
				filenames += rename.getName();
				// 파일명을 읽어내는게 getName()
				// 임시폴더에서 업로드 폴더로 파일이동
				image.transferTo(rename); // transferTo:이동한다는뜻 괄호안에 업로드 위치를 정함)

			} else {
				// 새로운 파일이 등록되지않았다면
				// 기존이미지를 그대로 사용
				vo.setImage(request.getParameter("image"));

			}
		}
		vo.setImage(filenames);
		System.out.println("관리자 게시판관리 수정 updateEventAndNotice2 vo의 " + vo);
		eventAndNoticeService.updateEventAndNotice2(vo);
		return "redirect:getEventAndNotice2?eanNumber=" + vo.getEanNumber();
	}

	// 공지사항, 이벤트 삭제
	@PostMapping("/deleteEventAndNotice")
	public String deleteEventAndNoticeProc(EventAndNoticeVO vo, HttpServletRequest request) {
		System.out.println("삭제 vo " + vo);
		eventAndNoticeService.deleteEventAndNotice(vo);
		String old_url = request.getHeader("Referer");
		// System.out.println("================="+old_url);

		// 이벤트 삭제시
		if (old_url.contains("getEventAndNotice1")) {
			return "redirect:/getSearchEventAndNoticeSelectForm?category=1";
			// 공지사항 삭제시
		} else {

			return "redirect:/getSearchEventAndNoticeSelect2";
		}

	}

	// ####★★문의하기-신고하기 에 관한 컨트롤러 ★★ (question & answer 테이블 함께 사용)

	// 페이징 처리에 관한것.

	// 상품문의
	@GetMapping("getSearchQuestionSelect1")
	public String getSearchQuestionSelect1(PagingVOCr4 vo, Model model,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage) {

		int total = questionService.countQuestion1();
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "5";
		}
		vo = new PagingVOCr4(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", vo);
		model.addAttribute("viewAll", questionService.getSearchQuestionSelect1(vo));
		return "admin/getSearchQuestionSelect1";
	}

	// 고객센터 조회

	@GetMapping("getSearchQuestionSelect2")
	public String getSearchQuestionSelect2(PagingVOCr4 vo, Model model,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage) {

		int total = questionService.countQuestion2();
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "5";
		}
		vo = new PagingVOCr4(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", vo);
		model.addAttribute("viewAll", questionService.getSearchQuestionSelect2(vo));
		return "admin/getSearchQuestionSelect2";
	}

	// 신고하기 조회
	@GetMapping("getSearchQuestionSelect3")
	public String getSearchQuestionSelect3(PagingVOCr4 vo, Model model,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage) {

		int total = questionService.countQuestion3();
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "5";
		}
		vo = new PagingVOCr4(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", vo);
		model.addAttribute("viewAll", questionService.getSearchQuestionSelect3(vo));
		return "admin/getSearchQuestionSelect3";
	}

	@GetMapping("/insertQuestion1") // 문의하기(유저) 1상품문의 접수
	public String insertQuestion1(QuestionVO vo) {
		return "admin/insertQuestion1";
	}

	@PostMapping("/insertQuestion1") // 문의하기(유저) 1상품문의 접수
	public String insertQuestion1Proc(QuestionVO vo) {
		System.out.println(vo);
		questionService.insertQuestion1(vo);
		return "redirect:/getSearchQuestionSelect1";
	}

	@GetMapping("/insertQuestion2") // 문의하기(유저) 2.고객센터문의 접수
	public String insertQuestion2(QuestionVO vo) {
		return "admin/insertQuestion2";
	}

	@PostMapping("/insertQuestion2") // 문의하기(유저) 2.고객센터문의 접수
	public String insertQuestion2Proc(QuestionVO vo) {
		System.out.println(vo);
		questionService.insertQuestion2(vo);
		return "redirect:/insertQuestion2";
	}

	@GetMapping("/insertQuestion3") // 문의하기(유저) 3.신고접수
	public String insertQuestion3() {
		return "admin/insertQuestion3";
	}

	@PostMapping("/insertQuestion3") // 문의하기(유저) 3.신고접수 처리
	public String insertQuestion3Proc(QuestionVO vo, HttpServletRequest request)
			throws IllegalStateException, IOException {
		System.out.println(vo);
		// 첨부파일처리
		// pom , servlet에 추가
		MultipartFile image = vo.getUploadFile();

		String path = request.getSession().getServletContext().getRealPath("/resources/images/question");
		// 내 소스 파일에 바로 업로드(servlet-context.xml에 추가해야함)
		System.out.println("경로: " + path);
		if (image != null && !image.isEmpty() && image.getSize() > 0) {
			String filename = image.getOriginalFilename();
			// 파일명 중복체크 -> rename
			File rename = FileRenamePolicy.rename(new File(path, filename));
			// 업로드된 파일명
			// rename.getName()
			// 파일명을 읽어내는게 getName()
			// 임시폴더에서 업로드 폴더로 파일이동
			image.transferTo(rename); // transferTo: 이동한다는 뜻 괄호안에 업로드 위치를 정함)
			vo.setImage(rename.getName());

		}
		// String path = "resources/images";
		questionService.insertQuestion3(vo);
		return "redirect:/insertQuestion3";
	}

	@RequestMapping("/getSearchQuestionCr4") // 문의하기 전체조회
	public String getSearchQuestion(QuestionVO vo, Model model) {
		model.addAttribute("getSearchQuestionCr4", questionService.getSearchQuestionCr4(vo));
		return "admin/getSearchQuestionCr4";
	}

	@GetMapping("/getQuestion1") // 상품문의 상세조회
	public String getQuestion1(QuestionVO vo, Model model) {
		System.out.println(vo);
		questionService.getQuestion1(vo);
		model.addAttribute("getQuestion1", questionService.getQuestion1(vo));
		return "admin/getQuestion1";
	}

	@GetMapping("/getQuestion1Ans") // 문의하기 상품문의 답장하기
	public String insertAnswer1Cr4(QuestionVO vo, Model model) {
		questionService.getQuestion1Ans(vo);
		model.addAttribute("getQuestion1", questionService.getQuestion1(vo));
		model.addAttribute("getQuestion1Ans", questionService.getQuestion1Ans(vo));
		return "admin/insertAnswer1Cr4";
	}

	@PostMapping("/insertAnswer1Cr4") // 문의하기 상품문의 답장하기 처리
	public String insertAnswer1Cr4Proc(AnswerVO vo) {
		System.out.println(vo);
		answerService.insertAnswer1Cr4(vo);
		return "redirect:/getSearchQuestionSelect1";
	}

	@GetMapping("/getQuestion2") // 고객센터 문의하기 상세조회
	public String getQuestion2(QuestionVO vo, Model model) {
		System.out.println(vo);
		questionService.getQuestion2(vo);
		model.addAttribute("getQuestion2", questionService.getQuestion2(vo));
		return "admin/getQuestion2";
	}

	@GetMapping("/getQuestion2Ans") // 고객센터 문의하기 답장하기
	public String insertAnswer2Cr4(QuestionVO vo, Model model) {
		questionService.getQuestion2Ans(vo);
		model.addAttribute("getQuestion2", questionService.getQuestion2(vo));
		model.addAttribute("getQuestion2Ans", questionService.getQuestion2Ans(vo));
		return "admin/insertAnswer2Cr4";
	}

	@PostMapping("/insertAnswer2Cr4") // 고객센터 문의하기 답장하기 처리
	public String insertAnswer2Cr4Proc(AnswerVO vo) {
		answerService.insertAnswer2Cr4(vo);
		return "redirect:/getSearchQuestionSelect2";
	}

	@PostMapping("/insertAnswer299Cr4") // 사업자가 문의하기 답장 처리 하는 것
	public String insertAnswer299Cr4Proc(AnswerVO vo) {
		answerService.insertAnswer2Cr4(vo);
		return "redirect:/getSearchQuestion";
	}

	@GetMapping("/getQuestion3") // 문의하기 상세조회 신고하기
	public String getQuestion3(QuestionVO vo, Model model) {
		System.out.println(vo);
		questionService.getQuestion3(vo);
		model.addAttribute("getQuestion3", questionService.getQuestion3(vo));
		return "admin/getQuestion3";
	}

	@GetMapping("/getQuestion3Ans") // 문의하기 신고하기 답장하기
	public String getQuestion3Ans(QuestionVO vo, Model model) {
		questionService.getQuestion3Ans(vo);
		model.addAttribute("getQuestion3", questionService.getQuestion3(vo));
		model.addAttribute("getQuestion3Ans", questionService.getQuestion3Ans(vo));
		return "admin/insertAnswer3Cr4";
	}

	@PostMapping("/insertAnswer3Cr4") // 문의하기 신고하기 답장하기 처리
	public String insertAnswerCr4(AnswerVO vo) {
		System.out.println(vo);
		answerService.insertAnswer3Cr4(vo);
		return "redirect:/getSearchQuestionSelect3";
	}

	// 답장 전체보기 페이징처리
	@GetMapping("getSearchAnswerCr4")
	public String getSearchAnswerCr4(PagingVOCr4 vo, Model model,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage) {

		int total = answerService.countQuestion();
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "5";
		}
		vo = new PagingVOCr4(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", vo);
		model.addAttribute("viewAll", answerService.getSearchAnswerCr4(vo));
		return "admin/getSearchAnswerCr4";
	}

	@PostMapping("/deleteAnswerCr4")
	public String deleteAnswerCr4(AnswerVO vo) {
		System.out.println("관리자 답변 삭제 vo " + vo);
		answerService.deleteAnswerCr4(vo);
		return "redirect:/getSearchAnswerCr4";
	}

}// end
