using System;
using System.Text;
using System.Collections.Generic;
using System.IO;
using System.Xml;
using System.Xml.Serialization;
using Microsoft.XLANGs.BaseTypes;

namespace Visy.Middleware.SAP.LionNathan.Delfor.Components
{
    public class MonthlyConverter : BaseComponent
    {
        private readonly Forecast forecast;
        private List<ForecastDetailsSchedules> scheduleTemplate;

        public MonthlyConverter(XLANGMessage inmsg)
        {           
            this.forecast = this.Deserialize<Forecast>(inmsg);
        }

        public XmlDocument GetForecast()
        {
            ForecastHeader forecastHeader1 = new ForecastHeader();
            List<ForecastDetails> forecastDetailsList1 = new List<ForecastDetails>();
            ForecastHeader forecastHeader2 = this.PopulateHeader();
            this.scheduleTemplate = this.GenerateTemplate(forecastHeader2.FromPeriod);
            List<ForecastDetails> forecastDetailsList2 = this.PopulateItems();
            this.forecast.Header = forecastHeader2;
            this.forecast.CreateDetails(this.forecast.Details.Length);
            this.forecast.Details = forecastDetailsList2.ToArray();
            return this.Serialize((object)this.forecast);
        }

        private List<ForecastDetails> PopulateItems()
        {
            List<ForecastDetails> forecastDetailsList = new List<ForecastDetails>();
            foreach (ForecastDetails detail in this.forecast.Details)
            {
                List<ForecastDetailsSchedules> detailsSchedulesList = new List<ForecastDetailsSchedules>();
                for (int index = 0; index < this.scheduleTemplate.Count; ++index)
                {
                    ForecastDetailsSchedules detailsSchedules = new ForecastDetailsSchedules();
                    detailsSchedules.Date = this.scheduleTemplate[index].Date;
                    detailsSchedules.Bucket = this.scheduleTemplate[index].Bucket;
                    detailsSchedules.Quantity = "0";
                    detailsSchedules.DeliveryPlan = "PLAN";
                    detailsSchedulesList.Add(detailsSchedules);
                }
                ForecastDetails forecastDetails = new ForecastDetails();
                forecastDetails.CreateSchedules(52);
                forecastDetails.BlanketOrderNo = detail.BlanketOrderNo;
                forecastDetails.CustomerRef = detail.CustomerRef;
                forecastDetails.CustomerRefPeriod = detail.CustomerRefPeriod;
                forecastDetails.DeliveryPoint = detail.DeliveryPoint;
                forecastDetails.FabricQuantity = detail.FabricQuantity;
                forecastDetails.LineNo = detail.LineNo;
                forecastDetails.Material = detail.Material;
                forecastDetails.MaterialDescription = detail.MaterialDescription;
                forecastDetails.PrincipalRef = detail.PrincipalRef;
                forecastDetails.PrincipalRefPeriod = detail.PrincipalRefPeriod;
                forecastDetails.PriorCumQuantity = detail.PriorCumQuantity;
                forecastDetails.PriorPastNet = detail.PriorPastNet;
                forecastDetails.RawQuantity = detail.RawQuantity;
                forecastDetails.VisyShipTo = detail.VisyShipTo;
                forecastDetails.Schedules = detailsSchedulesList.ToArray();
                foreach (ForecastDetailsSchedules schedule in detail.Schedules)
                {
                    DateTime date = this.DateConvert(schedule.Date);
                    int year1 = date.Year;
                    int num1 = this.WeekNumber_Entire4DayWeekRule(date);
                    for (int index = 0; index < forecastDetails.Schedules.Length; ++index)
                    {
                        int year2 = this.DateConvert(forecastDetails.Schedules[index].Date).Year;
                        if (num1.ToString().Equals(forecastDetails.Schedules[index].Bucket) && year1 == year2)
                        {
                            if (schedule.Bucket.Equals("W"))
                            {
                                forecastDetails.Schedules[index].Quantity = schedule.Quantity;
                                break;
                            }
                            if (schedule.Bucket.Equals("M"))
                            {
                                int num2 = int.Parse(schedule.Quantity);
                                int daysOfMonth = MonthlyConverter.GetDaysOfMonth(date.Year, date.Month, DayOfWeek.Monday);
                                int num3 = num2 % daysOfMonth;
                                int num4 = (num2 - num3) / daysOfMonth;
                                int num5 = num3 + num4;
                                forecastDetails.Schedules[index].Quantity = num4.ToString();
                                if (daysOfMonth == 4)
                                {
                                    if (index < 51)
                                        forecastDetails.Schedules[index + 1].Quantity = num4.ToString();
                                    if (index < 50)
                                        forecastDetails.Schedules[index + 2].Quantity = num4.ToString();
                                    if (index < 49)
                                        forecastDetails.Schedules[index + 3].Quantity = num5.ToString();
                                }
                                else if (daysOfMonth == 5)
                                {
                                    if (index < 51)
                                        forecastDetails.Schedules[index + 1].Quantity = num4.ToString();
                                    if (index < 50)
                                        forecastDetails.Schedules[index + 2].Quantity = num4.ToString();
                                    if (index < 49)
                                        forecastDetails.Schedules[index + 3].Quantity = num4.ToString();
                                    if (index < 48)
                                        forecastDetails.Schedules[index + 4].Quantity = num5.ToString();
                                }
                            }
                        }
                    }
                }
                forecastDetailsList.Add(forecastDetails);
            }
            return forecastDetailsList;
        }

