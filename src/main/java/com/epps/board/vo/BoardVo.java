package com.epps.board.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BoardVo {
    private String boardId;
    private String boardCompany;
    private String boardDate;
    private String boardWriter;
    private String boardTitle;
    private String boardPassword;
    private String boardContent;


}
