package com.epps.board.service.impl;

import com.epps.board.dao.BoardDao;
import com.epps.board.service.BoardService;
import com.epps.board.vo.BoardVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BoardServiceImpl implements BoardService {

    @Autowired
    private BoardDao boardDao;

    @Override
    public int regiter(BoardVo boardVo) {
        return boardDao.register(boardVo);
    }

    @Override
    public List<BoardVo> boardList() {
        return boardDao.boardList();
    }
}
