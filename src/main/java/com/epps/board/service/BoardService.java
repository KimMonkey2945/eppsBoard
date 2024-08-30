package com.epps.board.service;

import com.epps.board.dto.Criteria;
import com.epps.board.vo.BoardVo;

import java.util.List;
import java.util.Map;

public interface BoardService {

    public int regiter(BoardVo boardVo);

    public List<BoardVo> boardList(Criteria cri);

    public List<BoardVo> searchBoardList(Criteria cri, BoardVo boardVo);

    public int boardCount();

    public List<BoardVo> checkPassword(String boardId);

    public int deleteBoard(String boardId);

    public int updateBoard(BoardVo boardVo);

}
