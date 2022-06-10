using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Visy.Middleware.LGX.CUB.Components
{
    public class Helper
    {
        public static string GetIso8601WeekOfYear(string date)
        {
            var week = CultureInfo.InvariantCulture.Calendar.GetWeekOfYear(Convert.ToDateTime(date), CalendarWeekRule.FirstFourDayWeek, DayOfWeek.Monday);
            var year = CultureInfo.InvariantCulture.Calendar.GetYear(Convert.ToDateTime(date));
            return week.ToString("00") + "." + year.ToString("0000");
        }
    }
}
