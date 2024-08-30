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
        .pageInfoBtn a {
            text-decoration: none; /* 링크 밑줄 제거 */
            color: #333; /* 링크 색상 */
        }
        #pageInfo {
            list-style: none; /* 기본 불릿 제거 */
            padding: 0; /* 기본 패딩 제거 */
            margin: 0; /* 기본 마진 제거 */
            display: flex; /* flexbox로 가로 정렬 */
            gap: 10px; /* 버튼 사이의 간격 */
        }
        /* 모달 배경 */
        .modal {
            display: none; /* 기본적으로 숨김 */
            position: fixed;
            z-index: 1000; /* 페이지 내 다른 콘텐츠들 위에 표시 */
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0, 0, 0, 0); /* 배경색 제거 */
        }

        /* 모달 컨텐츠 */
        .modal-content {
            background-color: #fefefe; /* 모달 내용의 배경색 */
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
            max-width: 500px;
            position: absolute; /* 절대 위치로 설정 */
            top: 40%; /* 상단에서 10px 떨어진 위치 */
            left: 50%; /* 화면 가로 중앙으로 이동 */
            transform: translateX(-50%); /* 중앙 정렬 */
        }

        /* 닫기 버튼 */
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
            cursor: pointer;
        }

        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
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
                    <input style="width:100px; display: inline-block;" class="datepicker" id="startDate" name="startDate"> ~
                    <input style="width:100px; display: inline-block;" class="datepicker" id="endDate" name="endDate">
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
                <input style="margin-bottom: 10px;" id="search" type="button" value="조회">
        </div>

        <table id="boardList" class="boardList" style=" text-align:center; ">
            <thead>
                <tr>
                    <td style="width:8%; text-align:center; border: 1px solid;">선택</td>
                    <td style="width:8%; text-align:center; border: 1px solid;">회사</td>
                    <td style="width:8%; text-align:center; border: 1px solid;">순번</td>
                    <td style="width:50%; text-align:center; border: 1px solid;">제목</td>
                    <td style="width:13%; text-align:center; border: 1px solid;">등록자</td>
                    <td style="width:13%; text-align:center; border: 1px solid;">등록일자</td>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="board" items="${boardList}" varStatus="status">
                    <tr>
                        <input id="boardId" type="hidden" value="${board.boardId}">
                        <td style="width:8%; border: 1px solid;"><input class="checkbox" type="checkbox"></td>
                        <td style="width:8%; border: 1px solid;">${board.boardCompany}</td>
                        <td style="width:8%; border: 1px solid;">${board.rn}</td>
                        <td style="width:50%; border: 1px solid;">
                          <a href="#" class="boardTitleLink" data-board-id="${board.boardId}" >${board.boardTitle}</a>
                        </td>
                        <td style="width:13%; border: 1px solid;">${board.boardWriter}</td>
                        <td style="width:13%; border: 1px solid;">${board.boardDate}</td>
                    </tr>
                </c:forEach>

            <tr>
                <td colspan="3">
                    <div id="searchPage">
                        <ul id="pageInfo">
                            <li class="pageInfoBtn first"><a href="1"> << </a></li>

                            <c:if test="${pageMaker.prev}">
                                <li class="pageInfoBtn previous"><a href="${pageMaker.startPage-1}"> < </a></li>
                            </c:if>

                           <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                               <li class="pageInfo_btn"><a href="${num}">${num}</a></li>
                           </c:forEach>

                            <c:if test="${pageMaker.next}">
                                <li class="pageInfoBtn next"><a href="${pageMaker.endPage + 1 }"> > </a></li>
                            </c:if>

                            <li class="pageInfoBtn last"><a href="${pageMaker.totalPages}"> >> </a></li>
                        </ul>
                    </div>
                </td>
                <td></td>
                <td></td>
                <td>
                    <!-- 총 항목 수 표시 -->
                    <div style=" text-align: right;">
                        total: ${pageMaker.total}
                    </div>
                </td>
            </tr>
            </tbody>
        </table>
        <div class="button-container">
            <input id="register" type="button" value="등록">
            <input id="update" type="button" value="수정">
            <input id="delete" type="button" value="삭제">
        </div>
    </form>
    <form id="moveForm" method="get">
        <input id="pageNum" type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
        <input id="amount" type="hidden" name="amount" value="${pageMaker.cri.amount}">
    </form>

    <div id="passwordModal" class="modal">
        <div class="modal-content">
            <span class="close">&times;</span>
            <p>비밀번호를 입력하세요:</p>
            <input type="password" id="passwordInput" placeholder="비밀번호">
            <button id="submitPassword">확인</button>
        </div>
    </div>

