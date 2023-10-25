// need script for calendar services
//will have child component: timeblock
import {useState} from "react";

function CalendarModel() {
    this.currentDate = new Date();

    this.numDaysInMonth = new Date(this.currentDate.getFullYear(), this.currentDate.getMonth() + 1, 0).getDate();
    this.firstWeekDay = new Date(this.currentDate.getFullYear(), this.currentDate.getMonth(), 1).getDay();
    this.firstWeekDayString = getDayString(this.firstWeekDay);

    function getDayString(fwd) {
        switch(fwd)
        {
            case 0:
                return "Sunday";
            case 1:
                return "Monday";
            case 2:
                return "Tuesday";
            case 3:
                return "Wednesday";
            case 4:
                return "Thursday";
            case 5:
                return "Friday";
            case 6:
                return "Saturday";
            default:
                return "invalid day";
        }
    }
    
}

function Calendar() {
    const [model, setModel] = useState(new CalendarModel());
/*
    function renderCalendar()
    {
        const WEEKDAYS = [            
                "Sunday",
                "Monday",
                "Tuesday",
                "Wednesday",
                "Thursday",
                "Friday",
                "Saturday"
        ];

        for(let day = 1; day < model.numDaysInMonth; day++) {
            <div id="week" className="week">
                WEEKDAYS.map((weekday){
                    return (
                    <div id="day" className="day">
                        {day}: {model.getDayStrng(new Date(this.currentDate.getFullYear(), this.currentDate.getMonth(), ++date).getDay())}
                    </div>
                    )
                });

            </div>
        }
    }
*/
    return (
        <div id="calendar" className="calendar">{model.firstWeekDayString}
        </div>
    )
}

export default Calendar;