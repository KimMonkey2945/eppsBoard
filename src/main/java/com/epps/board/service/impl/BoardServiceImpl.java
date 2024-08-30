package com.epps.board.service.impl;

import com.epps.board.dao.BoardDao;
import com.epps.board.dto.Criteria;
import com.epps.board.service.BoardService;
import com.epps.board.vo.BoardVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class BoardServiceImpl implements BoardService {

    @Autowired
    private BoardDao boardDao;

    @Override
    public int regiter(BoardVo boardVo) {
        return boardDao.register(boardVo);
    }

    @Override
    public List<BoardVo> boardList(Criteria cri) {
        return boardDao.boardList(cri);
    }

    @Override
    public List<BoardVo> searchBoardList(Criteria cri, BoardVo boardVo) {
        return boardDao.searchBoardList(cri, boardVo);
    }

    public int boardCount() {
        return boardDao.boardCount();
    }

    @Override
    public List<BoardVo> checkPassword(String boardId) {
        return boardDao.checkPassword(boardId);
    }

    @Override
    public int deleteBoard(String boardId) {
        return boardDao.deleteBoard(boardId);
    }

    @Override
    public int updateBoard(BoardVo boardVo) {
        return boardDao.updateBoard(boardVo);
    }
}
