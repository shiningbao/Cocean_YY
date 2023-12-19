const getDateRange = (startDate, endDate) => {
  const start = new Date(startDate);
  const end = new Date(endDate);

  const result = [];

  while (start <= end) {
    result.push(start.toISOString().split('T')[0]);
    start.setDate(start.getDate() + 1);
  }

  return result;
}

// 시작 날짜 ~ 종료 날짜
function makeRandomDate() {
  const $el = document.querySelector(".result");
  
  $el.classList.remove('show');
  
  const [start, end] = [...document.querySelectorAll("input")].map(v => v.value);
  
  if (!start) {
    return alert("시작일을 선택해주세요.");
  }
  
  if (!end) {
    return alert("종료일을 선택해주세요.");
  }
  
  if (start > end) {
    return alert("시작일은 종료일보다 작아야합니다.");
  }
  const TIME_ZONE = 3240 * 10000;

  const date = getDateRange(start, end);
  
  $el.classList.add('show');
  $el.innerHTML = date.map(x => `<p>${x}</p>`).join('');
}