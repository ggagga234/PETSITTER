var my_calendar = new TavoCalendar('#my-calendar', {
            date: moment().format("YYYY-MM-DD"),
            date_start: "${mlist.mb_startday}",
            date_end: "${mlist.mb_endday}",
            format: "YYYY-MM-DD",
            locale: "de",
            range_select: false
        })