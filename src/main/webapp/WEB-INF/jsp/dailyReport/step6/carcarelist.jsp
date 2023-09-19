<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jsp/include/header.jsp" %>

<script>
    $(function() {
        // input을 datepicker로 선언
        $("#datepicker1, #datepicker2").datepicker({
            dateFormat: 'yy년 mm월 dd일', // 년도, 월, 일 텍스트 형식
            showOtherMonths: true,
            showMonthAfterYear: true,
            changeYear: true,
            changeMonth: true,
            showOn: "both",
            buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif",
            buttonImageOnly: true,
            buttonText: "선택",
            monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
            monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
            dayNamesMin: ['일','월','화','수','목','금','토'],
            dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'],
            minDate: "-10Y",
            maxDate: "+10y"
        });

        // 초기값을 오늘 날짜로 설정
        $("#datepicker1, #datepicker2").datepicker('setDate', 'today');

        // datepicker1을 매달 1일로 설정
        $("#datepicker1").datepicker('setDate', new Date(new Date().getFullYear(), new Date().getMonth(), 1));

        // datepicker2를 오늘 날짜로 설정
        $("#datepicker2").datepicker('setDate', 'today');
    });
</script>


  <!-- 스타일시트 연결 -->
<link rel="stylesheet" type="text/css" href="/resources/css/step6/index.css">

  <!-- Google Fonts 사전로드 -->
  <link rel="preconnect" href="https://fonts.googleapis.com" />
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
  <link
          href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;600;700;800&display=swap"
          rel="stylesheet"
  />
  <!-- flatpickr 라이브러리 -->
  <link
          rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css"
  />

  <!-- 구글 머티리얼 아이콘 -->
  <link
          rel="stylesheet"
          href="https://fonts.googleapis.com/icon?family=Material+Icons"
  />


    <!-- 페이지 본문 시작 -->
    <div class="sub_con_wrapper" id="maxwrap">
      <!-- 페이지 제목 및 위치 정보 -->
      <div class="subTitle_wrapper">
        <h1>
          차량관리 차계부 조회
      <img src="/resources/image/step6/ico_que.png" alt="도움말" class="info" />
    </h1>
  </div>

      <form name="select_frm">
        <input type="hidden" name="carNo" value=${sessionScope.loginInfo.userId} />
            <!-- 조회 양식 -->
            <div class="operating_period content conTop">
                <h1>기간</h1>
                <label class="start-text col" for="start-date">
                    <input id="datepicker1" name="startDate" readonly />
                    <span>~</span>
                    <input id="datepicker2" name="endDate" readonly />
                </label>
            </div>
            <div class="operating_period content">
                <h1>품목</h1>
                <select class="detailSelect conbox" name="selectOption" id="selectOption">
                    <option value="전체" selected>전체</option>
                    <option value="주유">주유</option>
                    <option value="요소수">요소수</option>
                    <option value="엔진오일">엔진오일</option>
                    <option value="정비(수리)">정비(수리)</option>
                    <option value="기타">기타</option>
                </select>
            </div>

            <!-- 날짜 기준, 품목 기준 radio 버튼 추가 -->
            <div class="inquiry_form section_check">
                <div class="operating_period content conChoice" id="flex_important">
                    <label>
                        날짜 기준
                        <input type="radio" name="searchType" value="date" checked />
                    </label>
                    <label>
                        품목 기준
                        <input type="radio" name="searchType" value="item" />
                    </label>
                </div>
            </div>

            <!-- 검색 버튼 -->
            <div class="search_container">
                <button type="button" class="search_btn common_btn" id="search-button" onclick=bindList() >검색</button>
            </div>
        </form>

      <div class="result_search">
        <h1></h1>
      </div>
      <div class="agreement_container">
      <button class="common_btn" style="width: 110px;">비용금액(원)<br /><span class="resultPrice">0</span></button>
        <div class="btnWraaper">
          <button class="common_btn">일괄결재</button>
          <button class="common_btn">취소</button>
        </div>
      </div>
      <div class="line"></div>

            <!-- 결과를 표시할 테이블 -->
            <div class="table_container">
              <table>
                <thead>
                  <tr class="th_title">
                    <th id="date-header">날짜</th>
                    <th id="item-header">품목</th>
                    <th>최종주행(km)</th>
                    <th>사용금액(원)</th>
                    <th>기타 (설명)</th>
                    <th>교환 주기</th>
                  </tr>
                </thead>
                <tbody id="table-body">
                </tbody>

              </table>
            </div>
</div>

<!-- 페이지 본문 종료 -->
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>

<script src="/resources/js/dailyReport/step6/index.js"></script>

<%@ include file="/WEB-INF/jsp/include/footer.jsp" %>


