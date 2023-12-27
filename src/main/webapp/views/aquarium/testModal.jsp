<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>cocean</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<!-- popper CDN -->
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
	integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
	crossorigin="anonymous"></script>
	
<!-- 부트스트랩 자바스크립트 -->
<script src="/resource/js/bootstrap.min.js"></script>
<link rel="icon" href="resource/img/favi.png" type="image/x-icon">

<!-- 부트스트랩 CSS/favicon -->
<link rel="stylesheet" href="/resource/css/bootstrap.min.css">
<link rel="stylesheet" href="/resource/css/modal.css">
</head>
<body>
        <!-- button id는 개별 스타일을 위해 사용, 변경 가능 -->
        <!-- data-target은 '#' + 해당 버튼을 눌렀을 때 열릴 모달창 id -->
    <div>
        <button id="modalBtn" data-toggle="modal" data-target="#modal">등록</button>
    </div>
    
    <!-- 버튼 클릭 시 열리는 모달창 -->
    <div class="modal fade" id="modal" tabindex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <!-- 모달창 제목 -->
            <h5 class="modal-title">관리일지</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <form action=""> <!-- 입력폼 -->
              <div class="form-group">
                <label>담당자</label>
                <input type="text" id="manager" readonly class="form-control">
              </div>
              <div class="form-group">
                <label>내용</label>
                <textarea type="text" class="form-control" required oninvalid="this.setCustomValidity('관리 내용을 작성해 주세요.')" oninput="this.setCustomValidity('')" maxlength="500" placeholder="500자까지 작성 가능" style="height: 180px;"></textarea>
              </div>
              <div class="form-row">
                <label>작성 날짜</label>
                <input class="form-control" id="currentDate" readonly type="text" value="date">
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                <button type="submit" class="btn btn-primary">저장</button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </body>
  <script>
    // 모달창 등록 날짜 - 현재 기준 자동 입력
    $('#currentDate').val(new Date().toISOString().substring(0, 10).toString());
    // 모달창 작성자 자동 입력
    $('#manager').val('사육팀');
  </script>
</html>