<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="modal fade" id="animo" tabindex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true">
      <div class="modal-dialog modal-dialog-scrollable">
        <div class="modal-content">
          <div class="modal-header">
            <!-- 모달창 제목 -->
            <h5 class="modal-title">코션친구들</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
              <table class="aniTable">
				<thead id="aniHead">
				<tr>
					<th scope="col">국명</th>
					<th scope="col">애칭</th>
					<th scope="col">개체수</th>
					<th scope="col">상태</th>
				</tr>
			</thead>
			<tbody id=aniList>
				<c:forEach items="${tankAnimal}" var="item">
					<tr>
						<td scope="row">${item.commonName}</td>
						<td><a href="/Cocoean/animal/detail.go?animalID=${item.animalID}">${item.nickname}</a></td>
						<td>${item.individual}</td>
						<td>${item.status}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
              </div>
          </div>
        </div>
      </div>
    </div>

</body>
</html>