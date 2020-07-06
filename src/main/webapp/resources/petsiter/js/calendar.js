
 
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
                var duration = moment.duration(end.diff(start)).asDays();

                console.log("시작:"+start_day);
                console.log("끝:"+end_day);
                console.log("차이:"+duration);
                
                var days = [];
                days.push(start_day);
                for(var i=0; i<duration;i++){
                    start_day=start.add(1,'day').toDate();
                    start_day=moment(start_day).format("yyyy-MM-DD");
                    days.push(start_day);
                }
                console.log(days);
            });

      
            
            $("#test").on("click",function(){
  			  var check = [];
  	            $("input[type='checkbox']:checked").each(function(index,item){
  					check.push($(item).val());
  				})
  				location.href="/indexs?start_day="+start_day+"&end_day="+end_day+"&reserve_time="+check;
            })

            
           
             
            		
           
        })