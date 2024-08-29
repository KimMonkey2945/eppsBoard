<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
    </style>
</head>
<body>
    <form id="boardRegister">
        <table>
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
                <td class="label-cell no-border">등록일자</td>
                <td class="input-cell"><input class="datepicker" id="boardDate" name="boardDate"></td>
                <td class="label-cell no-border">등록자</td>
                <td class="input-cell"><input id="boardWriter" type="text" name="boardWriter"></td>
            </tr>
            <tr>
                <td class="label-cell no-border">제목</td>
                <td colspan="3" class="input-cell"><input id="boardTitle" type="text" name="boardTitle"></td>
                <td class="label-cell no-border">비밀번호</td>
                <td class="input-cell"><input id="boardPassword" type="text" name="boardPassword"></td>
            </tr>
        </table>

        <table>
            <tr>
                <td colspan="2" class="no-border"><strong>내용</strong></td>
            </tr>
            <tr>
                <td colspan="2">
                    <textarea id="boardContent" name="boardContent" maxlength="1000"></textarea>
                </td>
            </tr>
            <tr>
                <td style="text-align: right;" >
                    <span id="textCount">0</span>/<span id="textTotal">1000</span>
                </td>
            </tr>
        </table>
        <div class="button-container">
            <input id="register" type="button" value="저장">
            <input id="close" type="button" value="닫기">
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

   // 유효성 검사
   function validation(){

        let boardCompany = $('#boardCompany').val();
        let boardDate = $('#boardDate').val();
        let boardWriter = $('#boardWriter').val();
        let boardTitle = $('#boardTitle').val();
        let boardPassword = $('#boardPassword').val();
        let boardContent = $('#boardContent').val();

        if (!boardCompany) {
            alert('회사를 선택해주세요.');
            return false;
        }
        if (!boardDate) {
            alert('날짜를 선택해주세요.');
            $('#boardDate').focus();
            return false;
        }
        if (!boardWriter) {
            alert('등록자를 입력해주세요.');
            $('#boardWriter').focus();
            return false;
        }
        if (!boardTitle) {
            alert('제목을 입력해주세요.');
            $('#boardTitle').focus();
            return false;
        }
        if (!boardPassword) {
            alert('비밀번호를 입력해주세요.');
            $('#boardPassword').focus();
            return false;
        }
        if (!boardContent) {
            alert('내용을 입력해주세요.');
            $('#boardContent').focus();
            return false;
        }

        return true;
   };

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