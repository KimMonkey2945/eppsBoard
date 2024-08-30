<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

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
        table {
            border-collapse: collapse;
            width: 100%;
            max-width: 800px;
            border: 2px solid #000;
            margin-bottom: 20px; /* 테이블 간격 조정 */
        }
        td {
            padding: 8px;
            vertical-align: middle; /* 셀 내용 수직 중앙 정렬 */
        }
        .no-border {
            border: none;
        }
        .label-cell {
            width: 13%; /* 레이블 셀 너비 조정 */
        }
        .input-cell {
            width: 20%; /* 입력 셀 너비 조정 */
        }
        select, input[type="text"], textarea {
            width: 100%;
        }
        textarea {
            height: 100px; /* textarea 높이 설정 */
            resize: vertical; /* 세로로만 크기 조절 가능 */
        }
        .button-container {
                   text-align: right; /* 버튼을 우측으로 정렬 */
        }
        select {
              pointer-events: none; /* 클릭 및 선택 방지 */
              background-color: #e9ecef; /* 읽기 전용 느낌을 주기 위한 스타일 */
        }
    </style>
</head>
<body>
    <form id="boardDetail">
        <table>
            <c:forEach var="board" items="${boardList}">
                <input id="boardId" type="hidden" value="${board.boardId}" name="boardId">
                <tr>
                    <td class="label-cell no-border">회사</td>
                    <td class="input-cell">
                        <select id="boardCompany" name="boardCompany" readonly>
                            <option value="" selected disabled hidden>선택해주세요</option>
                            <option value="epps" <c:if test="${board.boardCompany == 'epps'}">selected</c:if>>epps</option>
                            <option value="kakao" <c:if test="${board.boardCompany == 'kakao'}">selected</c:if>>kakao</option>
                            <option value="coupang" <c:if test="${board.boardCompany == 'coupang'}">selected</c:if>>coupang</option>
                            <option value="google" <c:if test="${board.boardCompany == 'google'}">selected</c:if>>google</option>
                        </select>
                    </td>
                    <td class="label-cell no-border">등록일자</td>

                    <td class="input-cell">
                     <input id="boardDate" class="datepicker" name="boardDate" value="${board.boardDate}" readonly>
                    </td>
                    <td class="label-cell no-border">등록자</td>
                    <td class="input-cell"><input id="boardWriter" type="text" name="boardWriter" value="${board.boardWriter}" readonly></td>
                </tr>
                <tr>
                    <td class="label-cell no-border">제목</td>
                    <td colspan="3" class="input-cell">
                        <input id="boardTitle" type="text" name="boardTitle" value="${board.boardTitle}" readonly>
                    </td>
                </tr>

        </table>

        <table>
            <tr>
                <td colspan="2" class="no-border"><strong>내용</strong></td>
            </tr>
            <tr>
                <td colspan="2">
                    <textarea id="boardContent" name="boardContent" maxlength="1000" readonly>${board.boardContent}</textarea>
                </td>
            </tr>
            <tr>
                <td style="text-align: right;" >
                    <span id="textCount">0</span>/<span id="textTotal">1000</span>
                </td>
            </tr>
        </table>

        </c:forEach>
        <div class="button-container">
            <input id="close" type="button" value="닫기">
        </div>
    </form>
</body>

<script type="text/javascript">

   $(function(){

      // 글자 수 체크
      function checkTextCount(textareaId, countId, maxLength) {
          let content = $(textareaId).val();
          if(content.length > maxLength) {
              $(textareaId).val(content.substring(0, maxLength));
              content = $(textareaId).val(); // 업데이트된 내용을 사용
              alert('내용은' +  maxLength + '자까지 입력 가능합니다.');
          }
          $(countId).text(content.length);
      };

    checkTextCount('#boardContent', '#textCount', 1000);

     // 닫기 누를시 리스트로
     $('#close').on('click', function() {
         window.location.href = '/boardList';
     });

   });


</script>
</html>