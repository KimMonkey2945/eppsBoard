package com.epps.board.dao.impl;

import com.epps.board.dao.BoardDao;
import com.epps.board.dto.Criteria;
import com.epps.board.vo.BoardVo;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Indexed;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class BoardDaoImpl implements BoardDao {

    @Autowired
    private SqlSession sqlSession;

    @Override
    public int register(BoardVo boardVo) {
        return sqlSession.insert("boardRegister", boardVo);
    }

    @Override
    public List<BoardVo> boardList(Criteria cri) {
        return sqlSession.selectList("boardList", cri);
    }

    @Override
    public List<BoardVo> searchBoardList(Criteria cri, BoardVo boardVo) {
        Map<String, Object> params = new HashMap<>();
        params.put("cri", cri);
        params.put("boardVo", boardVo);
        return sqlSession.selectList("searchBoardList", params);
    }

    @Override
    public List<BoardVo> checkPassword(String boardId) {
        return sqlSession.selectList("checkPassword", boardId);
    }

    @Override
    public int deleteBoard(String boardId) {
        return sqlSession.delete("deleteBoard", boardId);
    }

    @Override
    public int updateBoard(BoardVo boardVo) {
        return sqlSession.update("updateBoard", boardVo);
    }


    public int boardCount() {
        return sqlSession.selectOne("boardCount");
    }

}
