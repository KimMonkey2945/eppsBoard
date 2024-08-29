<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title></title>
    <script src="https://code.jquery.com/jquery-3.7.1.slim.js" integrity="sha256-UgvvN8vBkgO0luPSUl2s8TIlOSYRoGFAX4jlCIm9Adc=" crossorigin="anonymous"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
        body {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center; /* 수직 중앙 정렬 */
            align-items: center; /* 수평 중앙 정렬 */
        }
        .search {
            border-collapse: collapse;
            width: 100%;
            max-width: 1500px;
            border: 2px solid #000;
            margin-bottom: 20px; /* 테이블 간격 조정 */
        }
        table {
            border-collapse: collapse;
            width: 100%;
            max-width: 1500px;
            border: 2px solid;
            margin-bottom: 20px; /* 테이블 간격 조정 */
        }
        td {
            padding: 10px;
            vertical-align: middle; /* 셀 내용 수직 중앙 정렬 */
        }
        .no-border {
            border: none;
        }
        .label-cell {
            width: 70px; /* 레이블 셀 너비 조정 */
        }
        .input-cell {
            width: 260px; /* 입력 셀 너비 조정 */
        }
        select, input[type="text"], textarea {
            width: 100%;
        }
        .button-container {
            text-align: right; /* 버튼을 우측으로 정렬 */
        }
    </style>
</head>
<body>
    <form id="searchBoard">
        <table class="search">
            <tr>
                <td class="label-cell no-border">회사</td>
                <td class="input-cell">
                    <select id="boardCompany" name="boardCompany">
                        <option value="" selected disabled hidden>선택해주세요</option>
                        <option value="epps">epps</option>
                        <option value="kakao">kakao</option>
                        <option value="coupang">coupang</option>
                        <option value="google">google</option>
                    </select>
                </td>
                <td class="no-border" style="width:65px;">등록일자</td>
                <td class="">
                    <input style="width:100px; display: inline-block;" class="datepicker" id="startDate" name="boardDate"> ~
                    <input style="width:100px; display: inline-block;" class="datepicker" id="endDate" name="boardDate">
                </td>
                <td class="label-cell no-border">등록자</td>
                <td class="input-cell"><input id="boardWriter" type="text" name="boardWriter"></td>
            </tr>
            <tr>
                <td class="label-cell no-border">제목</td>
                <td colspan="3" class="input-cell"><input id="boardTitle" type="text" name="boardTitle"></td>
            </tr>
        </table>
        <div class="button-container">
                <input id="register" type="button" value="조회">
        </div>

        <table class="boardList" style=" text-align:center; ">
            <tr>
                <td style="width:8%; text-align:center; border: 1px solid;">선택</td>
                <td style="width:8%; text-align:center; border: 1px solid;">회사</td>
                <td style="width:8%; text-align:center; border: 1px solid;">순번</td>
                <td style="width:50%; text-align:center; border: 1px solid;">제목</td>
                <td style="width:13%; text-align:center; border: 1px solid;">등록자</td>
                <td style="width:13%; text-align:center; border: 1px solid;">등록일자</td>
            </tr>
                <c:forEach var="board" items="${boardList}" varStatus="status">
                    <tr>
                        <input id="boardId" type="hidden" value="${board.boardId}">
                        <td style="width:8%; border: 1px solid;"><input type="checkbox"></td>
                        <td style="width:8%; border: 1px solid;">${board.boardCompany}</td>
                        <td style="width:8%; border: 1px solid;">${fn:length(boardList) - status.index}</td>
                        <td style="width:50%; border: 1px solid;">${board.boardTitle}</td>
                        <td style="width:13%; border: 1px solid;">${board.boardWriter}</td>
                        <td style="width:13%; border: 1px solid;">${board.boardDate}</td>
                    </tr>
                </c:forEach>
            <tr>
                <td>
                    <div style="display: inline-block; text-align: left;">페이징자리</div>
                    <div style="display: inline-block; text-align: right;">total: ${total}</div>
                </td>
            </tr>
        </table>
        <div class="button-container">
            <input id="register" type="button" value="등록">
            <input id="update" type="button" value="수정">
            <input id="delete" type="button" value="삭제">
        </div>
    </form>
</body>

<script type="text/javascript">

    // serializeObject 구현
    $.fn.serializeObject = function() {
        var obj = {};
        var formArray = this.serializeArray();
        $.each(formArray, function() {
            if (obj[this.name]) {
                if (!obj[this.name].push) {
                    obj[this.name] = [obj[this.name]];
                }
                obj[this.name].push(this.value || '');
            } else {
                obj[this.name] = this.value || '';
            }
        });
        return obj;
    };

    // datepicker 설정
    $.datepicker.setDefaults({
      dateFormat: 'yy-mm-dd',
      prevText: '이전 달',
      nextText: '다음 달',
      monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
      monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
      dayNames: ['일', '월', '화', '수', '목', '금', '토'],
      dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
      dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
      showMonthAfterYear: true,
      yearSuffix: '년'
    });


    $(function(){

       // datepicker 오늘 날짜 고정 및 이전 날짜 선택 불가
       let today = new Date();
       $('.datepicker').datepicker({
           minDate: 0
       }).datepicker('setDate', today);

       // 글자 수 체크 이벤트
       $('#boardContent').on('keyup', function() {
           checkTextCount('#boardContent', '#textCount', 1000);
       });

       $("#register").on("click", function(){

           //유효성 검사
           if(validation()){
                if (confirm("저장하시겠습니까?")) {
                    let data = $('#boardRegister').serializeObject();
                    console.log('Json으로 변환 : ' ,  JSON.stringify(data));
                         $.ajax({
                             url: '/register',
                             type: 'POST',
                             data: JSON.stringify(data),
                             contentType: 'application/json',
                             success: function(response) {

                             },
                              error: function(jqXHR, textStatus, errorThrown) {
                                 alert('실패');
                             }
                         });
                } else {
                    alert('저장이 취소되었습니다.');
                }
           };



       });

    })


</script>
</html>