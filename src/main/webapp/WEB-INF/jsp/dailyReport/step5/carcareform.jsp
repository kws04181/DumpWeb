<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jsp/include/header.jsp" %>

<link rel="stylesheet" type="text/css" href="/resources/css/step5/import.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0"/>

<section class="DrvSection">
    <h2>차량관리 차계부 등록</h2> <span></span>
    <form name="entry_form">
        <input type="hidden" name="driveID" type="number" value = "0">
        <fieldset>
            <div class="item" name="item">
                <p style="margin-bottom: 10px; color: red;">* 품목을 선택해 주세요</p>
                <input type="radio" name="drvClub" id="rdOli" value="주유">
                <label for="rdOli" class="active">주유</label>

                <input type="radio" name="drvClub" id="rdDEF" value="요소수">
                <label for="rdDEF">요소수</label>

                <input type="radio" name="drvClub" id="rdEngOil" value="엔진오일">
                <label for="rdEngOil">엔진오일</label>

                <input type="radio" name="drvClub" id="rdFix" value="정비(수리)">
                <label for="rdFix">정비(수리)</label>

                <input type="radio" name="drvClub" id="rdNote" value="기타">
                <label for="rdNote">기타</label>
            </div>
            <ul class="CarUl">
                <li>
                    <label class="drvLabel" for="reg-date">날짜</label>
                    <span class="drvInputSpan"><input id="reg-date" inputmode="none" name="drvDate" onchange="bindList()"></span>
                    <label class="chk2" for="chk2">결재</label> <!--? 결제 체크박스 클릭시 수정 불가 -->
                    <input id="chk2" type="checkbox">
                </li>
                <li>
                    <label class="drvLabel" for="lastKm">최종 주행거리 km</label>
                    <span class="drvInputSpan"><input id="lastKm" name="lastKm" type="number" pattern="[0-9]*" inputmode="numeric" placeholder="차량계기판의 최종 주행거리"></span>
                </li>
                <li>
                    <label class="drvLabel" for="useAmt">사용금액</label>
                    <span class="drvInputSpan"><input id="useAmt" name="useAmt" type="number" pattern="[0-9]*" inputmode="numeric" placeholder="사용금액"></span>
                </li>
                <li>
                    <label class="drvLabel" for="useOil">주유량 L</label>
                    <span class="drvInputSpan"><input id="useOil" name="useOil" type="number" pattern="[0-9]*" inputmode="numeric" placeholder="주유량"></span>
                </li>
                <li>
                    <label class="drvLabel">기타(설명) <span><img class="drvVoiceImg" src="/resources/image/step5/ico_mic.png" alt="음성인식 버튼"></span> </label>
                    <span class="drvInputSpan"><textarea placeholder="주유소 및 정비소와 수리내용" id="drvRem voiceNotification" name="drvRem" class="voice-notification" cols="30" rows="2"></textarea></span>
                </li>
                <li class="tabBtn" data-tab="hiddenPart">
                    <label for="showHideCheckbox">다음 교환 주기 입력</label>
                    <span class="drvInputSpan2"><input id="showHideCheckbox" type="checkbox" checked></span>
                </li>
            </ul>
            <ul class="bdnUl" id="hiddenPart">
                <li>
                    <label class="drvLabel" for="exchange-date">교환 예정일</label>
                    <span class="drvInputSpan"><input id="exchange-date" inputmode="none" name="rependdate" value=""></span>
                </li>
                <li>
                    <label class="drvLabel" for="nextlastkm">교환 주행거리</label>
                    <span class="drvInputSpan"><input name="repaddkm" id="nextlastkm" type="number" pattern=”\d*” placeholder="다음 차량계기판의 최종 주행거리" value=""></span>
                </li>
                <li>
                    <label for="rependchk">교환 완료 확인</label>
                    <span class="drvInputSpan3"><input id="rependchk" type="checkbox"></span>
                </li>
            </ul>
        </fieldset>
    </form>

    <div>
        <button class="openBtn" data-popName="drvpop1">삭제</button>
        <button onclick="save()">저장</button>
        <button class="openBtn" data-popName="drvpop2">입력취소</button>
        <button class="openBtn" data-popName="drvpop3">이전화면</button>
    </div>

    <div id="drvpop1" class="drvPopup1">
        <div>
            <span class="material-symbols-outlined closeBtn">close</span>
            <p>정말 삭제하시겠습니까?</p>
            <input type="button" value="확인" onclick="deleteData()">
        </div>
    </div>

    <div id="drvpop2" class="drvPopup3">
        <div>
            <span class="material-symbols-outlined closeBtn">close</span>
            <p>입력값을 초기화 하시겠습니까?</p>
            <input type="button" value="확인" onclick="location.reload()">
        </div>
    </div>

    <div id="drvpop3" class="drvPopup3">
            <div>
                <span class="material-symbols-outlined closeBtn">close</span>
                <p>이전 화면으로 돌아가시겠습니까?</p>
                <input type="button" value="확인" onClick="history.go(-1)">
            </div>
        </div>

    <table>
        <thead>
            <tr>
                <th>날짜</th>
                <th>분류</th>
                <th class="Drvth2">최종주행(km)</th>
                <th class="Drvth2">사용금액</th>
                <th>기타(설명)</th>
                <th>교환 주기</th>
            </tr>
        </thead>
        <tbody>
        </tbody>
    </table>
</section>

<script src="/resources/js/dailyReport/step5/datepicker.js"></script>
<script src="/resources/js/dailyReport/step5/CheckDisabled.js"></script>
<script src="/resources/js/dailyReport/step5/tabpage.js"></script>
<script src="/resources/js/dailyReport/step5/voice.js"></script>
<script src="/resources/js/dailyReport/step5/list.js"></script>
<script src="/resources/js/dailyReport/step5/click.js"></script>
<script src="/resources/js/dailyReport/step5/popup.js"></script>
<script src="/resources/js/dailyReport/step5/param.js"></script>


<%@ include file="/WEB-INF/jsp/include/footer.jsp" %>