</body>

<script type="text/javascript">

    let moveForm = $("#moveForm");


    // serializeObject 구현
    $.fn.serializeObject = function() {
        var obj = {};
        var formArray = this.serializeArray();

        $.each(formArray, function() {
            // 값이 비어있지 않을 때만 객체에 추가
            if (this.value.trim()) {
                if (obj[this.name]) {
                    if (!Array.isArray(obj[this.name])) {
                        obj[this.name] = [obj[this.name]];
                    }
                    obj[this.name].push(this.value);
                } else {
                    obj[this.name] = this.value;
                }
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

    // 유효성 검사
   function validation(){
        let boardCompany = $('#boardCompany').val();
        if (!boardCompany) {
            alert('회사를 선택해주세요.');
            return false;
        }
        return true;
   };

   // 등록 클릭시 이동
   $('#register').on('click', function(){
        window.location.href="http://localhost:9090";
   });

   //
   $(".checkbox").on("change", function(){
       if ($(".checkbox:checked").length > 0) {
           $(".checkbox").not(this).prop("disabled", true).addClass("disabled");
       } else {
           $(".checkbox").prop("disabled", false).removeClass("disabled");
       }
   });


    $(function(){

        // 페이지 이동
        $('#pageInfo a').on('click', function(e){
            e.preventDefault();
            moveForm.find("input[name='pageNum']").val($(this).attr("href"));
            moveForm.attr('action', '/boardList');
            moveForm.submit();
        });

       // 게시물 제목 클릭 시 상세 페이지로 이동
       $('#boardList').on('click', '.boardTitleLink', function(e) {
           e.preventDefault();
           let boardId = $(this).data("board-id");
           console.log('boardId : ', boardId)
           window.location.href = '/detail?boardId=' + boardId;
       });

       // datepicker 오늘 날짜 고정 및 이전 날짜 선택 불가
       let today = new Date();
       $('#endDate').datepicker({
           maxDate: 0
       }).datepicker('setDate', today);
       $('#startDate').datepicker({maxDate: 0}).datepicker('setDate', '-1M');

       // 수정
       $("#update").on("click", function(){

           let modal = $("#passwordModal");
           let close = $(".close");
           let submit = $("#submitPassword");

            if($(".checkbox:checked").length == 0){
                alert("수정할 게시글을 먼저 선택해주세요.")
                return;
            }
            modal.show();

            close.on("click", function() {
               modal.hide();
            });

            // 확인 버튼 클릭 시 비밀번호 확인 비밀번호가 비어있는지 체크
            submit.on("click", function() {
                let password = $("#passwordInput").val();
                let boardId = '';
                let pageNum = $("#pageNum").val();
                let amount = $("#amount").val();

                 $(".checkbox:checked").each(function() {
                    let row = $(this).closest("tr");
                    boardId = row.find("input[type='hidden']").val();
                    return false;
                });
                let data = {
                    boardId: boardId,
                    boardPassword: password
                };

                console.log("data ", data);

                 $.ajax({
                     url: '/checkPassword',
                     type: 'POST',
                     data: JSON.stringify(data),
                     contentType: 'application/json',
                     success: function(response) {
                        if(response.response == 'success'){
                         modal.hide();
                         alert("수정페이지로 이동합니다.")
                         window.location.href="/update?boardId=" + data.boardId + "&pageNum=" + pageNum  + "&amount=" + amount;
                         }else{
                           alert("비밀번호가 틀립니다.")
                         }
                     },
                     error: function(jqXHR, textStatus, errorThrown) {
                         alert('실패');
                     }
                 });

            });
       });

       // 삭제
       $("#delete").on("click", function(){
            let modal = $("#passwordModal");
            let close = $(".close");
            let submit = $("#submitPassword");

            if($(".checkbox:checked").length == 0){
                alert("삭제할 게시글을 먼저 선택해주세요.")
                return;
            }
            modal.show();

            close.on("click", function() {
               modal.hide();
            });

            // 확인 버튼 클릭 시 비밀번호 확인 비밀번호가 비어있는지 체크
            submit.on("click", function() {
                let password = $("#passwordInput").val();
                let boardId = '';

                 $(".checkbox:checked").each(function() {
                    let row = $(this).closest("tr");
                    boardId = row.find("input[type='hidden']").val();
                    return false;
                });
                let data = {
                    boardId: boardId,
                    boardPassword: password
                };

                console.log("data ", data);

                 $.ajax({
                     url: '/deleteBoard',
                     type: 'POST',
                     data: JSON.stringify(data),
                     contentType: 'application/json',
                     success: function(response) {
                        if(response.response == 'success'){
                         modal.hide();
                         alert("삭제완료")
                         location.reload();
                         }else{
                           alert("비밀번호가 틀립니다.")
                         }
                     },
                     error: function(jqXHR, textStatus, errorThrown) {
                         alert('실패');
                     }
                 });
            });

       });


       // 조회
       $("#search").on("click", function(){

         //유효성 검사
         if(validation()){

          let data = $('#searchBoard').serializeObject();
          console.log('Json으로 변환 : ' ,  JSON.stringify(data));
               $.ajax({
                   url: '/searchBoardList',
                   type: 'POST',
                   data: JSON.stringify(data),
                   contentType: 'application/json',
                   success: function(response) {
                        let boardList = response.boardList || [];
                        let pageMaker = response.pageMaker;

                        $('#boardList tbody').empty();

                         if(boardList.length >= 1) {
                            let str = '';
                            boardList.forEach(function(board) {
                                let rowHTML =
                                    '<tr>' +
                                        '<input id="boardId-' + (board.boardId || '') + '" type="hidden" value="' + (board.boardId || '') + '">' +
                                        '<td style="width:8%; border: 1px solid;"><input type="checkbox"></td>' +
                                        '<td style="width:8%; border: 1px solid;">' + (board.boardCompany || '') + '</td>' +
                                        '<td style="width:8%; border: 1px solid;">' + (board.rn || '') + '</td>' +

                                        '<td style="width:50%; border: 1px solid;">' +
                                          '<a href="#" class="boardTitleLink" data-board-id="' + (board.boardId || '') + '">' + (board.boardTitle || '') + '</a>' +
                                        '</td>' +

                                        '<td style="width:13%; border: 1px solid;">' + (board.boardWriter || '') + '</td>' +
                                        '<td style="width:13%; border: 1px solid;">' + (board.boardDate || '') + '</td>' +
                                    '</tr>';
                            $('#boardList tbody').append(rowHTML);
                        });

                        let pageInfoHTML = '';
                            pageInfoHTML += '<li class="pageInfoBtn first"><a href="1"> << </a></li>';
                            if (pageMaker.prev) {
                                pageInfoHTML += '<li class="pageInfoBtn previous"><a href="' + (pageMaker.startPage - 1) + '"> < </a></li>';
                            }

                            for (let num = pageMaker.startPage; num <= pageMaker.endPage; num++) {
                                pageInfoHTML += '<li class="pageInfo_btn"><a href="' + num + '">' + num + '</a></li>';
                            }

                            if (pageMaker.next) {
                                pageInfoHTML += '<li class="pageInfoBtn next"><a href="' + (pageMaker.endPage + 1) + '"> > </a></li>';
                            }

                            pageInfoHTML += '<li class="pageInfoBtn last"><a href="' + pageMaker.totalPages + '"> >> </a></li>';

                            let totalHTML = '<div style="text-align: right;">total: ' + pageMaker.total + '</div>';

                            let pagingHTML = '<tr>' +
                                          '<td colspan="3">' +
                                          '<div id="searchPage">' +
                                          '<ul id="pageInfo">' + pageInfoHTML + '</ul>' +
                                          '</div>' +
                                          '</td>' +
                                          '<td></td>' +
                                          '<td></td>' +
                                          '<td>' + totalHTML + '</td>' +
                                          '</tr>';
                            // 기존 페이징 UI 제거 후 새로 추가
                            $('#boardList tbody').append(pagingHTML);
                     }

                    },
                    error: function(jqXHR, textStatus, errorThrown) {
                       alert('조회 실패');
                    }
               });
         };

       });

    })


</script>
</html>