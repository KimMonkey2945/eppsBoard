package com.epps.board.controller;

import com.epps.board.service.BoardService;
import com.epps.board.vo.BoardVo;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class BoardController {

    private final Logger logger = LogManager.getLogger(BoardController.class);

    @Autowired
    private BoardService boardService;

    @GetMapping("/")
    public String registerHome(){
        return "register";
    }

    @PostMapping("/register")
    @ResponseBody
    public Map<String, String> register(@RequestBody BoardVo boardVo){
//        logger.info("%%%%%%%%%%%%%%%%% BoardVo = {}", boardVo);
        int result = boardService.regiter(boardVo);
//        logger.info("%%%%%%%%%%%%%%%%% result = {}", result);
        Map<String, String> response = new HashMap<>();
        return response;
    }

    @GetMapping("/boardList")
    public String boardList(Model model){
        List<BoardVo> boardList = boardService.boardList();
        int total = 0;
        for(BoardVo a : boardList){
//            logger.info("%%%%%%%%%%%%%%%%% boardList = {}", a.getBoardId());
//            logger.info("%%%%%%%%%%%%%%%%% boardList = {}", a.getBoardCompany());
//            logger.info("%%%%%%%%%%%%%%%%% boardList = {}", a.getBoardTitle());
//            logger.info("%%%%%%%%%%%%%%%%% boardList = {}", a.getBoardWriter());
//            logger.info("%%%%%%%%%%%%%%%%% boardList = {}", a.getBoardDate());
//            logger.info("%%%%%%%%%%%%%%%%% boardList = {}", a.getBoardContent());
//            System.out.println("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&");
            total++;
        }
        model.addAttribute("boardList", boardList);
        model.addAttribute("total", total);
        return "boardList";
    }



}
