package com.spring.getjob;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.getjob.board.service.BoardService;
import com.spring.getjob.board.vo.BoardVO;
import com.spring.getjob.paging.PageVO;
import com.spring.getjob.paging.Paging;

@Controller
public class IndexController {
	
	@Autowired
	private BoardService service;
	
	@RequestMapping(value = "/index")
	public String index(PageVO vo,Model model) throws Exception {
		
		
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
		return "/index";
	}

}
