package com.epps.board.dao;

import com.epps.board.vo.BoardVo;

import java.util.List;

public interface BoardDao {

    public int register(BoardVo boardVo);

    public List<BoardVo> boardList();

}
