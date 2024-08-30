package com.epps.board.controller;

import com.epps.board.dto.Criteria;
import com.epps.board.dto.PageMakerDTO;
import com.epps.board.service.BoardService;
import com.epps.board.vo.BoardVo;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.text.SimpleDateFormat;
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
        int result = boardService.regiter(boardVo);
        Map<String, String> response = new HashMap<>();
        if(result == 1){
            response.put("response", "success");
        }else {
            response.put("response", "fail");
        }
        return response;
    }

    @GetMapping("/boardList")
    public String boardList(Model model, Criteria cri){
        int total = boardService.boardCount();
        PageMakerDTO pageMaker = new PageMakerDTO(cri, total);
        model.addAttribute("boardList", boardService.boardList(cri));
        model.addAttribute("pageMaker", pageMaker);
        return "boardList";
    }

    @PostMapping("/searchBoardList")
    @ResponseBody
    public Map<String, Object> searchBoardList(@RequestBody BoardVo boardVo, Criteria cri){
        logger.info("&&&&&&&&&&&&& boardVo = {}", boardVo);
        logger.info("&&&&&&&&&&&&& cri = {}", cri);

        List<BoardVo> boardList = boardService.searchBoardList(cri, boardVo);
        int total = 0;
        for(BoardVo b : boardList){
            total++;
        }
        logger.info("&&&&&&&&&&&&& total = {}", total);
        PageMakerDTO pageMaker = new PageMakerDTO(cri, total);
        Map<String, Object> response = new HashMap<>();

        response.put("boardList", boardList);
        response.put("pageMaker", pageMaker);

        return response;

    }

    @PostMapping("/checkPassword")
    @ResponseBody
    public Map<String, Object> checkPassword(@RequestBody BoardVo boardVo){
        Map<String, Object> response = new HashMap<>();

        List<BoardVo> boardList = boardService.checkPassword(boardVo.getBoardId());
        String realPassword = "";
        for(BoardVo b : boardList){
            realPassword = b.getBoardPassword();
        }
        logger.info("realPassword = {}", realPassword);
        String password = boardVo.getBoardPassword();
        logger.info("password = {}", password);

        if(realPassword.equals(password)){
            response.put("response", "success");
        }else{
            response.put("response", "fail");
        }

        return response;

    }

    @GetMapping("/update")
    public String updateBoard(@RequestParam String boardId, Model model){
        List<BoardVo> boardList = boardService.checkPassword(boardId);
        logger.info("boardList = {}", boardList);
        model.addAttribute("boardList", boardList);
        return "update";
    }

    @PostMapping("/update")
    @ResponseBody
    public Map<String, String> updateBoard(@RequestBody BoardVo boardVo){
        logger.info("boardVo = {}", boardVo);
        Map<String, String> response = new HashMap<>();
        int result = boardService.updateBoard(boardVo);

        if(result == 1){
            response.put("response", "success");
        }else {
            response.put("response", "fail");
        }

        return response;
    }

    @PostMapping("/deleteBoard")
    @ResponseBody
    public Map<String, Object> deleteBoard(@RequestBody BoardVo boardVo){
        Map<String, Object> response = new HashMap<>();
        List<BoardVo> boardList = boardService.checkPassword(boardVo.getBoardId());
        String realPassword = "";
        for(BoardVo b : boardList){
            realPassword = b.getBoardPassword();
        }
        String password = boardVo.getBoardPassword();

        if(realPassword.equals(password)){
            response.put("response", "success");
            boardService.deleteBoard(boardVo.getBoardId());
        }else{
            response.put("response", "fail");
        }

        return response;

    }

    @GetMapping("/detail")
    public String detailBoard(@RequestParam String boardId, Model model){
        List<BoardVo> boardList = boardService.checkPassword(boardId);
        logger.info("boardId = {}", boardId);
        model.addAttribute("boardList", boardList);
        return "detail";
    }







}