        private ForecastHeader PopulateHeader()
        {
            return this.forecast.Header;
        }

        private List<ForecastDetailsSchedules> GenerateTemplate(string period)
        {
            List<ForecastDetailsSchedules> detailsSchedulesList = new List<ForecastDetailsSchedules>();
            if (period.Length != 8)
            {
                string str1 = DateTime.Now.Year.ToString();
                DateTime now = DateTime.Now;
                string str2 = now.Month.ToString().PadLeft(2, '0');
                now = DateTime.Now;
                string str3 = now.Day.ToString().PadLeft(2, '0');
                period = str1 + str2 + str3;
            }
            DateTime startDate = this.DateConvert(period);
            int num = 52;
            for (int count = 1; count <= num; ++count)
            {
                ForecastDetailsSchedules detailsSchedules = new ForecastDetailsSchedules();
                detailsSchedules.Bucket = this.GenerateWeekNo(startDate, count);
                detailsSchedules.Quantity = "0";
                detailsSchedules.Date = this.GenerateDate(startDate, count);
                detailsSchedulesList.Add(detailsSchedules);
            }
            return detailsSchedulesList;
        }

        private DateTime DateConvert(string period)
        {
            string s1 = period.Substring(6, 2);
            string s2 = period.Substring(4, 2);
            return new DateTime(int.Parse(period.Substring(0, 4)), int.Parse(s2), int.Parse(s1));
        }

        private string GenerateWeekNo(DateTime startDate, int count)
        {
            if (count == 1)
                return this.WeekNumber_Entire4DayWeekRule(startDate).ToString();
            startDate = startDate.AddDays((double)((count - 1) * 7));
            return this.WeekNumber_Entire4DayWeekRule(startDate).ToString();
        }

        private string GenerateDate(DateTime startDate, int count)
        {
            if (count == 1)
            {
                string str1 = startDate.Year.ToString();
                int num = startDate.Month;
                string str2 = num.ToString().PadLeft(2, '0');
                num = startDate.Day;
                string str3 = num.ToString().PadLeft(2, '0');
                return str1 + str2 + str3;
            }
            startDate = startDate.AddDays((double)((count - 1) * 7));
            int num1 = startDate.Year;
            string str4 = num1.ToString();
            num1 = startDate.Month;
            string str5 = num1.ToString().PadLeft(2, '0');
            num1 = startDate.Day;
            string str6 = num1.ToString().PadLeft(2, '0');
            return str4 + str5 + str6;
        }

        public int WeekNumber_Entire4DayWeekRule(DateTime date)
        {
            bool flag = false;
            int dayOfYear = date.DayOfYear;
            int dayOfWeek1 = (int)new DateTime(date.Year, 1, 1).DayOfWeek;
            int dayOfWeek2 = (int)new DateTime(date.Year, 12, 31).DayOfWeek;
            int num1 = dayOfWeek1;
            int num2 = dayOfWeek2;
            if (num1 == 0)
                num1 = 7;
            if (num2 == 0)
                num2 = 7;
            int num3 = 8 - num1;
            int num4 = 8 - num2;
            if (num1 == 4 || num2 == 4)
                flag = true;
            int num5 = (int)Math.Ceiling((double)(dayOfYear - num3) / 7.0);
            if (num3 >= 4)
                ++num5;
            if (num5 > 52 && !flag)
                num5 = 1;
            if (num5 == 0)
                num5 = this.WeekNumber_Entire4DayWeekRule(new DateTime(date.Year - 1, 12, 31));
            return num5;
        }

        public static int GetDaysOfMonth(int Year, int Month, DayOfWeek DayOfWeek)
        {
            int num1 = DayOfWeek - new DateTime(Year, Month, 1).DayOfWeek;
            if (num1 < 0)
                num1 += 7;
            int num2 = DateTime.DaysInMonth(Year, Month) - 28;
            return num1 < num2 ? 5 : 4;
        }
    }
}