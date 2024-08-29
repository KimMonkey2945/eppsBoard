package com.epps.board.service;

import com.epps.board.vo.BoardVo;

import java.util.List;

public interface BoardService {

    public int regiter(BoardVo boardVo);

    public List<BoardVo> boardList();

}
