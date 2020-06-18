package com.spring.getjob.board.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.getjob.board.service.BoardService;
import com.spring.getjob.board.vo.BoardVO;
import com.spring.getjob.paging.PageVO;
import com.spring.getjob.paging.Paging;


@Controller
public class BoardController {
	
	@Autowired
	private BoardService service;
	
    @RequestMapping(value="/board/writeForm.do")
    public String writeBoardForm() throws Exception{
        
        return "board/boardWrite";
    }
    
   
    @RequestMapping(value="/board/write.do")
    public String write(@ModelAttribute("boardVO") BoardVO boardVO, Model model) throws Exception{
        
        service.insertBoard(boardVO);
        
        return "redirect:/listPage";
    }
    
    @RequestMapping(value="/board/boardView.do")
    public String viewForm(@ModelAttribute("boardVO") BoardVO boardVO,@ModelAttribute("vo") PageVO vo, Model model, HttpServletRequest request) throws Exception{
        
        int id = Integer.parseInt(request.getParameter("id"));
        boardVO.setId(id);
        
        BoardVO resultVO = service.selectBoard(boardVO);
        service.updateViewCnt(id);
        
        model.addAttribute("result", resultVO);
        //model.addAttribute("replyVO",new ReplyVO());
       
        
        
        return "board/boardView";
    }
    
    
    @RequestMapping(value="/board/update")
    public String updateForm(@ModelAttribute("boardVO") BoardVO boardVO,@ModelAttribute("vo") PageVO vo, Model model, HttpServletRequest request) throws Exception{
    	
    	int id = Integer.parseInt(request.getParameter("id"));
        boardVO.setId(id);
        
        BoardVO resultVO = service.selectBoard(boardVO);
    	
    	 model.addAttribute("result",resultVO);
    	
    	return "board/boardUpdate";
    }
    
   
    @RequestMapping(value="/board/updateboard.do")
    public String updateBoard(PageVO vo,BoardVO boardVO, RedirectAttributes ra) throws Exception{
        

    	System.out.println(boardVO.getTitle());
    	System.out.println(boardVO.getContent());
    	System.out.println(boardVO.getWriter());
    	System.out.println(boardVO.getId());
    	
    	try {
         service.updateBoard(boardVO);
    	}
    	catch(Exception e)
    	{
    		e.printStackTrace();
    	}
           ra.addAttribute("page",vo.getPage());
           ra.addAttribute("perPageNum",vo.getPerPageNum());
           ra.addAttribute("searchType",vo.getSearchType());
           ra.addAttribute("keyword",vo.getKeyword());
           ra.addAttribute("id",boardVO.getId());

        return "redirect:/board/boardView.do";
        
    }
    
    @RequestMapping(value="/board/boardDelete.do")
    public String deleteBoard(@ModelAttribute("vo") PageVO vo,@RequestParam("id") int id,RedirectAttributes ra) throws Exception{
    	
    	service.deleteBoard(id);
    	
    	ra.addAttribute("page",vo.getPage());
        ra.addAttribute("perPageNum",vo.getPerPageNum());
        ra.addAttribute("searchType",vo.getSearchType());
        ra.addAttribute("keyword",vo.getKeyword());
        ra.addAttribute("id",id);
        
        return "redirect:/listPage";
    	
    }
    
    @RequestMapping(value="/listPage")
    public void listPage(PageVO vo,Model model,HttpServletRequest request) throws Exception {

        int bdno = Integer.parseInt(request.getParameter("bdno"));
    	
    	model.addAttribute("bdno",bdno);
    	
    	
    	List<BoardVO> bd = service.listPage(vo);
    	
    	model.addAttribute("list",bd);
    	
    	Paging pg = new Paging(vo);
    	
    	int totalCount = service.getTotalCount(vo);
    	
    	
    	pg.setTotalCount(totalCount);
    	
    	model.addAttribute("pg",pg);
    	
    	System.out.println(bdno);
    	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
    	Calendar cal = Calendar.getInstance();
    	//cal.add(Calendar.DAY_OF_MONTH, -3);
    	
    	String nowday = format.format(cal.getTime());
    	
    	model.addAttribute("nowday",nowday);
    }
    
    

    @RequestMapping(value="/freeview1")
    public void freeview1(PageVO vo,Model model) throws Exception {
    	
    	List<BoardVO> bd = service.listPage(vo);
    	
    	model.addAttribute("list",bd);
    	
    	Paging pg = new Paging(vo);
    	
    	int totalCount = service.getTotalCount(vo);
    	
    	
    	pg.setTotalCount(totalCount);
    	
    	model.addAttribute("pg",pg);
    	
    	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
    	Calendar cal = Calendar.getInstance();
    	//cal.add(Calendar.DAY_OF_MONTH, -3);
    	
    	String nowday = format.format(cal.getTime());
    	
    	model.addAttribute("nowday",nowday);
    }

}
