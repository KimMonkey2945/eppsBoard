package com.epps.board.dao;

import com.epps.board.dto.Criteria;
import com.epps.board.vo.BoardVo;

import java.util.List;
import java.util.Map;

public interface BoardDao {

    public int register(BoardVo boardVo);

    public List<BoardVo> boardList(Criteria cri);

    public int boardCount();

    List<BoardVo> searchBoardList(Criteria cri, BoardVo boardVo);

    public List<BoardVo> checkPassword(String boardId);

    public int deleteBoard(String boardId);

    public int updateBoard(BoardVo boardVo);
}
