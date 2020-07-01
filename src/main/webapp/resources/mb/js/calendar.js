 
var my_calendar = new TavoCalendar('#my-calendar', {
            date: moment().format("YYYY-MM-DD"),
            date_start: "",
            date_end: "",
            format: "YYYY-MM-DD",
            locale: "de",
            range_select: true
        })

        $(function() {
        	var days = [];
            var start_day = 0;
            var end_day = 0;
            $("#my-calendar").on("calendar-range", function() {
            	
            	var range = my_calendar.getRange();
                start_day = range.start;
                end_day = range.end;
                var start = moment(range.start);
                var end = moment(range.end);
                $("#mb_startday").val(start_day);
  				$("#mb_endday").val(end_day);
            });
           
        })