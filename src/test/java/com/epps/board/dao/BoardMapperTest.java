package com.epps.board.dao;

import com.epps.board.controller.BoardController;
import com.epps.board.dto.Criteria;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;
public class BoardMapperTest {

    private final Logger logger = LogManager.getLogger(BoardMapperTest.class);

    @Autowired
    BoardDao boardDao;

    @Test
    public void testGetListPaging() {

        Criteria cri = new Criteria();

        List list = boardDao.boardList(cri);

        list.forEach(board -> logger.info("" + board));
    }

}
