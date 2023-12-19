// 캘린더 js
 document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');

    var calendar = new FullCalendar.Calendar(calendarEl, {
      
      headerToolbar: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,timeGridDay'
      },
      navLinks: true, // 날짜 선택하면 day 캘린더나 week 캘린더로 이동
      businessHours: true, //
      editable: true, // 수정 가능
      selectable: false, // 드래그 일정변경
      nowIndicator: true,
      locale: 'ko', // 한국어 설정
      events: [
        {
          title: 'Business Lunch',
          start: '2020-09-03T13:00:00',
          constraint: 'businessHours'
        },
        {
          title: 'Meeting',
          start: '2020-09-13T11:00:00',
          constraint: 'availableForMeeting', // defined below
          color: '#257e4a'
        },
        {
          title: 'Conference',
          start: '2023-12-19',
          end: '2023-12-21'
        },
        {
          title: 'Party',
          start: '2020-09-29T20:00:00'
        },

        // areas where "Meeting" must be dropped
        {
          groupId: 'availableForMeeting',
          start: '2020-09-11T10:00:00',
          end: '2020-09-11T16:00:00',
          display: 'background'
        },
        {
          groupId: 'availableForMeeting',
          start: '2020-09-13T10:00:00',
          end: '2020-09-13T16:00:00',
          display: 'background'
        },

        // red areas where no events can be dropped
        {
          start: '2020-09-24',
          end: '2020-09-28',
          overlap: false,
          display: 'background',
          color: '#ff9f89'
        },
        {
          start: '2020-09-06',
          end: '2020-09-08',
          overlap: false,
          display: 'background',
          color: '#ff9f89'
        }
      ]
    });

    calendar.render();
  }); 