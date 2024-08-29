package com.epps.board.dao.impl;

import com.epps.board.dao.BoardDao;
import com.epps.board.vo.BoardVo;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class BoardDaoImpl implements BoardDao {

    @Autowired
    private SqlSession sqlSession;

    @Override
    public int register(BoardVo boardVo) {
        return sqlSession.insert("boardRegister", boardVo);
    }

    @Override
    public List<BoardVo> boardList() { return sqlSession.selectList("boardList");}
}
