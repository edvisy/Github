using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace Visy.Middleware.SAP.Common.UnitTest
{
    [TestClass]
    public class MappingFunctoidsScriptTests
    {
        [TestMethod]
        public void aDayEarlier1Test() {
            var param = "05/10/2018";
            string day;
            string other;
            string month;
            string year;
            int iYear;
            month = param.Substring(0, param.IndexOf("/"));
            other = param.Substring(param.IndexOf("/") + 1);
            day = other.Substring(0, other.IndexOf("/"));
            year = other.Substring(other.IndexOf("/") + 1);

            DateTime date = new DateTime(int.Parse(year), int.Parse(month), int.Parse(day));
            System.Globalization.CultureInfo auCulture =
            System.Globalization.CultureInfo.CreateSpecificCulture("en-US");
            System.Globalization.Calendar cal = auCulture.Calendar;
            int weekNo = cal.GetWeekOfYear(date,
            auCulture.DateTimeFormat.CalendarWeekRule,
            auCulture.DateTimeFormat.FirstDayOfWeek);

            if (weekNo == 53)
            {
                weekNo = 1;
                iYear = int.Parse(year) + 1;
                year = iYear.ToString();
            }
            var s =  weekNo.ToString() + "." + year;
        }


        private string aDayEarlier1(string param, Boolean empty)
        {
            string daystr, other, monthstr, yearstr;
            if (!empty)
            {
                int day, month, year;
                monthstr = param.Substring(0, param.IndexOf("/"));
                other = param.Substring(param.IndexOf("/") + 1);
                daystr = other.Substring(0, other.IndexOf("/"));
                yearstr = other.Substring(other.IndexOf("/") + 1);
                day = int.Parse(daystr);
                month = int.Parse(monthstr);
                year = int.Parse(yearstr);


                day = day - 1;
                if (day == 0)
                {
                    month = month - 1;
                    switch (month)
                    {
                        case 1:
                            day = 31;
                            break;
                        case 2:
                            day = 29;
                            break;
                        case 3:
                            day = 31;
                            break;
                        case 4:
                            day = 30;
                            break;
                        case 5:
                            day = 31;
                            break;
                        case 6:
                            day = 30;
                            break;
                        case 7:
                            day = 31;
                            break;
                        case 8:
                            day = 31;
                            break;
                        case 9:
                            day = 30;
                            break;
                        case 10:
                            day = 31;
                            break;
                        case 11:
                            day = 30;
                            break;
                        default:
                            day = 31;
                            break;
                    }
                }
                if (month == 0)
                {
                    month = 12;
                    year = year - 1;
                }

                return month.ToString() + "/" + day.ToString() + "/" + year.ToString();
            }
            else
                return "";
        }
        private string H2W3(string param1, string param2, Boolean last)
        {
            string day1, other1, month1, year1, day2, other2, month2, year2;
            if (!last && !param2.Equals(""))
            {
                month1 = param1.Substring(0, param1.IndexOf("/"));
                other1 = param1.Substring(param1.IndexOf("/") + 1);
                day1 = other1.Substring(0, other1.IndexOf("/"));
                year1 = other1.Substring(other1.IndexOf("/") + 1);
                month2 = param2.Substring(0, param2.IndexOf("/"));
                other2 = param2.Substring(param2.IndexOf("/") + 1);
                day2 = other2.Substring(0, other2.IndexOf("/"));
                year2 = other2.Substring(other2.IndexOf("/") + 1);
                if (day2.Length == 1)
                    day2 = "0" + day2;
                return day1 + "-" + day2;
            }
            else if (!param1.Equals(""))
            {
                month1 = param1.Substring(0, param1.IndexOf("/"));
                other1 = param1.Substring(param1.IndexOf("/") + 1);
                day1 = other1.Substring(0, other1.IndexOf("/"));
                year1 = other1.Substring(other1.IndexOf("/") + 1);
                DateTime date = new DateTime(int.Parse(year1), int.Parse(month1), int.Parse(day1));
                System.Globalization.CultureInfo auCulture = System.Globalization.CultureInfo.CreateSpecificCulture("en-US");
                System.Globalization.Calendar cal = auCulture.Calendar;
                date = date + TimeSpan.FromDays(6);
                if (date.Day.ToString().Length == 1)
                    return day1 + "-0" + date.Day.ToString();
                return day1 + "-" + date.Day.ToString();
            }
            else
                return "";
        }

        public bool LogicalGt(string val1, string val2)
        {
            bool ret = false;
            double d1 = 0;
            double d2 = 0;
            if (IsNumeric(val1, ref d1) && IsNumeric(val2, ref d2))
            {
                ret = d1 > d2;
            }
            else
            {
                ret = String.Compare(val1, val2, StringComparison.Ordinal) > 0;
            }
            return ret;
        }


        public bool LogicalOr(string param0, string param1, string param2, string param3, string param4, string param5, string param6, string param7, string param8, string param9, string param10, string param11, string param12, string param13, string param14, string param15, string param16, string param17, string param18, string param19, string param20, string param21, string param22, string param23, string param24, string param25, string param26, string param27, string param28, string param29, string param30, string param31, string param32, string param33, string param34, string param35, string param36, string param37, string param38, string param39, string param40, string param41, string param42, string param43, string param44, string param45, string param46, string param47, string param48, string param49, string param50, string param51)
        {
            return ValToBool(param0) || ValToBool(param1) || ValToBool(param2) || ValToBool(param3) || ValToBool(param4) || ValToBool(param5) || ValToBool(param6) || ValToBool(param7) || ValToBool(param8) || ValToBool(param9) || ValToBool(param10) || ValToBool(param11) || ValToBool(param12) || ValToBool(param13) || ValToBool(param14) || ValToBool(param15) || ValToBool(param16) || ValToBool(param17) || ValToBool(param18) || ValToBool(param19) || ValToBool(param20) || ValToBool(param21) || ValToBool(param22) || ValToBool(param23) || ValToBool(param24) || ValToBool(param25) || ValToBool(param26) || ValToBool(param27) || ValToBool(param28) || ValToBool(param29) || ValToBool(param30) || ValToBool(param31) || ValToBool(param32) || ValToBool(param33) || ValToBool(param34) || ValToBool(param35) || ValToBool(param36) || ValToBool(param37) || ValToBool(param38) || ValToBool(param39) || ValToBool(param40) || ValToBool(param41) || ValToBool(param42) || ValToBool(param43) || ValToBool(param44) || ValToBool(param45) || ValToBool(param46) || ValToBool(param47) || ValToBool(param48) || ValToBool(param49) || ValToBool(param50) || ValToBool(param51);
            return false;
        }


        public int StringSize(string str)
        {
            if (str == null)
            {
                return 0;
            }
            return str.Length;
        }


        public bool LogicalAnd(string param0, string param1)
        {
            return ValToBool(param0) && ValToBool(param1);
            return false;
        }


        public string StringConcat(string param0)
        {
            return param0;
        }


        public string H1From(string param)
        {
            string day, other, month, year;
            month = param.Substring(0, param.IndexOf("/"));
            other = param.Substring(param.IndexOf("/") + 1);
            day = other.Substring(0, other.IndexOf("/"));
            year = other.Substring(other.IndexOf("/") + 1);
            return month + "." + year;
        }

        public string H1To(string param)
        {
            string day, other, month, year;
            month = param.Substring(0, param.IndexOf("/"));
            other = param.Substring(param.IndexOf("/") + 1);
            day = other.Substring(0, other.IndexOf("/"));
            year = other.Substring(other.IndexOf("/") + 1);
            return month + "." + year;
        }

        public string H1Date2(string param)
        {
            string day, other, month, year;
            month = param.Substring(0, param.IndexOf("/"));
            other = param.Substring(param.IndexOf("/") + 1);
            day = other.Substring(0, other.IndexOf("/"));
            year = other.Substring(other.IndexOf("/") + 1);
            return month + "." + year;
        }

        public string H1Date3(string param)
        {
            string day, other, month, year;
            month = param.Substring(0, param.IndexOf("/"));
            other = param.Substring(param.IndexOf("/") + 1);
            day = other.Substring(0, other.IndexOf("/"));
            year = other.Substring(other.IndexOf("/") + 1);
            return month + "." + year;
        }

        public string H1Date4(string param)
        {
            string day, other, month, year;
            month = param.Substring(0, param.IndexOf("/"));
            other = param.Substring(param.IndexOf("/") + 1);
            day = other.Substring(0, other.IndexOf("/"));
            year = other.Substring(other.IndexOf("/") + 1);
            return month + "." + year;
        }

        public string H1Date5(string param)
        {
            string day, other, month, year;
            month = param.Substring(0, param.IndexOf("/"));
            other = param.Substring(param.IndexOf("/") + 1);
            day = other.Substring(0, other.IndexOf("/"));
            year = other.Substring(other.IndexOf("/") + 1);
            return month + "." + year;
        }

        public string H1Date6(string param)
        {
            string day, other, month, year;
            month = param.Substring(0, param.IndexOf("/"));
            other = param.Substring(param.IndexOf("/") + 1);
            day = other.Substring(0, other.IndexOf("/"));
            year = other.Substring(other.IndexOf("/") + 1);
            return month + "." + year;
        }

        public string H1Date7(string param)
        {
            string day, other, month, year;
            month = param.Substring(0, param.IndexOf("/"));
            other = param.Substring(param.IndexOf("/") + 1);
            day = other.Substring(0, other.IndexOf("/"));
            year = other.Substring(other.IndexOf("/") + 1);
            return month + "." + year;
        }

        public string H1Date8(string param)
        {
            string day, other, month, year;
            month = param.Substring(0, param.IndexOf("/"));
            other = param.Substring(param.IndexOf("/") + 1);
            day = other.Substring(0, other.IndexOf("/"));
            year = other.Substring(other.IndexOf("/") + 1);
            return month + "." + year;
        }

        public string H1Date9(string param)
        {
            string day, other, month, year;
            month = param.Substring(0, param.IndexOf("/"));
            other = param.Substring(param.IndexOf("/") + 1);
            day = other.Substring(0, other.IndexOf("/"));
            year = other.Substring(other.IndexOf("/") + 1);
            return month + "." + year;
        }

        public string H1Date10(string param)
        {
            string day, other, month, year;
            month = param.Substring(0, param.IndexOf("/"));
            other = param.Substring(param.IndexOf("/") + 1);
            day = other.Substring(0, other.IndexOf("/"));
            year = other.Substring(other.IndexOf("/") + 1);
            return month + "." + year;
        }

        public string H1Date11(string param)
        {
            string day, other, month, year;
            month = param.Substring(0, param.IndexOf("/"));
            other = param.Substring(param.IndexOf("/") + 1);
            day = other.Substring(0, other.IndexOf("/"));
            year = other.Substring(other.IndexOf("/") + 1);
            return month + "." + year;
        }

        public string H1Date12(string param)
        {
            string day, other, month, year;
            month = param.Substring(0, param.IndexOf("/"));
            other = param.Substring(param.IndexOf("/") + 1);
            day = other.Substring(0, other.IndexOf("/"));
            year = other.Substring(other.IndexOf("/") + 1);
            return month + "." + year;
        }

        public string H1Date13(string param)
        {
            string day, other, month, year;
            month = param.Substring(0, param.IndexOf("/"));
            other = param.Substring(param.IndexOf("/") + 1);
            day = other.Substring(0, other.IndexOf("/"));
            year = other.Substring(other.IndexOf("/") + 1);
            return month + "." + year;
        }

        public string H1Date14(string param)
        {
            string day, other, month, year;
            month = param.Substring(0, param.IndexOf("/"));
            other = param.Substring(param.IndexOf("/") + 1);
            day = other.Substring(0, other.IndexOf("/"));
            year = other.Substring(other.IndexOf("/") + 1);
            return month + "." + year;
        }

        public string H1Date15(string param)
        {
            string day, other, month, year;
            month = param.Substring(0, param.IndexOf("/"));
            other = param.Substring(param.IndexOf("/") + 1);
            day = other.Substring(0, other.IndexOf("/"));
            year = other.Substring(other.IndexOf("/") + 1);
            return month + "." + year;
        }

        public string H1Date16(string param)
        {
            string day, other, month, year;
            month = param.Substring(0, param.IndexOf("/"));
            other = param.Substring(param.IndexOf("/") + 1);
            day = other.Substring(0, other.IndexOf("/"));
            year = other.Substring(other.IndexOf("/") + 1);
            return month + "." + year;
        }

        public string H1Date17(string param)
        {
            string day, other, month, year;
            month = param.Substring(0, param.IndexOf("/"));
            other = param.Substring(param.IndexOf("/") + 1);
            day = other.Substring(0, other.IndexOf("/"));
            year = other.Substring(other.IndexOf("/") + 1);
            return month + "." + year;
        }

        public string H1Date18(string param)
        {
            string day, other, month, year;
            month = param.Substring(0, param.IndexOf("/"));
            other = param.Substring(param.IndexOf("/") + 1);
            day = other.Substring(0, other.IndexOf("/"));
            year = other.Substring(other.IndexOf("/") + 1);
            return month + "." + year;
        }

        public string H1Date19(string param)
        {
            string day, other, month, year;
            month = param.Substring(0, param.IndexOf("/"));
            other = param.Substring(param.IndexOf("/") + 1);
            day = other.Substring(0, other.IndexOf("/"));
            year = other.Substring(other.IndexOf("/") + 1);
            return month + "." + year;
        }

        public string H1Date20(string param)
        {
            string day, other, month, year;
            month = param.Substring(0, param.IndexOf("/"));
            other = param.Substring(param.IndexOf("/") + 1);
            day = other.Substring(0, other.IndexOf("/"));
            year = other.Substring(other.IndexOf("/") + 1);
            return month + "." + year;
        }

        public string H1Date21(string param)
        {
            string day, other, month, year;
            month = param.Substring(0, param.IndexOf("/"));
            other = param.Substring(param.IndexOf("/") + 1);
            day = other.Substring(0, other.IndexOf("/"));
            year = other.Substring(other.IndexOf("/") + 1);
            return month + "." + year;
        }

        public string H1Date22(string param)
        {
            string day, other, month, year;
            month = param.Substring(0, param.IndexOf("/"));
            other = param.Substring(param.IndexOf("/") + 1);
            day = other.Substring(0, other.IndexOf("/"));
            year = other.Substring(other.IndexOf("/") + 1);
            return month + "." + year;
        }

        public string H1Date23(string param)
        {
            string day, other, month, year;
            month = param.Substring(0, param.IndexOf("/"));
            other = param.Substring(param.IndexOf("/") + 1);
            day = other.Substring(0, other.IndexOf("/"));
            year = other.Substring(other.IndexOf("/") + 1);
            return month + "." + year;
        }

        public string H1Date24(string param)
        {
            string day, other, month, year;
            month = param.Substring(0, param.IndexOf("/"));
            other = param.Substring(param.IndexOf("/") + 1);
            day = other.Substring(0, other.IndexOf("/"));
            year = other.Substring(other.IndexOf("/") + 1);
            return month + "." + year;
        }

        public string H1Date25(string param)
        {
            string day, other, month, year;
            month = param.Substring(0, param.IndexOf("/"));
            other = param.Substring(param.IndexOf("/") + 1);
            day = other.Substring(0, other.IndexOf("/"));
            year = other.Substring(other.IndexOf("/") + 1);
            return month + "." + year;
        }

        public string H1Date26(string param)
        {
            string day, other, month, year;
            month = param.Substring(0, param.IndexOf("/"));
            other = param.Substring(param.IndexOf("/") + 1);
            day = other.Substring(0, other.IndexOf("/"));
            year = other.Substring(other.IndexOf("/") + 1);
            return month + "." + year;
        }

        public string H1Date27(string param)
        {
            string day, other, month, year;
            month = param.Substring(0, param.IndexOf("/"));
            other = param.Substring(param.IndexOf("/") + 1);
            day = other.Substring(0, other.IndexOf("/"));
            year = other.Substring(other.IndexOf("/") + 1);
            return month + "." + year;
        }

        public string H1Date28(string param)
        {
            string day, other, month, year;
            month = param.Substring(0, param.IndexOf("/"));
            other = param.Substring(param.IndexOf("/") + 1);
            day = other.Substring(0, other.IndexOf("/"));
            year = other.Substring(other.IndexOf("/") + 1);
            return month + "." + year;
        }

        public string H1Date29(string param)
        {
            string day, other, month, year;
            month = param.Substring(0, param.IndexOf("/"));
            other = param.Substring(param.IndexOf("/") + 1);
            day = other.Substring(0, other.IndexOf("/"));
            year = other.Substring(other.IndexOf("/") + 1);
            return month + "." + year;
        }

        public string H1Date30(string param)
        {
            string day, other, month, year;
            month = param.Substring(0, param.IndexOf("/"));
            other = param.Substring(param.IndexOf("/") + 1);
            day = other.Substring(0, other.IndexOf("/"));
            year = other.Substring(other.IndexOf("/") + 1);
            return month + "." + year;
        }

        public string H1Date31(string param)
        {
            string day, other, month, year;
            month = param.Substring(0, param.IndexOf("/"));
            other = param.Substring(param.IndexOf("/") + 1);
            day = other.Substring(0, other.IndexOf("/"));
            year = other.Substring(other.IndexOf("/") + 1);
            return month + "." + year;
        }

        public string H1Date32(string param)
        {
            string day, other, month, year;
            month = param.Substring(0, param.IndexOf("/"));
            other = param.Substring(param.IndexOf("/") + 1);
            day = other.Substring(0, other.IndexOf("/"));
            year = other.Substring(other.IndexOf("/") + 1);
            return month + "." + year;
        }

        public string H1Date33(string param)
        {
            string day, other, month, year;
            month = param.Substring(0, param.IndexOf("/"));
            other = param.Substring(param.IndexOf("/") + 1);
            day = other.Substring(0, other.IndexOf("/"));
            year = other.Substring(other.IndexOf("/") + 1);
            return month + "." + year;
        }

        public string H1Date34(string param)
        {
            string day, other, month, year;
            month = param.Substring(0, param.IndexOf("/"));
            other = param.Substring(param.IndexOf("/") + 1);
            day = other.Substring(0, other.IndexOf("/"));
            year = other.Substring(other.IndexOf("/") + 1);
            return month + "." + year;
        }

        public string H1Date35(string param)
        {
            string day, other, month, year;
            month = param.Substring(0, param.IndexOf("/"));
            other = param.Substring(param.IndexOf("/") + 1);
            day = other.Substring(0, other.IndexOf("/"));
            year = other.Substring(other.IndexOf("/") + 1);
            return month + "." + year;
        }

        public string H1Date36(string param)
        {
            string day, other, month, year;
            month = param.Substring(0, param.IndexOf("/"));
            other = param.Substring(param.IndexOf("/") + 1);
            day = other.Substring(0, other.IndexOf("/"));
            year = other.Substring(other.IndexOf("/") + 1);
            return month + "." + year;
        }

        public string H1Date37(string param)
        {
            string day, other, month, year;
            month = param.Substring(0, param.IndexOf("/"));
            other = param.Substring(param.IndexOf("/") + 1);
            day = other.Substring(0, other.IndexOf("/"));
            year = other.Substring(other.IndexOf("/") + 1);
            return month + "." + year;
        }

        public string H1Date38(string param)
        {
            string day, other, month, year;
            month = param.Substring(0, param.IndexOf("/"));
            other = param.Substring(param.IndexOf("/") + 1);
            day = other.Substring(0, other.IndexOf("/"));
            year = other.Substring(other.IndexOf("/") + 1);
            return month + "." + year;
        }

        public string H1Date39(string param)
        {
            string day, other, month, year;
            month = param.Substring(0, param.IndexOf("/"));
            other = param.Substring(param.IndexOf("/") + 1);
            day = other.Substring(0, other.IndexOf("/"));
            year = other.Substring(other.IndexOf("/") + 1);
            return month + "." + year;
        }

        public string H1Date40(string param)
        {
            string day, other, month, year;
            month = param.Substring(0, param.IndexOf("/"));
            other = param.Substring(param.IndexOf("/") + 1);
            day = other.Substring(0, other.IndexOf("/"));
            year = other.Substring(other.IndexOf("/") + 1);
            return month + "." + year;
        }

        public string H1Date41(string param)
        {
            string day, other, month, year;
            month = param.Substring(0, param.IndexOf("/"));
            other = param.Substring(param.IndexOf("/") + 1);
            day = other.Substring(0, other.IndexOf("/"));
            year = other.Substring(other.IndexOf("/") + 1);
            return month + "." + year;
        }

        public string H1Date42(string param)
        {
            string day, other, month, year;
            month = param.Substring(0, param.IndexOf("/"));
            other = param.Substring(param.IndexOf("/") + 1);
            day = other.Substring(0, other.IndexOf("/"));
            year = other.Substring(other.IndexOf("/") + 1);
            return month + "." + year;
        }

        public string H1Date43(string param)
        {
            string day, other, month, year;
            month = param.Substring(0, param.IndexOf("/"));
            other = param.Substring(param.IndexOf("/") + 1);
            day = other.Substring(0, other.IndexOf("/"));
            year = other.Substring(other.IndexOf("/") + 1);
            return month + "." + year;
        }

        public string H1Date44(string param)
        {
            string day, other, month, year;
            month = param.Substring(0, param.IndexOf("/"));
            other = param.Substring(param.IndexOf("/") + 1);
            day = other.Substring(0, other.IndexOf("/"));
            year = other.Substring(other.IndexOf("/") + 1);
            return month + "." + year;
        }

        public string H1Date45(string param)
        {
            string day, other, month, year;
            month = param.Substring(0, param.IndexOf("/"));
            other = param.Substring(param.IndexOf("/") + 1);
            day = other.Substring(0, other.IndexOf("/"));
            year = other.Substring(other.IndexOf("/") + 1);
            return month + "." + year;
        }

        public string H1Date46(string param)
        {
            string day, other, month, year;
            month = param.Substring(0, param.IndexOf("/"));
            other = param.Substring(param.IndexOf("/") + 1);
            day = other.Substring(0, other.IndexOf("/"));
            year = other.Substring(other.IndexOf("/") + 1);
            return month + "." + year;
        }

        public string H1Date47(string param)
        {
            string day, other, month, year;
            month = param.Substring(0, param.IndexOf("/"));
            other = param.Substring(param.IndexOf("/") + 1);
            day = other.Substring(0, other.IndexOf("/"));
            year = other.Substring(other.IndexOf("/") + 1);
            return month + "." + year;
        }

        public string H1Date48(string param)
        {
            string day, other, month, year;
            month = param.Substring(0, param.IndexOf("/"));
            other = param.Substring(param.IndexOf("/") + 1);
            day = other.Substring(0, other.IndexOf("/"));
            year = other.Substring(other.IndexOf("/") + 1);
            return month + "." + year;
        }

        public string H1Date49(string param)
        {
            string day, other, month, year;
            month = param.Substring(0, param.IndexOf("/"));
            other = param.Substring(param.IndexOf("/") + 1);
            day = other.Substring(0, other.IndexOf("/"));
            year = other.Substring(other.IndexOf("/") + 1);
            return month + "." + year;
        }

        public string H1Date50(string param)
        {
            string day, other, month, year;
            month = param.Substring(0, param.IndexOf("/"));
            other = param.Substring(param.IndexOf("/") + 1);
            day = other.Substring(0, other.IndexOf("/"));
            year = other.Substring(other.IndexOf("/") + 1);
            return month + "." + year;
        }

        public string H1Date51(string param)
        {
            string day, other, month, year;
            month = param.Substring(0, param.IndexOf("/"));
            other = param.Substring(param.IndexOf("/") + 1);
            day = other.Substring(0, other.IndexOf("/"));
            year = other.Substring(other.IndexOf("/") + 1);
            return month + "." + year;
        }

        public string H2W1(string param1, string param2, Boolean last)
        {
            string day1, other1, month1, year1, day2, other2, month2, year2;
            if (!last && !param2.Equals(""))
            {
                month1 = param1.Substring(0, param1.IndexOf("/"));
                other1 = param1.Substring(param1.IndexOf("/") + 1);
                day1 = other1.Substring(0, other1.IndexOf("/"));
                year1 = other1.Substring(other1.IndexOf("/") + 1);
                month2 = param2.Substring(0, param2.IndexOf("/"));
                other2 = param2.Substring(param2.IndexOf("/") + 1);
                day2 = other2.Substring(0, other2.IndexOf("/"));
                year2 = other2.Substring(other2.IndexOf("/") + 1);
                if (day2.Length == 1)
                    day2 = "0" + day2;
                return day1 + "-" + day2;
            }
            else if (!param1.Equals(""))
            {
                month1 = param1.Substring(0, param1.IndexOf("/"));
                other1 = param1.Substring(param1.IndexOf("/") + 1);
                day1 = other1.Substring(0, other1.IndexOf("/"));
                year1 = other1.Substring(other1.IndexOf("/") + 1);
                DateTime date = new DateTime(int.Parse(year1), int.Parse(month1), int.Parse(day1));
                System.Globalization.CultureInfo auCulture = System.Globalization.CultureInfo.CreateSpecificCulture("en-US");
                System.Globalization.Calendar cal = auCulture.Calendar;
                date = date + TimeSpan.FromDays(6);
                if (date.Day.ToString().Length == 1)
                    return day1 + "-0" + date.Day.ToString();
                return day1 + "-" + date.Day.ToString();
            }
            else
                return "";
        }

        public string H2W2(string param1, string param2, Boolean last)
        {
            string day1, other1, month1, year1, day2, other2, month2, year2;
            if (!last && !param2.Equals(""))
            {
                month1 = param1.Substring(0, param1.IndexOf("/"));
                other1 = param1.Substring(param1.IndexOf("/") + 1);
                day1 = other1.Substring(0, other1.IndexOf("/"));
                year1 = other1.Substring(other1.IndexOf("/") + 1);
                month2 = param2.Substring(0, param2.IndexOf("/"));
                other2 = param2.Substring(param2.IndexOf("/") + 1);
                day2 = other2.Substring(0, other2.IndexOf("/"));
                year2 = other2.Substring(other2.IndexOf("/") + 1);
                if (day2.Length == 1)
                    day2 = "0" + day2;
                return day1 + "-" + day2;
            }
            else if (!param1.Equals(""))
            {
                month1 = param1.Substring(0, param1.IndexOf("/"));
                other1 = param1.Substring(param1.IndexOf("/") + 1);
                day1 = other1.Substring(0, other1.IndexOf("/"));
                year1 = other1.Substring(other1.IndexOf("/") + 1);
                DateTime date = new DateTime(int.Parse(year1), int.Parse(month1), int.Parse(day1));
                System.Globalization.CultureInfo auCulture = System.Globalization.CultureInfo.CreateSpecificCulture("en-US");
                System.Globalization.Calendar cal = auCulture.Calendar;
                date = date + TimeSpan.FromDays(6);
                if (date.Day.ToString().Length == 1)
                    return day1 + "-0" + date.Day.ToString();
                return day1 + "-" + date.Day.ToString();
            }
            else
                return "";
        }


        public string H2W5(string param1, string param2, Boolean last)
        {
            string day1, other1, month1, year1, day2, other2, month2, year2;
            if (!last && !param2.Equals(""))
            {
                month1 = param1.Substring(0, param1.IndexOf("/"));
                other1 = param1.Substring(param1.IndexOf("/") + 1);
                day1 = other1.Substring(0, other1.IndexOf("/"));
                year1 = other1.Substring(other1.IndexOf("/") + 1);
                month2 = param2.Substring(0, param2.IndexOf("/"));
                other2 = param2.Substring(param2.IndexOf("/") + 1);
                day2 = other2.Substring(0, other2.IndexOf("/"));
                year2 = other2.Substring(other2.IndexOf("/") + 1);
                if (day2.Length == 1)
                    day2 = "0" + day2;
                return day1 + "-" + day2;
            }
            else if (!param1.Equals(""))
            {
                month1 = param1.Substring(0, param1.IndexOf("/"));
                other1 = param1.Substring(param1.IndexOf("/") + 1);
                day1 = other1.Substring(0, other1.IndexOf("/"));
                year1 = other1.Substring(other1.IndexOf("/") + 1);
                DateTime date = new DateTime(int.Parse(year1), int.Parse(month1), int.Parse(day1));
                System.Globalization.CultureInfo auCulture = System.Globalization.CultureInfo.CreateSpecificCulture("en-US");
                System.Globalization.Calendar cal = auCulture.Calendar;
                date = date + TimeSpan.FromDays(6);
                if (date.Day.ToString().Length == 1)
                    return day1 + "-0" + date.Day.ToString();
                return day1 + "-" + date.Day.ToString();
            }
            else
                return "";
        }

        public string H2W6(string param1, string param2, Boolean last)
        {
            string day1, other1, month1, year1, day2, other2, month2, year2;
            if (!last && !param2.Equals(""))
            {
                month1 = param1.Substring(0, param1.IndexOf("/"));
                other1 = param1.Substring(param1.IndexOf("/") + 1);
                day1 = other1.Substring(0, other1.IndexOf("/"));
                year1 = other1.Substring(other1.IndexOf("/") + 1);
                month2 = param2.Substring(0, param2.IndexOf("/"));
                other2 = param2.Substring(param2.IndexOf("/") + 1);
                day2 = other2.Substring(0, other2.IndexOf("/"));
                year2 = other2.Substring(other2.IndexOf("/") + 1);
                if (day2.Length == 1)
                    day2 = "0" + day2;
                return day1 + "-" + day2;
            }
            else if (!param1.Equals(""))
            {
                month1 = param1.Substring(0, param1.IndexOf("/"));
                other1 = param1.Substring(param1.IndexOf("/") + 1);
                day1 = other1.Substring(0, other1.IndexOf("/"));
                year1 = other1.Substring(other1.IndexOf("/") + 1);
                DateTime date = new DateTime(int.Parse(year1), int.Parse(month1), int.Parse(day1));
                System.Globalization.CultureInfo auCulture = System.Globalization.CultureInfo.CreateSpecificCulture("en-US");
                System.Globalization.Calendar cal = auCulture.Calendar;
                date = date + TimeSpan.FromDays(6);
                if (date.Day.ToString().Length == 1)
                    return day1 + "-0" + date.Day.ToString();
                return day1 + "-" + date.Day.ToString();
            }
            else
                return "";
        }

        public string H2W7(string param1, string param2, Boolean last)
        {
            string day1, other1, month1, year1, day2, other2, month2, year2;
            if (!last && !param2.Equals(""))
            {
                month1 = param1.Substring(0, param1.IndexOf("/"));
                other1 = param1.Substring(param1.IndexOf("/") + 1);
                day1 = other1.Substring(0, other1.IndexOf("/"));
                year1 = other1.Substring(other1.IndexOf("/") + 1);
                month2 = param2.Substring(0, param2.IndexOf("/"));
                other2 = param2.Substring(param2.IndexOf("/") + 1);
                day2 = other2.Substring(0, other2.IndexOf("/"));
                year2 = other2.Substring(other2.IndexOf("/") + 1);
                if (day2.Length == 1)
                    day2 = "0" + day2;
                return day1 + "-" + day2;
            }
            else if (!param1.Equals(""))
            {
                month1 = param1.Substring(0, param1.IndexOf("/"));
                other1 = param1.Substring(param1.IndexOf("/") + 1);
                day1 = other1.Substring(0, other1.IndexOf("/"));
                year1 = other1.Substring(other1.IndexOf("/") + 1);
                DateTime date = new DateTime(int.Parse(year1), int.Parse(month1), int.Parse(day1));
                System.Globalization.CultureInfo auCulture = System.Globalization.CultureInfo.CreateSpecificCulture("en-US");
                System.Globalization.Calendar cal = auCulture.Calendar;
                date = date + TimeSpan.FromDays(6);
                if (date.Day.ToString().Length == 1)
                    return day1 + "-0" + date.Day.ToString();
                return day1 + "-" + date.Day.ToString();
            }
            else
                return "";
        }

        public string H2W4(string param1, string param2, Boolean last)
        {
            string day1, other1, month1, year1, day2, other2, month2, year2;
            if (!last && !param2.Equals(""))
            {
                month1 = param1.Substring(0, param1.IndexOf("/"));
                other1 = param1.Substring(param1.IndexOf("/") + 1);
                day1 = other1.Substring(0, other1.IndexOf("/"));
                year1 = other1.Substring(other1.IndexOf("/") + 1);
                month2 = param2.Substring(0, param2.IndexOf("/"));
                other2 = param2.Substring(param2.IndexOf("/") + 1);
                day2 = other2.Substring(0, other2.IndexOf("/"));
                year2 = other2.Substring(other2.IndexOf("/") + 1);
                if (day2.Length == 1)
                    day2 = "0" + day2;
                return day1 + "-" + day2;
            }
            else if (!param1.Equals(""))
            {
                month1 = param1.Substring(0, param1.IndexOf("/"));
                other1 = param1.Substring(param1.IndexOf("/") + 1);
                day1 = other1.Substring(0, other1.IndexOf("/"));
                year1 = other1.Substring(other1.IndexOf("/") + 1);
                DateTime date = new DateTime(int.Parse(year1), int.Parse(month1), int.Parse(day1));
                System.Globalization.CultureInfo auCulture = System.Globalization.CultureInfo.CreateSpecificCulture("en-US");
                System.Globalization.Calendar cal = auCulture.Calendar;
                date = date + TimeSpan.FromDays(6);
                if (date.Day.ToString().Length == 1)
                    return day1 + "-0" + date.Day.ToString();
                return day1 + "-" + date.Day.ToString();
            }
            else
                return "";
        }

        public string H2W8(string param1, string param2, Boolean last)
        {
            string day1, other1, month1, year1, day2, other2, month2, year2;
            if (!last && !param2.Equals(""))
            {
                month1 = param1.Substring(0, param1.IndexOf("/"));
                other1 = param1.Substring(param1.IndexOf("/") + 1);
                day1 = other1.Substring(0, other1.IndexOf("/"));
                year1 = other1.Substring(other1.IndexOf("/") + 1);
                month2 = param2.Substring(0, param2.IndexOf("/"));
                other2 = param2.Substring(param2.IndexOf("/") + 1);
                day2 = other2.Substring(0, other2.IndexOf("/"));
                year2 = other2.Substring(other2.IndexOf("/") + 1);
                if (day2.Length == 1)
                    day2 = "0" + day2;
                return day1 + "-" + day2;
            }
            else if (!param1.Equals(""))
            {
                month1 = param1.Substring(0, param1.IndexOf("/"));
                other1 = param1.Substring(param1.IndexOf("/") + 1);
                day1 = other1.Substring(0, other1.IndexOf("/"));
                year1 = other1.Substring(other1.IndexOf("/") + 1);
                DateTime date = new DateTime(int.Parse(year1), int.Parse(month1), int.Parse(day1));
                System.Globalization.CultureInfo auCulture = System.Globalization.CultureInfo.CreateSpecificCulture("en-US");
                System.Globalization.Calendar cal = auCulture.Calendar;
                date = date + TimeSpan.FromDays(6);
                if (date.Day.ToString().Length == 1)
                    return day1 + "-0" + date.Day.ToString();
                return day1 + "-" + date.Day.ToString();
            }
            else
                return "";
        }

        public string H2W9(string param1, string param2, Boolean last)
        {
            string day1, other1, month1, year1, day2, other2, month2, year2;
            if (!last && !param2.Equals(""))
            {
                month1 = param1.Substring(0, param1.IndexOf("/"));
                other1 = param1.Substring(param1.IndexOf("/") + 1);
                day1 = other1.Substring(0, other1.IndexOf("/"));
                year1 = other1.Substring(other1.IndexOf("/") + 1);
                month2 = param2.Substring(0, param2.IndexOf("/"));
                other2 = param2.Substring(param2.IndexOf("/") + 1);
                day2 = other2.Substring(0, other2.IndexOf("/"));
                year2 = other2.Substring(other2.IndexOf("/") + 1);
                if (day2.Length == 1)
                    day2 = "0" + day2;
                return day1 + "-" + day2;
            }
            else if (!param1.Equals(""))
            {
                month1 = param1.Substring(0, param1.IndexOf("/"));
                other1 = param1.Substring(param1.IndexOf("/") + 1);
                day1 = other1.Substring(0, other1.IndexOf("/"));
                year1 = other1.Substring(other1.IndexOf("/") + 1);
                DateTime date = new DateTime(int.Parse(year1), int.Parse(month1), int.Parse(day1));
                System.Globalization.CultureInfo auCulture = System.Globalization.CultureInfo.CreateSpecificCulture("en-US");
                System.Globalization.Calendar cal = auCulture.Calendar;
                date = date + TimeSpan.FromDays(6);
                if (date.Day.ToString().Length == 1)
                    return day1 + "-0" + date.Day.ToString();
                return day1 + "-" + date.Day.ToString();
            }
            else
                return "";
        }

        public string H2W10(string param1, string param2, Boolean last)
        {
            string day1, other1, month1, year1, day2, other2, month2, year2;
            if (!last && !param2.Equals(""))
            {
                month1 = param1.Substring(0, param1.IndexOf("/"));
                other1 = param1.Substring(param1.IndexOf("/") + 1);
                day1 = other1.Substring(0, other1.IndexOf("/"));
                year1 = other1.Substring(other1.IndexOf("/") + 1);
                month2 = param2.Substring(0, param2.IndexOf("/"));
                other2 = param2.Substring(param2.IndexOf("/") + 1);
                day2 = other2.Substring(0, other2.IndexOf("/"));
                year2 = other2.Substring(other2.IndexOf("/") + 1);
                if (day2.Length == 1)
                    day2 = "0" + day2;
                return day1 + "-" + day2;
            }
            else if (!param1.Equals(""))
            {
                month1 = param1.Substring(0, param1.IndexOf("/"));
                other1 = param1.Substring(param1.IndexOf("/") + 1);
                day1 = other1.Substring(0, other1.IndexOf("/"));
                year1 = other1.Substring(other1.IndexOf("/") + 1);
                DateTime date = new DateTime(int.Parse(year1), int.Parse(month1), int.Parse(day1));
                System.Globalization.CultureInfo auCulture = System.Globalization.CultureInfo.CreateSpecificCulture("en-US");
                System.Globalization.Calendar cal = auCulture.Calendar;
                date = date + TimeSpan.FromDays(6);
                if (date.Day.ToString().Length == 1)
                    return day1 + "-0" + date.Day.ToString();
                return day1 + "-" + date.Day.ToString();
            }
            else
                return "";
        }

        public string H2W11(string param1, string param2, Boolean last)
        {
            string day1, other1, month1, year1, day2, other2, month2, year2;
            if (!last && !param2.Equals(""))
            {
                month1 = param1.Substring(0, param1.IndexOf("/"));
                other1 = param1.Substring(param1.IndexOf("/") + 1);
                day1 = other1.Substring(0, other1.IndexOf("/"));
                year1 = other1.Substring(other1.IndexOf("/") + 1);
                month2 = param2.Substring(0, param2.IndexOf("/"));
                other2 = param2.Substring(param2.IndexOf("/") + 1);
                day2 = other2.Substring(0, other2.IndexOf("/"));
                year2 = other2.Substring(other2.IndexOf("/") + 1);
                if (day2.Length == 1)
                    day2 = "0" + day2;
                return day1 + "-" + day2;
            }
            else if (!param1.Equals(""))
            {
                month1 = param1.Substring(0, param1.IndexOf("/"));
                other1 = param1.Substring(param1.IndexOf("/") + 1);
                day1 = other1.Substring(0, other1.IndexOf("/"));
                year1 = other1.Substring(other1.IndexOf("/") + 1);
                DateTime date = new DateTime(int.Parse(year1), int.Parse(month1), int.Parse(day1));
                System.Globalization.CultureInfo auCulture = System.Globalization.CultureInfo.CreateSpecificCulture("en-US");
                System.Globalization.Calendar cal = auCulture.Calendar;
                date = date + TimeSpan.FromDays(6);
                if (date.Day.ToString().Length == 1)
                    return day1 + "-0" + date.Day.ToString();
                return day1 + "-" + date.Day.ToString();
            }
            else
                return "";
        }

        public string H2W12(string param1, string param2, Boolean last)
        {
            string day1, other1, month1, year1, day2, other2, month2, year2;
            if (!last && !param2.Equals(""))
            {
                month1 = param1.Substring(0, param1.IndexOf("/"));
                other1 = param1.Substring(param1.IndexOf("/") + 1);
                day1 = other1.Substring(0, other1.IndexOf("/"));
                year1 = other1.Substring(other1.IndexOf("/") + 1);
                month2 = param2.Substring(0, param2.IndexOf("/"));
                other2 = param2.Substring(param2.IndexOf("/") + 1);
                day2 = other2.Substring(0, other2.IndexOf("/"));
                year2 = other2.Substring(other2.IndexOf("/") + 1);
                if (day2.Length == 1)
                    day2 = "0" + day2;
                return day1 + "-" + day2;
            }
            else if (!param1.Equals(""))
            {
                month1 = param1.Substring(0, param1.IndexOf("/"));
                other1 = param1.Substring(param1.IndexOf("/") + 1);
                day1 = other1.Substring(0, other1.IndexOf("/"));
                year1 = other1.Substring(other1.IndexOf("/") + 1);
                DateTime date = new DateTime(int.Parse(year1), int.Parse(month1), int.Parse(day1));
                System.Globalization.CultureInfo auCulture = System.Globalization.CultureInfo.CreateSpecificCulture("en-US");
                System.Globalization.Calendar cal = auCulture.Calendar;
                date = date + TimeSpan.FromDays(6);
                if (date.Day.ToString().Length == 1)
                    return day1 + "-0" + date.Day.ToString();
                return day1 + "-" + date.Day.ToString();
            }
            else
                return "";
        }

        public string H2W13(string param1, string param2, Boolean last)
        {
            string day1, other1, month1, year1, day2, other2, month2, year2;
            if (!last && !param2.Equals(""))
            {
                month1 = param1.Substring(0, param1.IndexOf("/"));
                other1 = param1.Substring(param1.IndexOf("/") + 1);
                day1 = other1.Substring(0, other1.IndexOf("/"));
                year1 = other1.Substring(other1.IndexOf("/") + 1);
                month2 = param2.Substring(0, param2.IndexOf("/"));
                other2 = param2.Substring(param2.IndexOf("/") + 1);
                day2 = other2.Substring(0, other2.IndexOf("/"));
                year2 = other2.Substring(other2.IndexOf("/") + 1);
                if (day2.Length == 1)
                    day2 = "0" + day2;
                return day1 + "-" + day2;
            }
            else if (!param1.Equals(""))
            {
                month1 = param1.Substring(0, param1.IndexOf("/"));
                other1 = param1.Substring(param1.IndexOf("/") + 1);
                day1 = other1.Substring(0, other1.IndexOf("/"));
                year1 = other1.Substring(other1.IndexOf("/") + 1);
                DateTime date = new DateTime(int.Parse(year1), int.Parse(month1), int.Parse(day1));
                System.Globalization.CultureInfo auCulture = System.Globalization.CultureInfo.CreateSpecificCulture("en-US");
                System.Globalization.Calendar cal = auCulture.Calendar;
                date = date + TimeSpan.FromDays(6);
                if (date.Day.ToString().Length == 1)
                    return day1 + "-0" + date.Day.ToString();
                return day1 + "-" + date.Day.ToString();
            }
            else
                return "";
        }

        public string H2W14(string param1, string param2, Boolean last)
        {
            string day1, other1, month1, year1, day2, other2, month2, year2;
            if (!last && !param2.Equals(""))
            {
                month1 = param1.Substring(0, param1.IndexOf("/"));
                other1 = param1.Substring(param1.IndexOf("/") + 1);
                day1 = other1.Substring(0, other1.IndexOf("/"));
                year1 = other1.Substring(other1.IndexOf("/") + 1);
                month2 = param2.Substring(0, param2.IndexOf("/"));
                other2 = param2.Substring(param2.IndexOf("/") + 1);
                day2 = other2.Substring(0, other2.IndexOf("/"));
                year2 = other2.Substring(other2.IndexOf("/") + 1);
                if (day2.Length == 1)
                    day2 = "0" + day2;
                return day1 + "-" + day2;
            }
            else if (!param1.Equals(""))
            {
                month1 = param1.Substring(0, param1.IndexOf("/"));
                other1 = param1.Substring(param1.IndexOf("/") + 1);
                day1 = other1.Substring(0, other1.IndexOf("/"));
                year1 = other1.Substring(other1.IndexOf("/") + 1);
                DateTime date = new DateTime(int.Parse(year1), int.Parse(month1), int.Parse(day1));
                System.Globalization.CultureInfo auCulture = System.Globalization.CultureInfo.CreateSpecificCulture("en-US");
                System.Globalization.Calendar cal = auCulture.Calendar;
                date = date + TimeSpan.FromDays(6);
                if (date.Day.ToString().Length == 1)
                    return day1 + "-0" + date.Day.ToString();
                return day1 + "-" + date.Day.ToString();
            }
            else
                return "";
        }

        public string H2W15(string param1, string param2, Boolean last)
        {
            string day1, other1, month1, year1, day2, other2, month2, year2;
            if (!last && !param2.Equals(""))
            {
                month1 = param1.Substring(0, param1.IndexOf("/"));
                other1 = param1.Substring(param1.IndexOf("/") + 1);
                day1 = other1.Substring(0, other1.IndexOf("/"));
                year1 = other1.Substring(other1.IndexOf("/") + 1);
                month2 = param2.Substring(0, param2.IndexOf("/"));
                other2 = param2.Substring(param2.IndexOf("/") + 1);
                day2 = other2.Substring(0, other2.IndexOf("/"));
                year2 = other2.Substring(other2.IndexOf("/") + 1);
                if (day2.Length == 1)
                    day2 = "0" + day2;
                return day1 + "-" + day2;
            }
            else if (!param1.Equals(""))
            {
                month1 = param1.Substring(0, param1.IndexOf("/"));
                other1 = param1.Substring(param1.IndexOf("/") + 1);
                day1 = other1.Substring(0, other1.IndexOf("/"));
                year1 = other1.Substring(other1.IndexOf("/") + 1);
                DateTime date = new DateTime(int.Parse(year1), int.Parse(month1), int.Parse(day1));
                System.Globalization.CultureInfo auCulture = System.Globalization.CultureInfo.CreateSpecificCulture("en-US");
                System.Globalization.Calendar cal = auCulture.Calendar;
                date = date + TimeSpan.FromDays(6);
                if (date.Day.ToString().Length == 1)
                    return day1 + "-0" + date.Day.ToString();
                return day1 + "-" + date.Day.ToString();
            }
            else
                return "";
        }

        public string H2W16(string param1, string param2, Boolean last)
        {
            string day1, other1, month1, year1, day2, other2, month2, year2;
            if (!last && !param2.Equals(""))
            {
                month1 = param1.Substring(0, param1.IndexOf("/"));
                other1 = param1.Substring(param1.IndexOf("/") + 1);
                day1 = other1.Substring(0, other1.IndexOf("/"));
                year1 = other1.Substring(other1.IndexOf("/") + 1);
                month2 = param2.Substring(0, param2.IndexOf("/"));
                other2 = param2.Substring(param2.IndexOf("/") + 1);
                day2 = other2.Substring(0, other2.IndexOf("/"));
                year2 = other2.Substring(other2.IndexOf("/") + 1);
                if (day2.Length == 1)
                    day2 = "0" + day2;
                return day1 + "-" + day2;
            }
            else if (!param1.Equals(""))
            {
                month1 = param1.Substring(0, param1.IndexOf("/"));
                other1 = param1.Substring(param1.IndexOf("/") + 1);
                day1 = other1.Substring(0, other1.IndexOf("/"));
                year1 = other1.Substring(other1.IndexOf("/") + 1);
                DateTime date = new DateTime(int.Parse(year1), int.Parse(month1), int.Parse(day1));
                System.Globalization.CultureInfo auCulture = System.Globalization.CultureInfo.CreateSpecificCulture("en-US");
                System.Globalization.Calendar cal = auCulture.Calendar;
                date = date + TimeSpan.FromDays(6);
                if (date.Day.ToString().Length == 1)
                    return day1 + "-0" + date.Day.ToString();
                return day1 + "-" + date.Day.ToString();
            }
            else
                return "";
        }

        public string H2W17(string param1, string param2, Boolean last)
        {
            string day1, other1, month1, year1, day2, other2, month2, year2;
            if (!last && !param2.Equals(""))
            {
                month1 = param1.Substring(0, param1.IndexOf("/"));
                other1 = param1.Substring(param1.IndexOf("/") + 1);
                day1 = other1.Substring(0, other1.IndexOf("/"));
                year1 = other1.Substring(other1.IndexOf("/") + 1);
                month2 = param2.Substring(0, param2.IndexOf("/"));
                other2 = param2.Substring(param2.IndexOf("/") + 1);
                day2 = other2.Substring(0, other2.IndexOf("/"));
                year2 = other2.Substring(other2.IndexOf("/") + 1);
                if (day2.Length == 1)
                    day2 = "0" + day2;
                return day1 + "-" + day2;
            }
            else if (!param1.Equals(""))
            {
                month1 = param1.Substring(0, param1.IndexOf("/"));
                other1 = param1.Substring(param1.IndexOf("/") + 1);
                day1 = other1.Substring(0, other1.IndexOf("/"));
                year1 = other1.Substring(other1.IndexOf("/") + 1);
                DateTime date = new DateTime(int.Parse(year1), int.Parse(month1), int.Parse(day1));
                System.Globalization.CultureInfo auCulture = System.Globalization.CultureInfo.CreateSpecificCulture("en-US");
                System.Globalization.Calendar cal = auCulture.Calendar;
                date = date + TimeSpan.FromDays(6);
                if (date.Day.ToString().Length == 1)
                    return day1 + "-0" + date.Day.ToString();
                return day1 + "-" + date.Day.ToString();
            }
            else
                return "";
        }

        public string H2W18(string param1, string param2, Boolean last)
        {
            string day1, other1, month1, year1, day2, other2, month2, year2;
            if (!last && !param2.Equals(""))
            {
                month1 = param1.Substring(0, param1.IndexOf("/"));
                other1 = param1.Substring(param1.IndexOf("/") + 1);
                day1 = other1.Substring(0, other1.IndexOf("/"));
                year1 = other1.Substring(other1.IndexOf("/") + 1);
                month2 = param2.Substring(0, param2.IndexOf("/"));
                other2 = param2.Substring(param2.IndexOf("/") + 1);
                day2 = other2.Substring(0, other2.IndexOf("/"));
                year2 = other2.Substring(other2.IndexOf("/") + 1);
                if (day2.Length == 1)
                    day2 = "0" + day2;
                return day1 + "-" + day2;
            }
            else if (!param1.Equals(""))
            {
                month1 = param1.Substring(0, param1.IndexOf("/"));
                other1 = param1.Substring(param1.IndexOf("/") + 1);
                day1 = other1.Substring(0, other1.IndexOf("/"));
                year1 = other1.Substring(other1.IndexOf("/") + 1);
                DateTime date = new DateTime(int.Parse(year1), int.Parse(month1), int.Parse(day1));
                System.Globalization.CultureInfo auCulture = System.Globalization.CultureInfo.CreateSpecificCulture("en-US");
                System.Globalization.Calendar cal = auCulture.Calendar;
                date = date + TimeSpan.FromDays(6);
                if (date.Day.ToString().Length == 1)
                    return day1 + "-0" + date.Day.ToString();
                return day1 + "-" + date.Day.ToString();
            }
            else
                return "";
        }

        public string H2W19(string param1, string param2, Boolean last)
        {
            string day1, other1, month1, year1, day2, other2, month2, year2;
            if (!last && !param2.Equals(""))
            {
                month1 = param1.Substring(0, param1.IndexOf("/"));
                other1 = param1.Substring(param1.IndexOf("/") + 1);
                day1 = other1.Substring(0, other1.IndexOf("/"));
                year1 = other1.Substring(other1.IndexOf("/") + 1);
                month2 = param2.Substring(0, param2.IndexOf("/"));
                other2 = param2.Substring(param2.IndexOf("/") + 1);
                day2 = other2.Substring(0, other2.IndexOf("/"));
                year2 = other2.Substring(other2.IndexOf("/") + 1);
                if (day2.Length == 1)
                    day2 = "0" + day2;
                return day1 + "-" + day2;
            }
            else if (!param1.Equals(""))
            {
                month1 = param1.Substring(0, param1.IndexOf("/"));
                other1 = param1.Substring(param1.IndexOf("/") + 1);
                day1 = other1.Substring(0, other1.IndexOf("/"));
                year1 = other1.Substring(other1.IndexOf("/") + 1);
                DateTime date = new DateTime(int.Parse(year1), int.Parse(month1), int.Parse(day1));
                System.Globalization.CultureInfo auCulture = System.Globalization.CultureInfo.CreateSpecificCulture("en-US");
                System.Globalization.Calendar cal = auCulture.Calendar;
                date = date + TimeSpan.FromDays(6);
                if (date.Day.ToString().Length == 1)
                    return day1 + "-0" + date.Day.ToString();
                return day1 + "-" + date.Day.ToString();
            }
            else
                return "";
        }

        public string H2W20(string param1, string param2, Boolean last)
        {
            string day1, other1, month1, year1, day2, other2, month2, year2;
            if (!last && !param2.Equals(""))
            {
                month1 = param1.Substring(0, param1.IndexOf("/"));
                other1 = param1.Substring(param1.IndexOf("/") + 1);
                day1 = other1.Substring(0, other1.IndexOf("/"));
                year1 = other1.Substring(other1.IndexOf("/") + 1);
                month2 = param2.Substring(0, param2.IndexOf("/"));
                other2 = param2.Substring(param2.IndexOf("/") + 1);
                day2 = other2.Substring(0, other2.IndexOf("/"));
                year2 = other2.Substring(other2.IndexOf("/") + 1);
                if (day2.Length == 1)
                    day2 = "0" + day2;
                return day1 + "-" + day2;
            }
            else if (!param1.Equals(""))
            {
                month1 = param1.Substring(0, param1.IndexOf("/"));
                other1 = param1.Substring(param1.IndexOf("/") + 1);
                day1 = other1.Substring(0, other1.IndexOf("/"));
                year1 = other1.Substring(other1.IndexOf("/") + 1);
                DateTime date = new DateTime(int.Parse(year1), int.Parse(month1), int.Parse(day1));
                System.Globalization.CultureInfo auCulture = System.Globalization.CultureInfo.CreateSpecificCulture("en-US");
                System.Globalization.Calendar cal = auCulture.Calendar;
                date = date + TimeSpan.FromDays(6);
                if (date.Day.ToString().Length == 1)
                    return day1 + "-0" + date.Day.ToString();
                return day1 + "-" + date.Day.ToString();
            }
            else
                return "";
        }

        public string H2W21(string param1, string param2, Boolean last)
        {
            string day1, other1, month1, year1, day2, other2, month2, year2;
            if (!last && !param2.Equals(""))
            {
                month1 = param1.Substring(0, param1.IndexOf("/"));
                other1 = param1.Substring(param1.IndexOf("/") + 1);
                day1 = other1.Substring(0, other1.IndexOf("/"));
                year1 = other1.Substring(other1.IndexOf("/") + 1);
                month2 = param2.Substring(0, param2.IndexOf("/"));
                other2 = param2.Substring(param2.IndexOf("/") + 1);
                day2 = other2.Substring(0, other2.IndexOf("/"));
                year2 = other2.Substring(other2.IndexOf("/") + 1);
                if (day2.Length == 1)
                    day2 = "0" + day2;
                return day1 + "-" + day2;
            }
            else if (!param1.Equals(""))
            {
                month1 = param1.Substring(0, param1.IndexOf("/"));
                other1 = param1.Substring(param1.IndexOf("/") + 1);
                day1 = other1.Substring(0, other1.IndexOf("/"));
                year1 = other1.Substring(other1.IndexOf("/") + 1);
                DateTime date = new DateTime(int.Parse(year1), int.Parse(month1), int.Parse(day1));
                System.Globalization.CultureInfo auCulture = System.Globalization.CultureInfo.CreateSpecificCulture("en-US");
                System.Globalization.Calendar cal = auCulture.Calendar;
                date = date + TimeSpan.FromDays(6);
                if (date.Day.ToString().Length == 1)
                    return day1 + "-0" + date.Day.ToString();
                return day1 + "-" + date.Day.ToString();
            }
            else
                return "";
        }

        public string H2W22(string param1, string param2, Boolean last)
        {
            string day1, other1, month1, year1, day2, other2, month2, year2;
            if (!last && !param2.Equals(""))
            {
                month1 = param1.Substring(0, param1.IndexOf("/"));
                other1 = param1.Substring(param1.IndexOf("/") + 1);
                day1 = other1.Substring(0, other1.IndexOf("/"));
                year1 = other1.Substring(other1.IndexOf("/") + 1);
                month2 = param2.Substring(0, param2.IndexOf("/"));
                other2 = param2.Substring(param2.IndexOf("/") + 1);
                day2 = other2.Substring(0, other2.IndexOf("/"));
                year2 = other2.Substring(other2.IndexOf("/") + 1);
                if (day2.Length == 1)
                    day2 = "0" + day2;
                return day1 + "-" + day2;
            }
            else if (!param1.Equals(""))
            {
                month1 = param1.Substring(0, param1.IndexOf("/"));
                other1 = param1.Substring(param1.IndexOf("/") + 1);
                day1 = other1.Substring(0, other1.IndexOf("/"));
                year1 = other1.Substring(other1.IndexOf("/") + 1);
                DateTime date = new DateTime(int.Parse(year1), int.Parse(month1), int.Parse(day1));
                System.Globalization.CultureInfo auCulture = System.Globalization.CultureInfo.CreateSpecificCulture("en-US");
                System.Globalization.Calendar cal = auCulture.Calendar;
                date = date + TimeSpan.FromDays(6);
                if (date.Day.ToString().Length == 1)
                    return day1 + "-0" + date.Day.ToString();
                return day1 + "-" + date.Day.ToString();
            }
            else
                return "";
        }

        public string H2W23(string param1, string param2, Boolean last)
        {
            string day1, other1, month1, year1, day2, other2, month2, year2;
            if (!last && !param2.Equals(""))
            {
                month1 = param1.Substring(0, param1.IndexOf("/"));
                other1 = param1.Substring(param1.IndexOf("/") + 1);
                day1 = other1.Substring(0, other1.IndexOf("/"));
                year1 = other1.Substring(other1.IndexOf("/") + 1);
                month2 = param2.Substring(0, param2.IndexOf("/"));
                other2 = param2.Substring(param2.IndexOf("/") + 1);
                day2 = other2.Substring(0, other2.IndexOf("/"));
                year2 = other2.Substring(other2.IndexOf("/") + 1);
                if (day2.Length == 1)
                    day2 = "0" + day2;
                return day1 + "-" + day2;
            }
            else if (!param1.Equals(""))
            {
                month1 = param1.Substring(0, param1.IndexOf("/"));
                other1 = param1.Substring(param1.IndexOf("/") + 1);
                day1 = other1.Substring(0, other1.IndexOf("/"));
                year1 = other1.Substring(other1.IndexOf("/") + 1);
                DateTime date = new DateTime(int.Parse(year1), int.Parse(month1), int.Parse(day1));
                System.Globalization.CultureInfo auCulture = System.Globalization.CultureInfo.CreateSpecificCulture("en-US");
                System.Globalization.Calendar cal = auCulture.Calendar;
                date = date + TimeSpan.FromDays(6);
                if (date.Day.ToString().Length == 1)
                    return day1 + "-0" + date.Day.ToString();
                return day1 + "-" + date.Day.ToString();
            }
            else
                return "";
        }

        public string H2W24(string param1, string param2, Boolean last)
        {
            string day1, other1, month1, year1, day2, other2, month2, year2;
            if (!last && !param2.Equals(""))
            {
                month1 = param1.Substring(0, param1.IndexOf("/"));
                other1 = param1.Substring(param1.IndexOf("/") + 1);
                day1 = other1.Substring(0, other1.IndexOf("/"));
                year1 = other1.Substring(other1.IndexOf("/") + 1);
                month2 = param2.Substring(0, param2.IndexOf("/"));
                other2 = param2.Substring(param2.IndexOf("/") + 1);
                day2 = other2.Substring(0, other2.IndexOf("/"));
                year2 = other2.Substring(other2.IndexOf("/") + 1);
                if (day2.Length == 1)
                    day2 = "0" + day2;
                return day1 + "-" + day2;
            }
            else if (!param1.Equals(""))
            {
                month1 = param1.Substring(0, param1.IndexOf("/"));
                other1 = param1.Substring(param1.IndexOf("/") + 1);
                day1 = other1.Substring(0, other1.IndexOf("/"));
                year1 = other1.Substring(other1.IndexOf("/") + 1);
                DateTime date = new DateTime(int.Parse(year1), int.Parse(month1), int.Parse(day1));
                System.Globalization.CultureInfo auCulture = System.Globalization.CultureInfo.CreateSpecificCulture("en-US");
                System.Globalization.Calendar cal = auCulture.Calendar;
                date = date + TimeSpan.FromDays(6);
                if (date.Day.ToString().Length == 1)
                    return day1 + "-0" + date.Day.ToString();
                return day1 + "-" + date.Day.ToString();
            }
            else
                return "";
        }

        public string H2W25(string param1, string param2, Boolean last)
        {
            string day1, other1, month1, year1, day2, other2, month2, year2;
            if (!last && !param2.Equals(""))
            {
                month1 = param1.Substring(0, param1.IndexOf("/"));
                other1 = param1.Substring(param1.IndexOf("/") + 1);
                day1 = other1.Substring(0, other1.IndexOf("/"));
                year1 = other1.Substring(other1.IndexOf("/") + 1);
                month2 = param2.Substring(0, param2.IndexOf("/"));
                other2 = param2.Substring(param2.IndexOf("/") + 1);
                day2 = other2.Substring(0, other2.IndexOf("/"));
                year2 = other2.Substring(other2.IndexOf("/") + 1);
                if (day2.Length == 1)
                    day2 = "0" + day2;
                return day1 + "-" + day2;
            }
            else if (!param1.Equals(""))
            {
                month1 = param1.Substring(0, param1.IndexOf("/"));
                other1 = param1.Substring(param1.IndexOf("/") + 1);
                day1 = other1.Substring(0, other1.IndexOf("/"));
                year1 = other1.Substring(other1.IndexOf("/") + 1);
                DateTime date = new DateTime(int.Parse(year1), int.Parse(month1), int.Parse(day1));
                System.Globalization.CultureInfo auCulture = System.Globalization.CultureInfo.CreateSpecificCulture("en-US");
                System.Globalization.Calendar cal = auCulture.Calendar;
                date = date + TimeSpan.FromDays(6);
                if (date.Day.ToString().Length == 1)
                    return day1 + "-0" + date.Day.ToString();
                return day1 + "-" + date.Day.ToString();
            }
            else
                return "";
        }

        public string H2W26(string param1, string param2, Boolean last)
        {
            string day1, other1, month1, year1, day2, other2, month2, year2;
            if (!last && !param2.Equals(""))
            {
                month1 = param1.Substring(0, param1.IndexOf("/"));
                other1 = param1.Substring(param1.IndexOf("/") + 1);
                day1 = other1.Substring(0, other1.IndexOf("/"));
                year1 = other1.Substring(other1.IndexOf("/") + 1);
                month2 = param2.Substring(0, param2.IndexOf("/"));
                other2 = param2.Substring(param2.IndexOf("/") + 1);
                day2 = other2.Substring(0, other2.IndexOf("/"));
                year2 = other2.Substring(other2.IndexOf("/") + 1);
                if (day2.Length == 1)
                    day2 = "0" + day2;
                return day1 + "-" + day2;
            }
            else if (!param1.Equals(""))
            {
                month1 = param1.Substring(0, param1.IndexOf("/"));
                other1 = param1.Substring(param1.IndexOf("/") + 1);
                day1 = other1.Substring(0, other1.IndexOf("/"));
                year1 = other1.Substring(other1.IndexOf("/") + 1);
                DateTime date = new DateTime(int.Parse(year1), int.Parse(month1), int.Parse(day1));
                System.Globalization.CultureInfo auCulture = System.Globalization.CultureInfo.CreateSpecificCulture("en-US");
                System.Globalization.Calendar cal = auCulture.Calendar;
                date = date + TimeSpan.FromDays(6);
                if (date.Day.ToString().Length == 1)
                    return day1 + "-0" + date.Day.ToString();
                return day1 + "-" + date.Day.ToString();
            }
            else
                return "";
        }

        public string H2W27(string param1, string param2, Boolean last)
        {
            string day1, other1, month1, year1, day2, other2, month2, year2;
            if (!last && !param2.Equals(""))
            {
                month1 = param1.Substring(0, param1.IndexOf("/"));
                other1 = param1.Substring(param1.IndexOf("/") + 1);
                day1 = other1.Substring(0, other1.IndexOf("/"));
                year1 = other1.Substring(other1.IndexOf("/") + 1);
                month2 = param2.Substring(0, param2.IndexOf("/"));
                other2 = param2.Substring(param2.IndexOf("/") + 1);
                day2 = other2.Substring(0, other2.IndexOf("/"));
                year2 = other2.Substring(other2.IndexOf("/") + 1);
                if (day2.Length == 1)
                    day2 = "0" + day2;
                return day1 + "-" + day2;
            }
            else if (!param1.Equals(""))
            {
                month1 = param1.Substring(0, param1.IndexOf("/"));
                other1 = param1.Substring(param1.IndexOf("/") + 1);
                day1 = other1.Substring(0, other1.IndexOf("/"));
                year1 = other1.Substring(other1.IndexOf("/") + 1);
                DateTime date = new DateTime(int.Parse(year1), int.Parse(month1), int.Parse(day1));
                System.Globalization.CultureInfo auCulture = System.Globalization.CultureInfo.CreateSpecificCulture("en-US");
                System.Globalization.Calendar cal = auCulture.Calendar;
                date = date + TimeSpan.FromDays(6);
                if (date.Day.ToString().Length == 1)
                    return day1 + "-0" + date.Day.ToString();
                return day1 + "-" + date.Day.ToString();
            }
            else
                return "";
        }

        public string H2W28(string param1, string param2, Boolean last)
        {
            string day1, other1, month1, year1, day2, other2, month2, year2;
            if (!last && !param2.Equals(""))
            {
                month1 = param1.Substring(0, param1.IndexOf("/"));
                other1 = param1.Substring(param1.IndexOf("/") + 1);
                day1 = other1.Substring(0, other1.IndexOf("/"));
                year1 = other1.Substring(other1.IndexOf("/") + 1);
                month2 = param2.Substring(0, param2.IndexOf("/"));
                other2 = param2.Substring(param2.IndexOf("/") + 1);
                day2 = other2.Substring(0, other2.IndexOf("/"));
                year2 = other2.Substring(other2.IndexOf("/") + 1);
                if (day2.Length == 1)
                    day2 = "0" + day2;
                return day1 + "-" + day2;
            }
            else if (!param1.Equals(""))
            {
                month1 = param1.Substring(0, param1.IndexOf("/"));
                other1 = param1.Substring(param1.IndexOf("/") + 1);
                day1 = other1.Substring(0, other1.IndexOf("/"));
                year1 = other1.Substring(other1.IndexOf("/") + 1);
                DateTime date = new DateTime(int.Parse(year1), int.Parse(month1), int.Parse(day1));
                System.Globalization.CultureInfo auCulture = System.Globalization.CultureInfo.CreateSpecificCulture("en-US");
                System.Globalization.Calendar cal = auCulture.Calendar;
                date = date + TimeSpan.FromDays(6);
                if (date.Day.ToString().Length == 1)
                    return day1 + "-0" + date.Day.ToString();
                return day1 + "-" + date.Day.ToString();
            }
            else
                return "";
        }

        public string H2W29(string param1, string param2, Boolean last)
        {
            string day1, other1, month1, year1, day2, other2, month2, year2;
            if (!last && !param2.Equals(""))
            {
                month1 = param1.Substring(0, param1.IndexOf("/"));
                other1 = param1.Substring(param1.IndexOf("/") + 1);
                day1 = other1.Substring(0, other1.IndexOf("/"));
                year1 = other1.Substring(other1.IndexOf("/") + 1);
                month2 = param2.Substring(0, param2.IndexOf("/"));
                other2 = param2.Substring(param2.IndexOf("/") + 1);
                day2 = other2.Substring(0, other2.IndexOf("/"));
                year2 = other2.Substring(other2.IndexOf("/") + 1);
                if (day2.Length == 1)
                    day2 = "0" + day2;
                return day1 + "-" + day2;
            }
            else if (!param1.Equals(""))
            {
                month1 = param1.Substring(0, param1.IndexOf("/"));
                other1 = param1.Substring(param1.IndexOf("/") + 1);
                day1 = other1.Substring(0, other1.IndexOf("/"));
                year1 = other1.Substring(other1.IndexOf("/") + 1);
                DateTime date = new DateTime(int.Parse(year1), int.Parse(month1), int.Parse(day1));
                System.Globalization.CultureInfo auCulture = System.Globalization.CultureInfo.CreateSpecificCulture("en-US");
                System.Globalization.Calendar cal = auCulture.Calendar;
                date = date + TimeSpan.FromDays(6);
                if (date.Day.ToString().Length == 1)
                    return day1 + "-0" + date.Day.ToString();
                return day1 + "-" + date.Day.ToString();
            }
            else
                return "";
        }

        public string H2W30(string param1, string param2, Boolean last)
        {
            string day1, other1, month1, year1, day2, other2, month2, year2;
            if (!last && !param2.Equals(""))
            {
                month1 = param1.Substring(0, param1.IndexOf("/"));
                other1 = param1.Substring(param1.IndexOf("/") + 1);
                day1 = other1.Substring(0, other1.IndexOf("/"));
                year1 = other1.Substring(other1.IndexOf("/") + 1);
                month2 = param2.Substring(0, param2.IndexOf("/"));
                other2 = param2.Substring(param2.IndexOf("/") + 1);
                day2 = other2.Substring(0, other2.IndexOf("/"));
                year2 = other2.Substring(other2.IndexOf("/") + 1);
                if (day2.Length == 1)
                    day2 = "0" + day2;
                return day1 + "-" + day2;
            }
            else if (!param1.Equals(""))
            {
                month1 = param1.Substring(0, param1.IndexOf("/"));
                other1 = param1.Substring(param1.IndexOf("/") + 1);
                day1 = other1.Substring(0, other1.IndexOf("/"));
                year1 = other1.Substring(other1.IndexOf("/") + 1);
                DateTime date = new DateTime(int.Parse(year1), int.Parse(month1), int.Parse(day1));
                System.Globalization.CultureInfo auCulture = System.Globalization.CultureInfo.CreateSpecificCulture("en-US");
                System.Globalization.Calendar cal = auCulture.Calendar;
                date = date + TimeSpan.FromDays(6);
                if (date.Day.ToString().Length == 1)
                    return day1 + "-0" + date.Day.ToString();
                return day1 + "-" + date.Day.ToString();
            }
            else
                return "";
        }

        public string H2W31(string param1, string param2, Boolean last)
        {
            string day1, other1, month1, year1, day2, other2, month2, year2;
            if (!last && !param2.Equals(""))
            {
                month1 = param1.Substring(0, param1.IndexOf("/"));
                other1 = param1.Substring(param1.IndexOf("/") + 1);
                day1 = other1.Substring(0, other1.IndexOf("/"));
                year1 = other1.Substring(other1.IndexOf("/") + 1);
                month2 = param2.Substring(0, param2.IndexOf("/"));
                other2 = param2.Substring(param2.IndexOf("/") + 1);
                day2 = other2.Substring(0, other2.IndexOf("/"));
                year2 = other2.Substring(other2.IndexOf("/") + 1);
                if (day2.Length == 1)
                    day2 = "0" + day2;
                return day1 + "-" + day2;
            }
            else if (!param1.Equals(""))
            {
                month1 = param1.Substring(0, param1.IndexOf("/"));
                other1 = param1.Substring(param1.IndexOf("/") + 1);
                day1 = other1.Substring(0, other1.IndexOf("/"));
                year1 = other1.Substring(other1.IndexOf("/") + 1);
                DateTime date = new DateTime(int.Parse(year1), int.Parse(month1), int.Parse(day1));
                System.Globalization.CultureInfo auCulture = System.Globalization.CultureInfo.CreateSpecificCulture("en-US");
                System.Globalization.Calendar cal = auCulture.Calendar;
                date = date + TimeSpan.FromDays(6);
                if (date.Day.ToString().Length == 1)
                    return day1 + "-0" + date.Day.ToString();
                return day1 + "-" + date.Day.ToString();
            }
            else
                return "";
        }

        public string H2W32(string param1, string param2, Boolean last)
        {
            string day1, other1, month1, year1, day2, other2, month2, year2;
            if (!last && !param2.Equals(""))
            {
                month1 = param1.Substring(0, param1.IndexOf("/"));
                other1 = param1.Substring(param1.IndexOf("/") + 1);
                day1 = other1.Substring(0, other1.IndexOf("/"));
                year1 = other1.Substring(other1.IndexOf("/") + 1);
                month2 = param2.Substring(0, param2.IndexOf("/"));
                other2 = param2.Substring(param2.IndexOf("/") + 1);
                day2 = other2.Substring(0, other2.IndexOf("/"));
                year2 = other2.Substring(other2.IndexOf("/") + 1);
                if (day2.Length == 1)
                    day2 = "0" + day2;
                return day1 + "-" + day2;
            }
            else if (!param1.Equals(""))
            {
                month1 = param1.Substring(0, param1.IndexOf("/"));
                other1 = param1.Substring(param1.IndexOf("/") + 1);
                day1 = other1.Substring(0, other1.IndexOf("/"));
                year1 = other1.Substring(other1.IndexOf("/") + 1);
                DateTime date = new DateTime(int.Parse(year1), int.Parse(month1), int.Parse(day1));
                System.Globalization.CultureInfo auCulture = System.Globalization.CultureInfo.CreateSpecificCulture("en-US");
                System.Globalization.Calendar cal = auCulture.Calendar;
                date = date + TimeSpan.FromDays(6);
                if (date.Day.ToString().Length == 1)
                    return day1 + "-0" + date.Day.ToString();
                return day1 + "-" + date.Day.ToString();
            }
            else
                return "";
        }

        public string H2W33(string param1, string param2, Boolean last)
        {
            string day1, other1, month1, year1, day2, other2, month2, year2;
            if (!last && !param2.Equals(""))
            {
                month1 = param1.Substring(0, param1.IndexOf("/"));
                other1 = param1.Substring(param1.IndexOf("/") + 1);
                day1 = other1.Substring(0, other1.IndexOf("/"));
                year1 = other1.Substring(other1.IndexOf("/") + 1);
                month2 = param2.Substring(0, param2.IndexOf("/"));
                other2 = param2.Substring(param2.IndexOf("/") + 1);
                day2 = other2.Substring(0, other2.IndexOf("/"));
                year2 = other2.Substring(other2.IndexOf("/") + 1);
                if (day2.Length == 1)
                    day2 = "0" + day2;
                return day1 + "-" + day2;
            }
            else if (!param1.Equals(""))
            {
                month1 = param1.Substring(0, param1.IndexOf("/"));
                other1 = param1.Substring(param1.IndexOf("/") + 1);
                day1 = other1.Substring(0, other1.IndexOf("/"));
                year1 = other1.Substring(other1.IndexOf("/") + 1);
                DateTime date = new DateTime(int.Parse(year1), int.Parse(month1), int.Parse(day1));
                System.Globalization.CultureInfo auCulture = System.Globalization.CultureInfo.CreateSpecificCulture("en-US");
                System.Globalization.Calendar cal = auCulture.Calendar;
                date = date + TimeSpan.FromDays(6);
                if (date.Day.ToString().Length == 1)
                    return day1 + "-0" + date.Day.ToString();
                return day1 + "-" + date.Day.ToString();
            }
            else
                return "";
        }

        public string H2W34(string param1, string param2, Boolean last)
        {
            string day1, other1, month1, year1, day2, other2, month2, year2;
            if (!last && !param2.Equals(""))
            {
                month1 = param1.Substring(0, param1.IndexOf("/"));
                other1 = param1.Substring(param1.IndexOf("/") + 1);
                day1 = other1.Substring(0, other1.IndexOf("/"));
                year1 = other1.Substring(other1.IndexOf("/") + 1);
                month2 = param2.Substring(0, param2.IndexOf("/"));
                other2 = param2.Substring(param2.IndexOf("/") + 1);
                day2 = other2.Substring(0, other2.IndexOf("/"));
                year2 = other2.Substring(other2.IndexOf("/") + 1);
                if (day2.Length == 1)
                    day2 = "0" + day2;
                return day1 + "-" + day2;
            }
            else if (!param1.Equals(""))
            {
                month1 = param1.Substring(0, param1.IndexOf("/"));
                other1 = param1.Substring(param1.IndexOf("/") + 1);
                day1 = other1.Substring(0, other1.IndexOf("/"));
                year1 = other1.Substring(other1.IndexOf("/") + 1);
                DateTime date = new DateTime(int.Parse(year1), int.Parse(month1), int.Parse(day1));
                System.Globalization.CultureInfo auCulture = System.Globalization.CultureInfo.CreateSpecificCulture("en-US");
                System.Globalization.Calendar cal = auCulture.Calendar;
                date = date + TimeSpan.FromDays(6);
                if (date.Day.ToString().Length == 1)
                    return day1 + "-0" + date.Day.ToString();
                return day1 + "-" + date.Day.ToString();
            }
            else
                return "";
        }

        public string H2W35(string param1, string param2, Boolean last)
        {
            string day1, other1, month1, year1, day2, other2, month2, year2;
            if (!last && !param2.Equals(""))
            {
                month1 = param1.Substring(0, param1.IndexOf("/"));
                other1 = param1.Substring(param1.IndexOf("/") + 1);
                day1 = other1.Substring(0, other1.IndexOf("/"));
                year1 = other1.Substring(other1.IndexOf("/") + 1);
                month2 = param2.Substring(0, param2.IndexOf("/"));
                other2 = param2.Substring(param2.IndexOf("/") + 1);
                day2 = other2.Substring(0, other2.IndexOf("/"));
                year2 = other2.Substring(other2.IndexOf("/") + 1);
                if (day2.Length == 1)
                    day2 = "0" + day2;
                return day1 + "-" + day2;
            }
            else if (!param1.Equals(""))
            {
                month1 = param1.Substring(0, param1.IndexOf("/"));
                other1 = param1.Substring(param1.IndexOf("/") + 1);
                day1 = other1.Substring(0, other1.IndexOf("/"));
                year1 = other1.Substring(other1.IndexOf("/") + 1);
                DateTime date = new DateTime(int.Parse(year1), int.Parse(month1), int.Parse(day1));
                System.Globalization.CultureInfo auCulture = System.Globalization.CultureInfo.CreateSpecificCulture("en-US");
                System.Globalization.Calendar cal = auCulture.Calendar;
                date = date + TimeSpan.FromDays(6);
                if (date.Day.ToString().Length == 1)
                    return day1 + "-0" + date.Day.ToString();
                return day1 + "-" + date.Day.ToString();
            }
            else
                return "";
        }

        public string H2W36(string param1, string param2, Boolean last)
        {
            string day1, other1, month1, year1, day2, other2, month2, year2;
            if (!last && !param2.Equals(""))
            {
                month1 = param1.Substring(0, param1.IndexOf("/"));
                other1 = param1.Substring(param1.IndexOf("/") + 1);
                day1 = other1.Substring(0, other1.IndexOf("/"));
                year1 = other1.Substring(other1.IndexOf("/") + 1);
                month2 = param2.Substring(0, param2.IndexOf("/"));
                other2 = param2.Substring(param2.IndexOf("/") + 1);
                day2 = other2.Substring(0, other2.IndexOf("/"));
                year2 = other2.Substring(other2.IndexOf("/") + 1);
                if (day2.Length == 1)
                    day2 = "0" + day2;
                return day1 + "-" + day2;
            }
            else if (!param1.Equals(""))
            {
                month1 = param1.Substring(0, param1.IndexOf("/"));
                other1 = param1.Substring(param1.IndexOf("/") + 1);
                day1 = other1.Substring(0, other1.IndexOf("/"));
                year1 = other1.Substring(other1.IndexOf("/") + 1);
                DateTime date = new DateTime(int.Parse(year1), int.Parse(month1), int.Parse(day1));
                System.Globalization.CultureInfo auCulture = System.Globalization.CultureInfo.CreateSpecificCulture("en-US");
                System.Globalization.Calendar cal = auCulture.Calendar;
                date = date + TimeSpan.FromDays(6);
                if (date.Day.ToString().Length == 1)
                    return day1 + "-0" + date.Day.ToString();
                return day1 + "-" + date.Day.ToString();
            }
            else
                return "";
        }

        public string H2W37(string param1, string param2, Boolean last)
        {
            string day1, other1, month1, year1, day2, other2, month2, year2;
            if (!last && !param2.Equals(""))
            {
                month1 = param1.Substring(0, param1.IndexOf("/"));
                other1 = param1.Substring(param1.IndexOf("/") + 1);
                day1 = other1.Substring(0, other1.IndexOf("/"));
                year1 = other1.Substring(other1.IndexOf("/") + 1);
                month2 = param2.Substring(0, param2.IndexOf("/"));
                other2 = param2.Substring(param2.IndexOf("/") + 1);
                day2 = other2.Substring(0, other2.IndexOf("/"));
                year2 = other2.Substring(other2.IndexOf("/") + 1);
                if (day2.Length == 1)
                    day2 = "0" + day2;
                return day1 + "-" + day2;
            }
            else if (!param1.Equals(""))
            {
                month1 = param1.Substring(0, param1.IndexOf("/"));
                other1 = param1.Substring(param1.IndexOf("/") + 1);
                day1 = other1.Substring(0, other1.IndexOf("/"));
                year1 = other1.Substring(other1.IndexOf("/") + 1);
                DateTime date = new DateTime(int.Parse(year1), int.Parse(month1), int.Parse(day1));
                System.Globalization.CultureInfo auCulture = System.Globalization.CultureInfo.CreateSpecificCulture("en-US");
                System.Globalization.Calendar cal = auCulture.Calendar;
                date = date + TimeSpan.FromDays(6);
                if (date.Day.ToString().Length == 1)
                    return day1 + "-0" + date.Day.ToString();
                return day1 + "-" + date.Day.ToString();
            }
            else
                return "";
        }

        public string H2W38(string param1, string param2, Boolean last)
        {
            string day1, other1, month1, year1, day2, other2, month2, year2;
            if (!last && !param2.Equals(""))
            {
                month1 = param1.Substring(0, param1.IndexOf("/"));
                other1 = param1.Substring(param1.IndexOf("/") + 1);
                day1 = other1.Substring(0, other1.IndexOf("/"));
                year1 = other1.Substring(other1.IndexOf("/") + 1);
                month2 = param2.Substring(0, param2.IndexOf("/"));
                other2 = param2.Substring(param2.IndexOf("/") + 1);
                day2 = other2.Substring(0, other2.IndexOf("/"));
                year2 = other2.Substring(other2.IndexOf("/") + 1);
                if (day2.Length == 1)
                    day2 = "0" + day2;
                return day1 + "-" + day2;
            }
            else if (!param1.Equals(""))
            {
                month1 = param1.Substring(0, param1.IndexOf("/"));
                other1 = param1.Substring(param1.IndexOf("/") + 1);
                day1 = other1.Substring(0, other1.IndexOf("/"));
                year1 = other1.Substring(other1.IndexOf("/") + 1);
                DateTime date = new DateTime(int.Parse(year1), int.Parse(month1), int.Parse(day1));
                System.Globalization.CultureInfo auCulture = System.Globalization.CultureInfo.CreateSpecificCulture("en-US");
                System.Globalization.Calendar cal = auCulture.Calendar;
                date = date + TimeSpan.FromDays(6);
                if (date.Day.ToString().Length == 1)
                    return day1 + "-0" + date.Day.ToString();
                return day1 + "-" + date.Day.ToString();
            }
            else
                return "";
        }

        public string H2W39(string param1, string param2, Boolean last)
        {
            string day1, other1, month1, year1, day2, other2, month2, year2;
            if (!last && !param2.Equals(""))
            {
                month1 = param1.Substring(0, param1.IndexOf("/"));
                other1 = param1.Substring(param1.IndexOf("/") + 1);
                day1 = other1.Substring(0, other1.IndexOf("/"));
                year1 = other1.Substring(other1.IndexOf("/") + 1);
                month2 = param2.Substring(0, param2.IndexOf("/"));
                other2 = param2.Substring(param2.IndexOf("/") + 1);
                day2 = other2.Substring(0, other2.IndexOf("/"));
                year2 = other2.Substring(other2.IndexOf("/") + 1);
                if (day2.Length == 1)
                    day2 = "0" + day2;
                return day1 + "-" + day2;
            }
            else if (!param1.Equals(""))
            {
                month1 = param1.Substring(0, param1.IndexOf("/"));
                other1 = param1.Substring(param1.IndexOf("/") + 1);
                day1 = other1.Substring(0, other1.IndexOf("/"));
                year1 = other1.Substring(other1.IndexOf("/") + 1);
                DateTime date = new DateTime(int.Parse(year1), int.Parse(month1), int.Parse(day1));
                System.Globalization.CultureInfo auCulture = System.Globalization.CultureInfo.CreateSpecificCulture("en-US");
                System.Globalization.Calendar cal = auCulture.Calendar;
                date = date + TimeSpan.FromDays(6);
                if (date.Day.ToString().Length == 1)
                    return day1 + "-0" + date.Day.ToString();
                return day1 + "-" + date.Day.ToString();
            }
            else
                return "";
        }

        public string H2W40(string param1, string param2, Boolean last)
        {
            string day1, other1, month1, year1, day2, other2, month2, year2;
            if (!last && !param2.Equals(""))
            {
                month1 = param1.Substring(0, param1.IndexOf("/"));
                other1 = param1.Substring(param1.IndexOf("/") + 1);
                day1 = other1.Substring(0, other1.IndexOf("/"));
                year1 = other1.Substring(other1.IndexOf("/") + 1);
                month2 = param2.Substring(0, param2.IndexOf("/"));
                other2 = param2.Substring(param2.IndexOf("/") + 1);
                day2 = other2.Substring(0, other2.IndexOf("/"));
                year2 = other2.Substring(other2.IndexOf("/") + 1);
                if (day2.Length == 1)
                    day2 = "0" + day2;
                return day1 + "-" + day2;
            }
            else if (!param1.Equals(""))
            {
                month1 = param1.Substring(0, param1.IndexOf("/"));
                other1 = param1.Substring(param1.IndexOf("/") + 1);
                day1 = other1.Substring(0, other1.IndexOf("/"));
                year1 = other1.Substring(other1.IndexOf("/") + 1);
                DateTime date = new DateTime(int.Parse(year1), int.Parse(month1), int.Parse(day1));
                System.Globalization.CultureInfo auCulture = System.Globalization.CultureInfo.CreateSpecificCulture("en-US");
                System.Globalization.Calendar cal = auCulture.Calendar;
                date = date + TimeSpan.FromDays(6);
                if (date.Day.ToString().Length == 1)
                    return day1 + "-0" + date.Day.ToString();
                return day1 + "-" + date.Day.ToString();
            }
            else
                return "";
        }

        public string H2W41(string param1, string param2, Boolean last)
        {
            string day1, other1, month1, year1, day2, other2, month2, year2;
            if (!last && !param2.Equals(""))
            {
                month1 = param1.Substring(0, param1.IndexOf("/"));
                other1 = param1.Substring(param1.IndexOf("/") + 1);
                day1 = other1.Substring(0, other1.IndexOf("/"));
                year1 = other1.Substring(other1.IndexOf("/") + 1);
                month2 = param2.Substring(0, param2.IndexOf("/"));
                other2 = param2.Substring(param2.IndexOf("/") + 1);
                day2 = other2.Substring(0, other2.IndexOf("/"));
                year2 = other2.Substring(other2.IndexOf("/") + 1);
                if (day2.Length == 1)
                    day2 = "0" + day2;
                return day1 + "-" + day2;
            }
            else if (!param1.Equals(""))
            {
                month1 = param1.Substring(0, param1.IndexOf("/"));
                other1 = param1.Substring(param1.IndexOf("/") + 1);
                day1 = other1.Substring(0, other1.IndexOf("/"));
                year1 = other1.Substring(other1.IndexOf("/") + 1);
                DateTime date = new DateTime(int.Parse(year1), int.Parse(month1), int.Parse(day1));
                System.Globalization.CultureInfo auCulture = System.Globalization.CultureInfo.CreateSpecificCulture("en-US");
                System.Globalization.Calendar cal = auCulture.Calendar;
                date = date + TimeSpan.FromDays(6);
                if (date.Day.ToString().Length == 1)
                    return day1 + "-0" + date.Day.ToString();
                return day1 + "-" + date.Day.ToString();
            }
            else
                return "";
        }

        public string H2W42(string param1, string param2, Boolean last)
        {
            string day1, other1, month1, year1, day2, other2, month2, year2;
            if (!last && !param2.Equals(""))
            {
                month1 = param1.Substring(0, param1.IndexOf("/"));
                other1 = param1.Substring(param1.IndexOf("/") + 1);
                day1 = other1.Substring(0, other1.IndexOf("/"));
                year1 = other1.Substring(other1.IndexOf("/") + 1);
                month2 = param2.Substring(0, param2.IndexOf("/"));
                other2 = param2.Substring(param2.IndexOf("/") + 1);
                day2 = other2.Substring(0, other2.IndexOf("/"));
                year2 = other2.Substring(other2.IndexOf("/") + 1);
                if (day2.Length == 1)
                    day2 = "0" + day2;
                return day1 + "-" + day2;
            }
            else if (!param1.Equals(""))
            {
                month1 = param1.Substring(0, param1.IndexOf("/"));
                other1 = param1.Substring(param1.IndexOf("/") + 1);
                day1 = other1.Substring(0, other1.IndexOf("/"));
                year1 = other1.Substring(other1.IndexOf("/") + 1);
                DateTime date = new DateTime(int.Parse(year1), int.Parse(month1), int.Parse(day1));
                System.Globalization.CultureInfo auCulture = System.Globalization.CultureInfo.CreateSpecificCulture("en-US");
                System.Globalization.Calendar cal = auCulture.Calendar;
                date = date + TimeSpan.FromDays(6);
                if (date.Day.ToString().Length == 1)
                    return day1 + "-0" + date.Day.ToString();
                return day1 + "-" + date.Day.ToString();
            }
            else
                return "";
        }

        public string H2W43(string param1, string param2, Boolean last)
        {
            string day1, other1, month1, year1, day2, other2, month2, year2;
            if (!last && !param2.Equals(""))
            {
                month1 = param1.Substring(0, param1.IndexOf("/"));
                other1 = param1.Substring(param1.IndexOf("/") + 1);
                day1 = other1.Substring(0, other1.IndexOf("/"));
                year1 = other1.Substring(other1.IndexOf("/") + 1);
                month2 = param2.Substring(0, param2.IndexOf("/"));
                other2 = param2.Substring(param2.IndexOf("/") + 1);
                day2 = other2.Substring(0, other2.IndexOf("/"));
                year2 = other2.Substring(other2.IndexOf("/") + 1);
                if (day2.Length == 1)
                    day2 = "0" + day2;
                return day1 + "-" + day2;
            }
            else if (!param1.Equals(""))
            {
                month1 = param1.Substring(0, param1.IndexOf("/"));
                other1 = param1.Substring(param1.IndexOf("/") + 1);
                day1 = other1.Substring(0, other1.IndexOf("/"));
                year1 = other1.Substring(other1.IndexOf("/") + 1);
                DateTime date = new DateTime(int.Parse(year1), int.Parse(month1), int.Parse(day1));
                System.Globalization.CultureInfo auCulture = System.Globalization.CultureInfo.CreateSpecificCulture("en-US");
                System.Globalization.Calendar cal = auCulture.Calendar;
                date = date + TimeSpan.FromDays(6);
                if (date.Day.ToString().Length == 1)
                    return day1 + "-0" + date.Day.ToString();
                return day1 + "-" + date.Day.ToString();
            }
            else
                return "";
        }

        public string H2W45(string param1, string param2, Boolean last)
        {
            string day1, other1, month1, year1, day2, other2, month2, year2;
            if (!last && !param2.Equals(""))
            {
                month1 = param1.Substring(0, param1.IndexOf("/"));
                other1 = param1.Substring(param1.IndexOf("/") + 1);
                day1 = other1.Substring(0, other1.IndexOf("/"));
                year1 = other1.Substring(other1.IndexOf("/") + 1);
                month2 = param2.Substring(0, param2.IndexOf("/"));
                other2 = param2.Substring(param2.IndexOf("/") + 1);
                day2 = other2.Substring(0, other2.IndexOf("/"));
                year2 = other2.Substring(other2.IndexOf("/") + 1);
                if (day2.Length == 1)
                    day2 = "0" + day2;
                return day1 + "-" + day2;
            }
            else if (!param1.Equals(""))
            {
                month1 = param1.Substring(0, param1.IndexOf("/"));
                other1 = param1.Substring(param1.IndexOf("/") + 1);
                day1 = other1.Substring(0, other1.IndexOf("/"));
                year1 = other1.Substring(other1.IndexOf("/") + 1);
                DateTime date = new DateTime(int.Parse(year1), int.Parse(month1), int.Parse(day1));
                System.Globalization.CultureInfo auCulture = System.Globalization.CultureInfo.CreateSpecificCulture("en-US");
                System.Globalization.Calendar cal = auCulture.Calendar;
                date = date + TimeSpan.FromDays(6);
                if (date.Day.ToString().Length == 1)
                    return day1 + "-0" + date.Day.ToString();
                return day1 + "-" + date.Day.ToString();
            }
            else
                return "";
        }

        public string H2W44(string param1, string param2, Boolean last)
        {
            string day1, other1, month1, year1, day2, other2, month2, year2;
            if (!last && !param2.Equals(""))
            {
                month1 = param1.Substring(0, param1.IndexOf("/"));
                other1 = param1.Substring(param1.IndexOf("/") + 1);
                day1 = other1.Substring(0, other1.IndexOf("/"));
                year1 = other1.Substring(other1.IndexOf("/") + 1);
                month2 = param2.Substring(0, param2.IndexOf("/"));
                other2 = param2.Substring(param2.IndexOf("/") + 1);
                day2 = other2.Substring(0, other2.IndexOf("/"));
                year2 = other2.Substring(other2.IndexOf("/") + 1);
                if (day2.Length == 1)
                    day2 = "0" + day2;
                return day1 + "-" + day2;
            }
            else if (!param1.Equals(""))
            {
                month1 = param1.Substring(0, param1.IndexOf("/"));
                other1 = param1.Substring(param1.IndexOf("/") + 1);
                day1 = other1.Substring(0, other1.IndexOf("/"));
                year1 = other1.Substring(other1.IndexOf("/") + 1);
                DateTime date = new DateTime(int.Parse(year1), int.Parse(month1), int.Parse(day1));
                System.Globalization.CultureInfo auCulture = System.Globalization.CultureInfo.CreateSpecificCulture("en-US");
                System.Globalization.Calendar cal = auCulture.Calendar;
                date = date + TimeSpan.FromDays(6);
                if (date.Day.ToString().Length == 1)
                    return day1 + "-0" + date.Day.ToString();
                return day1 + "-" + date.Day.ToString();
            }
            else
                return "";
        }

        public string H2W46(string param1, string param2, Boolean last)
        {
            string day1, other1, month1, year1, day2, other2, month2, year2;
            if (!last && !param2.Equals(""))
            {
                month1 = param1.Substring(0, param1.IndexOf("/"));
                other1 = param1.Substring(param1.IndexOf("/") + 1);
                day1 = other1.Substring(0, other1.IndexOf("/"));
                year1 = other1.Substring(other1.IndexOf("/") + 1);
                month2 = param2.Substring(0, param2.IndexOf("/"));
                other2 = param2.Substring(param2.IndexOf("/") + 1);
                day2 = other2.Substring(0, other2.IndexOf("/"));
                year2 = other2.Substring(other2.IndexOf("/") + 1);
                if (day2.Length == 1)
                    day2 = "0" + day2;
                return day1 + "-" + day2;
            }
            else if (!param1.Equals(""))
            {
                month1 = param1.Substring(0, param1.IndexOf("/"));
                other1 = param1.Substring(param1.IndexOf("/") + 1);
                day1 = other1.Substring(0, other1.IndexOf("/"));
                year1 = other1.Substring(other1.IndexOf("/") + 1);
                DateTime date = new DateTime(int.Parse(year1), int.Parse(month1), int.Parse(day1));
                System.Globalization.CultureInfo auCulture = System.Globalization.CultureInfo.CreateSpecificCulture("en-US");
                System.Globalization.Calendar cal = auCulture.Calendar;
                date = date + TimeSpan.FromDays(6);
                if (date.Day.ToString().Length == 1)
                    return day1 + "-0" + date.Day.ToString();
                return day1 + "-" + date.Day.ToString();
            }
            else
                return "";
        }

        public string H2W47(string param1, string param2, Boolean last)
        {
            string day1, other1, month1, year1, day2, other2, month2, year2;
            if (!last && !param2.Equals(""))
            {
                month1 = param1.Substring(0, param1.IndexOf("/"));
                other1 = param1.Substring(param1.IndexOf("/") + 1);
                day1 = other1.Substring(0, other1.IndexOf("/"));
                year1 = other1.Substring(other1.IndexOf("/") + 1);
                month2 = param2.Substring(0, param2.IndexOf("/"));
                other2 = param2.Substring(param2.IndexOf("/") + 1);
                day2 = other2.Substring(0, other2.IndexOf("/"));
                year2 = other2.Substring(other2.IndexOf("/") + 1);
                if (day2.Length == 1)
                    day2 = "0" + day2;
                return day1 + "-" + day2;
            }
            else if (!param1.Equals(""))
            {
                month1 = param1.Substring(0, param1.IndexOf("/"));
                other1 = param1.Substring(param1.IndexOf("/") + 1);
                day1 = other1.Substring(0, other1.IndexOf("/"));
                year1 = other1.Substring(other1.IndexOf("/") + 1);
                DateTime date = new DateTime(int.Parse(year1), int.Parse(month1), int.Parse(day1));
                System.Globalization.CultureInfo auCulture = System.Globalization.CultureInfo.CreateSpecificCulture("en-US");
                System.Globalization.Calendar cal = auCulture.Calendar;
                date = date + TimeSpan.FromDays(6);
                if (date.Day.ToString().Length == 1)
                    return day1 + "-0" + date.Day.ToString();
                return day1 + "-" + date.Day.ToString();
            }
            else
                return "";
        }

        public string H2W48(string param1, string param2, Boolean last)
        {
            string day1, other1, month1, year1, day2, other2, month2, year2;
            if (!last && !param2.Equals(""))
            {
                month1 = param1.Substring(0, param1.IndexOf("/"));
                other1 = param1.Substring(param1.IndexOf("/") + 1);
                day1 = other1.Substring(0, other1.IndexOf("/"));
                year1 = other1.Substring(other1.IndexOf("/") + 1);
                month2 = param2.Substring(0, param2.IndexOf("/"));
                other2 = param2.Substring(param2.IndexOf("/") + 1);
                day2 = other2.Substring(0, other2.IndexOf("/"));
                year2 = other2.Substring(other2.IndexOf("/") + 1);
                if (day2.Length == 1)
                    day2 = "0" + day2;
                return day1 + "-" + day2;
            }
            else if (!param1.Equals(""))
            {
                month1 = param1.Substring(0, param1.IndexOf("/"));
                other1 = param1.Substring(param1.IndexOf("/") + 1);
                day1 = other1.Substring(0, other1.IndexOf("/"));
                year1 = other1.Substring(other1.IndexOf("/") + 1);
                DateTime date = new DateTime(int.Parse(year1), int.Parse(month1), int.Parse(day1));
                System.Globalization.CultureInfo auCulture = System.Globalization.CultureInfo.CreateSpecificCulture("en-US");
                System.Globalization.Calendar cal = auCulture.Calendar;
                date = date + TimeSpan.FromDays(6);
                if (date.Day.ToString().Length == 1)
                    return day1 + "-0" + date.Day.ToString();
                return day1 + "-" + date.Day.ToString();
            }
            else
                return "";
        }

        public string H2W49(string param1, string param2, Boolean last)
        {
            string day1, other1, month1, year1, day2, other2, month2, year2;
            if (!last && !param2.Equals(""))
            {
                month1 = param1.Substring(0, param1.IndexOf("/"));
                other1 = param1.Substring(param1.IndexOf("/") + 1);
                day1 = other1.Substring(0, other1.IndexOf("/"));
                year1 = other1.Substring(other1.IndexOf("/") + 1);
                month2 = param2.Substring(0, param2.IndexOf("/"));
                other2 = param2.Substring(param2.IndexOf("/") + 1);
                day2 = other2.Substring(0, other2.IndexOf("/"));
                year2 = other2.Substring(other2.IndexOf("/") + 1);
                if (day2.Length == 1)
                    day2 = "0" + day2;
                return day1 + "-" + day2;
            }
            else if (!param1.Equals(""))
            {
                month1 = param1.Substring(0, param1.IndexOf("/"));
                other1 = param1.Substring(param1.IndexOf("/") + 1);
                day1 = other1.Substring(0, other1.IndexOf("/"));
                year1 = other1.Substring(other1.IndexOf("/") + 1);
                DateTime date = new DateTime(int.Parse(year1), int.Parse(month1), int.Parse(day1));
                System.Globalization.CultureInfo auCulture = System.Globalization.CultureInfo.CreateSpecificCulture("en-US");
                System.Globalization.Calendar cal = auCulture.Calendar;
                date = date + TimeSpan.FromDays(6);
                if (date.Day.ToString().Length == 1)
                    return day1 + "-0" + date.Day.ToString();
                return day1 + "-" + date.Day.ToString();
            }
            else
                return "";
        }

        public string H2W50(string param1, string param2, Boolean last)
        {
            string day1, other1, month1, year1, day2, other2, month2, year2;
            if (!last && !param2.Equals(""))
            {
                month1 = param1.Substring(0, param1.IndexOf("/"));
                other1 = param1.Substring(param1.IndexOf("/") + 1);
                day1 = other1.Substring(0, other1.IndexOf("/"));
                year1 = other1.Substring(other1.IndexOf("/") + 1);
                month2 = param2.Substring(0, param2.IndexOf("/"));
                other2 = param2.Substring(param2.IndexOf("/") + 1);
                day2 = other2.Substring(0, other2.IndexOf("/"));
                year2 = other2.Substring(other2.IndexOf("/") + 1);
                if (day2.Length == 1)
                    day2 = "0" + day2;
                return day1 + "-" + day2;
            }
            else if (!param1.Equals(""))
            {
                month1 = param1.Substring(0, param1.IndexOf("/"));
                other1 = param1.Substring(param1.IndexOf("/") + 1);
                day1 = other1.Substring(0, other1.IndexOf("/"));
                year1 = other1.Substring(other1.IndexOf("/") + 1);
                DateTime date = new DateTime(int.Parse(year1), int.Parse(month1), int.Parse(day1));
                System.Globalization.CultureInfo auCulture = System.Globalization.CultureInfo.CreateSpecificCulture("en-US");
                System.Globalization.Calendar cal = auCulture.Calendar;
                date = date + TimeSpan.FromDays(6);
                if (date.Day.ToString().Length == 1)
                    return day1 + "-0" + date.Day.ToString();
                return day1 + "-" + date.Day.ToString();
            }
            else
                return "";
        }

        public string H2W51(string param1, string param2, Boolean last)
        {
            string day1, other1, month1, year1, day2, other2, month2, year2;
            if (!last && !param2.Equals(""))
            {
                month1 = param1.Substring(0, param1.IndexOf("/"));
                other1 = param1.Substring(param1.IndexOf("/") + 1);
                day1 = other1.Substring(0, other1.IndexOf("/"));
                year1 = other1.Substring(other1.IndexOf("/") + 1);
                month2 = param2.Substring(0, param2.IndexOf("/"));
                other2 = param2.Substring(param2.IndexOf("/") + 1);
                day2 = other2.Substring(0, other2.IndexOf("/"));
                year2 = other2.Substring(other2.IndexOf("/") + 1);
                if (day2.Length == 1)
                    day2 = "0" + day2;
                return day1 + "-" + day2;
            }
            else if (!param1.Equals(""))
            {
                month1 = param1.Substring(0, param1.IndexOf("/"));
                other1 = param1.Substring(param1.IndexOf("/") + 1);
                day1 = other1.Substring(0, other1.IndexOf("/"));
                year1 = other1.Substring(other1.IndexOf("/") + 1);
                DateTime date = new DateTime(int.Parse(year1), int.Parse(month1), int.Parse(day1));
                System.Globalization.CultureInfo auCulture = System.Globalization.CultureInfo.CreateSpecificCulture("en-US");
                System.Globalization.Calendar cal = auCulture.Calendar;
                date = date + TimeSpan.FromDays(6);
                if (date.Day.ToString().Length == 1)
                    return day1 + "-0" + date.Day.ToString();
                return day1 + "-" + date.Day.ToString();
            }
            else
                return "";
        }

        public string H2W52(string param1, Boolean last)
        {
            string day1, other1, month1, year1;
            if (!param1.Equals(""))
            {
                month1 = param1.Substring(0, param1.IndexOf("/"));
                other1 = param1.Substring(param1.IndexOf("/") + 1);
                day1 = other1.Substring(0, other1.IndexOf("/"));
                year1 = other1.Substring(other1.IndexOf("/") + 1);
                DateTime date = new DateTime(int.Parse(year1), int.Parse(month1), int.Parse(day1));
                System.Globalization.CultureInfo auCulture = System.Globalization.CultureInfo.CreateSpecificCulture("en-US");
                System.Globalization.Calendar cal = auCulture.Calendar;
                date = date + TimeSpan.FromDays(6);
                if (date.Day.ToString().Length == 1)
                    return day1 + "-0" + date.Day.ToString();
                return day1 + "-" + date.Day.ToString();
            }
            else
                return "";

        }

        public string aDayEarlier51(string param, Boolean empty)
        {
            string daystr, other, monthstr, yearstr;
            if (!empty)
            {
                int day, month, year;
                monthstr = param.Substring(0, param.IndexOf("/"));
                other = param.Substring(param.IndexOf("/") + 1);
                daystr = other.Substring(0, other.IndexOf("/"));
                yearstr = other.Substring(other.IndexOf("/") + 1);
                day = int.Parse(daystr);
                month = int.Parse(monthstr);
                year = int.Parse(yearstr);


                day = day - 1;
                if (day == 0)
                {
                    month = month - 1;
                    switch (month)
                    {
                        case 1:
                            day = 31;
                            break;
                        case 2:
                            day = 29;
                            break;
                        case 3:
                            day = 31;
                            break;
                        case 4:
                            day = 30;
                            break;
                        case 5:
                            day = 31;
                            break;
                        case 6:
                            day = 30;
                            break;
                        case 7:
                            day = 31;
                            break;
                        case 8:
                            day = 31;
                            break;
                        case 9:
                            day = 30;
                            break;
                        case 10:
                            day = 31;
                            break;
                        case 11:
                            day = 30;
                            break;
                        default:
                            day = 31;
                            break;
                    }
                }
                if (month == 0)
                {
                    month = 12;
                    year = year - 1;
                }

                return month.ToString() + "/" + day.ToString() + "/" + year.ToString();
            }
            else
                return "";
        }

        public string aDayEarlier50(string param, Boolean empty)
        {
            string daystr, other, monthstr, yearstr;
            if (!empty)
            {
                int day, month, year;
                monthstr = param.Substring(0, param.IndexOf("/"));
                other = param.Substring(param.IndexOf("/") + 1);
                daystr = other.Substring(0, other.IndexOf("/"));
                yearstr = other.Substring(other.IndexOf("/") + 1);
                day = int.Parse(daystr);
                month = int.Parse(monthstr);
                year = int.Parse(yearstr);


                day = day - 1;
                if (day == 0)
                {
                    month = month - 1;
                    switch (month)
                    {
                        case 1:
                            day = 31;
                            break;
                        case 2:
                            day = 29;
                            break;
                        case 3:
                            day = 31;
                            break;
                        case 4:
                            day = 30;
                            break;
                        case 5:
                            day = 31;
                            break;
                        case 6:
                            day = 30;
                            break;
                        case 7:
                            day = 31;
                            break;
                        case 8:
                            day = 31;
                            break;
                        case 9:
                            day = 30;
                            break;
                        case 10:
                            day = 31;
                            break;
                        case 11:
                            day = 30;
                            break;
                        default:
                            day = 31;
                            break;
                    }
                }
                if (month == 0)
                {
                    month = 12;
                    year = year - 1;
                }

                return month.ToString() + "/" + day.ToString() + "/" + year.ToString();
            }
            else
                return "";
        }

        public string aDayEarlier49(string param, Boolean empty)
        {
            string daystr, other, monthstr, yearstr;
            if (!empty)
            {
                int day, month, year;
                monthstr = param.Substring(0, param.IndexOf("/"));
                other = param.Substring(param.IndexOf("/") + 1);
                daystr = other.Substring(0, other.IndexOf("/"));
                yearstr = other.Substring(other.IndexOf("/") + 1);
                day = int.Parse(daystr);
                month = int.Parse(monthstr);
                year = int.Parse(yearstr);


                day = day - 1;
                if (day == 0)
                {
                    month = month - 1;
                    switch (month)
                    {
                        case 1:
                            day = 31;
                            break;
                        case 2:
                            day = 29;
                            break;
                        case 3:
                            day = 31;
                            break;
                        case 4:
                            day = 30;
                            break;
                        case 5:
                            day = 31;
                            break;
                        case 6:
                            day = 30;
                            break;
                        case 7:
                            day = 31;
                            break;
                        case 8:
                            day = 31;
                            break;
                        case 9:
                            day = 30;
                            break;
                        case 10:
                            day = 31;
                            break;
                        case 11:
                            day = 30;
                            break;
                        default:
                            day = 31;
                            break;
                    }
                }
                if (month == 0)
                {
                    month = 12;
                    year = year - 1;
                }

                return month.ToString() + "/" + day.ToString() + "/" + year.ToString();
            }
            else
                return "";
        }

        public string aDayEarlier48(string param, Boolean empty)
        {
            string daystr, other, monthstr, yearstr;
            if (!empty)
            {
                int day, month, year;
                monthstr = param.Substring(0, param.IndexOf("/"));
                other = param.Substring(param.IndexOf("/") + 1);
                daystr = other.Substring(0, other.IndexOf("/"));
                yearstr = other.Substring(other.IndexOf("/") + 1);
                day = int.Parse(daystr);
                month = int.Parse(monthstr);
                year = int.Parse(yearstr);


                day = day - 1;
                if (day == 0)
                {
                    month = month - 1;
                    switch (month)
                    {
                        case 1:
                            day = 31;
                            break;
                        case 2:
                            day = 29;
                            break;
                        case 3:
                            day = 31;
                            break;
                        case 4:
                            day = 30;
                            break;
                        case 5:
                            day = 31;
                            break;
                        case 6:
                            day = 30;
                            break;
                        case 7:
                            day = 31;
                            break;
                        case 8:
                            day = 31;
                            break;
                        case 9:
                            day = 30;
                            break;
                        case 10:
                            day = 31;
                            break;
                        case 11:
                            day = 30;
                            break;
                        default:
                            day = 31;
                            break;
                    }
                }
                if (month == 0)
                {
                    month = 12;
                    year = year - 1;
                }

                return month.ToString() + "/" + day.ToString() + "/" + year.ToString();
            }
            else
                return "";
        }

        public string aDayEarlier47(string param, Boolean empty)
        {
            string daystr, other, monthstr, yearstr;
            if (!empty)
            {
                int day, month, year;
                monthstr = param.Substring(0, param.IndexOf("/"));
                other = param.Substring(param.IndexOf("/") + 1);
                daystr = other.Substring(0, other.IndexOf("/"));
                yearstr = other.Substring(other.IndexOf("/") + 1);
                day = int.Parse(daystr);
                month = int.Parse(monthstr);
                year = int.Parse(yearstr);


                day = day - 1;
                if (day == 0)
                {
                    month = month - 1;
                    switch (month)
                    {
                        case 1:
                            day = 31;
                            break;
                        case 2:
                            day = 29;
                            break;
                        case 3:
                            day = 31;
                            break;
                        case 4:
                            day = 30;
                            break;
                        case 5:
                            day = 31;
                            break;
                        case 6:
                            day = 30;
                            break;
                        case 7:
                            day = 31;
                            break;
                        case 8:
                            day = 31;
                            break;
                        case 9:
                            day = 30;
                            break;
                        case 10:
                            day = 31;
                            break;
                        case 11:
                            day = 30;
                            break;
                        default:
                            day = 31;
                            break;
                    }
                }
                if (month == 0)
                {
                    month = 12;
                    year = year - 1;
                }

                return month.ToString() + "/" + day.ToString() + "/" + year.ToString();
            }
            else
                return "";
        }

        public string aDayEarlier46(string param, Boolean empty)
        {
            string daystr, other, monthstr, yearstr;
            if (!empty)
            {
                int day, month, year;
                monthstr = param.Substring(0, param.IndexOf("/"));
                other = param.Substring(param.IndexOf("/") + 1);
                daystr = other.Substring(0, other.IndexOf("/"));
                yearstr = other.Substring(other.IndexOf("/") + 1);
                day = int.Parse(daystr);
                month = int.Parse(monthstr);
                year = int.Parse(yearstr);


                day = day - 1;
                if (day == 0)
                {
                    month = month - 1;
                    switch (month)
                    {
                        case 1:
                            day = 31;
                            break;
                        case 2:
                            day = 29;
                            break;
                        case 3:
                            day = 31;
                            break;
                        case 4:
                            day = 30;
                            break;
                        case 5:
                            day = 31;
                            break;
                        case 6:
                            day = 30;
                            break;
                        case 7:
                            day = 31;
                            break;
                        case 8:
                            day = 31;
                            break;
                        case 9:
                            day = 30;
                            break;
                        case 10:
                            day = 31;
                            break;
                        case 11:
                            day = 30;
                            break;
                        default:
                            day = 31;
                            break;
                    }
                }
                if (month == 0)
                {
                    month = 12;
                    year = year - 1;
                }

                return month.ToString() + "/" + day.ToString() + "/" + year.ToString();
            }
            else
                return "";
        }

        public string aDayEarlier45(string param, Boolean empty)
        {
            string daystr, other, monthstr, yearstr;
            if (!empty)
            {
                int day, month, year;
                monthstr = param.Substring(0, param.IndexOf("/"));
                other = param.Substring(param.IndexOf("/") + 1);
                daystr = other.Substring(0, other.IndexOf("/"));
                yearstr = other.Substring(other.IndexOf("/") + 1);
                day = int.Parse(daystr);
                month = int.Parse(monthstr);
                year = int.Parse(yearstr);


                day = day - 1;
                if (day == 0)
                {
                    month = month - 1;
                    switch (month)
                    {
                        case 1:
                            day = 31;
                            break;
                        case 2:
                            day = 29;
                            break;
                        case 3:
                            day = 31;
                            break;
                        case 4:
                            day = 30;
                            break;
                        case 5:
                            day = 31;
                            break;
                        case 6:
                            day = 30;
                            break;
                        case 7:
                            day = 31;
                            break;
                        case 8:
                            day = 31;
                            break;
                        case 9:
                            day = 30;
                            break;
                        case 10:
                            day = 31;
                            break;
                        case 11:
                            day = 30;
                            break;
                        default:
                            day = 31;
                            break;
                    }
                }
                if (month == 0)
                {
                    month = 12;
                    year = year - 1;
                }

                return month.ToString() + "/" + day.ToString() + "/" + year.ToString();
            }
            else
                return "";
        }

        public string aDayEarlier44(string param, Boolean empty)
        {
            string daystr, other, monthstr, yearstr;
            if (!empty)
            {
                int day, month, year;
                monthstr = param.Substring(0, param.IndexOf("/"));
                other = param.Substring(param.IndexOf("/") + 1);
                daystr = other.Substring(0, other.IndexOf("/"));
                yearstr = other.Substring(other.IndexOf("/") + 1);
                day = int.Parse(daystr);
                month = int.Parse(monthstr);
                year = int.Parse(yearstr);


                day = day - 1;
                if (day == 0)
                {
                    month = month - 1;
                    switch (month)
                    {
                        case 1:
                            day = 31;
                            break;
                        case 2:
                            day = 29;
                            break;
                        case 3:
                            day = 31;
                            break;
                        case 4:
                            day = 30;
                            break;
                        case 5:
                            day = 31;
                            break;
                        case 6:
                            day = 30;
                            break;
                        case 7:
                            day = 31;
                            break;
                        case 8:
                            day = 31;
                            break;
                        case 9:
                            day = 30;
                            break;
                        case 10:
                            day = 31;
                            break;
                        case 11:
                            day = 30;
                            break;
                        default:
                            day = 31;
                            break;
                    }
                }
                if (month == 0)
                {
                    month = 12;
                    year = year - 1;
                }

                return month.ToString() + "/" + day.ToString() + "/" + year.ToString();
            }
            else
                return "";
        }

        public string aDayEarlier43(string param, Boolean empty)
        {
            string daystr, other, monthstr, yearstr;
            if (!empty)
            {
                int day, month, year;
                monthstr = param.Substring(0, param.IndexOf("/"));
                other = param.Substring(param.IndexOf("/") + 1);
                daystr = other.Substring(0, other.IndexOf("/"));
                yearstr = other.Substring(other.IndexOf("/") + 1);
                day = int.Parse(daystr);
                month = int.Parse(monthstr);
                year = int.Parse(yearstr);


                day = day - 1;
                if (day == 0)
                {
                    month = month - 1;
                    switch (month)
                    {
                        case 1:
                            day = 31;
                            break;
                        case 2:
                            day = 29;
                            break;
                        case 3:
                            day = 31;
                            break;
                        case 4:
                            day = 30;
                            break;
                        case 5:
                            day = 31;
                            break;
                        case 6:
                            day = 30;
                            break;
                        case 7:
                            day = 31;
                            break;
                        case 8:
                            day = 31;
                            break;
                        case 9:
                            day = 30;
                            break;
                        case 10:
                            day = 31;
                            break;
                        case 11:
                            day = 30;
                            break;
                        default:
                            day = 31;
                            break;
                    }
                }
                if (month == 0)
                {
                    month = 12;
                    year = year - 1;
                }

                return month.ToString() + "/" + day.ToString() + "/" + year.ToString();
            }
            else
                return "";
        }

        public string aDayEarlier42(string param, Boolean empty)
        {
            string daystr, other, monthstr, yearstr;
            if (!empty)
            {
                int day, month, year;
                monthstr = param.Substring(0, param.IndexOf("/"));
                other = param.Substring(param.IndexOf("/") + 1);
                daystr = other.Substring(0, other.IndexOf("/"));
                yearstr = other.Substring(other.IndexOf("/") + 1);
                day = int.Parse(daystr);
                month = int.Parse(monthstr);
                year = int.Parse(yearstr);


                day = day - 1;
                if (day == 0)
                {
                    month = month - 1;
                    switch (month)
                    {
                        case 1:
                            day = 31;
                            break;
                        case 2:
                            day = 29;
                            break;
                        case 3:
                            day = 31;
                            break;
                        case 4:
                            day = 30;
                            break;
                        case 5:
                            day = 31;
                            break;
                        case 6:
                            day = 30;
                            break;
                        case 7:
                            day = 31;
                            break;
                        case 8:
                            day = 31;
                            break;
                        case 9:
                            day = 30;
                            break;
                        case 10:
                            day = 31;
                            break;
                        case 11:
                            day = 30;
                            break;
                        default:
                            day = 31;
                            break;
                    }
                }
                if (month == 0)
                {
                    month = 12;
                    year = year - 1;
                }

                return month.ToString() + "/" + day.ToString() + "/" + year.ToString();
            }
            else
                return "";
        }

        public string aDayEarlier41(string param, Boolean empty)
        {
            string daystr, other, monthstr, yearstr;
            if (!empty)
            {
                int day, month, year;
                monthstr = param.Substring(0, param.IndexOf("/"));
                other = param.Substring(param.IndexOf("/") + 1);
                daystr = other.Substring(0, other.IndexOf("/"));
                yearstr = other.Substring(other.IndexOf("/") + 1);
                day = int.Parse(daystr);
                month = int.Parse(monthstr);
                year = int.Parse(yearstr);


                day = day - 1;
                if (day == 0)
                {
                    month = month - 1;
                    switch (month)
                    {
                        case 1:
                            day = 31;
                            break;
                        case 2:
                            day = 29;
                            break;
                        case 3:
                            day = 31;
                            break;
                        case 4:
                            day = 30;
                            break;
                        case 5:
                            day = 31;
                            break;
                        case 6:
                            day = 30;
                            break;
                        case 7:
                            day = 31;
                            break;
                        case 8:
                            day = 31;
                            break;
                        case 9:
                            day = 30;
                            break;
                        case 10:
                            day = 31;
                            break;
                        case 11:
                            day = 30;
                            break;
                        default:
                            day = 31;
                            break;
                    }
                }
                if (month == 0)
                {
                    month = 12;
                    year = year - 1;
                }

                return month.ToString() + "/" + day.ToString() + "/" + year.ToString();
            }
            else
                return "";
        }

        public string aDayEarlier40(string param, Boolean empty)
        {
            string daystr, other, monthstr, yearstr;
            if (!empty)
            {
                int day, month, year;
                monthstr = param.Substring(0, param.IndexOf("/"));
                other = param.Substring(param.IndexOf("/") + 1);
                daystr = other.Substring(0, other.IndexOf("/"));
                yearstr = other.Substring(other.IndexOf("/") + 1);
                day = int.Parse(daystr);
                month = int.Parse(monthstr);
                year = int.Parse(yearstr);


                day = day - 1;
                if (day == 0)
                {
                    month = month - 1;
                    switch (month)
                    {
                        case 1:
                            day = 31;
                            break;
                        case 2:
                            day = 29;
                            break;
                        case 3:
                            day = 31;
                            break;
                        case 4:
                            day = 30;
                            break;
                        case 5:
                            day = 31;
                            break;
                        case 6:
                            day = 30;
                            break;
                        case 7:
                            day = 31;
                            break;
                        case 8:
                            day = 31;
                            break;
                        case 9:
                            day = 30;
                            break;
                        case 10:
                            day = 31;
                            break;
                        case 11:
                            day = 30;
                            break;
                        default:
                            day = 31;
                            break;
                    }
                }
                if (month == 0)
                {
                    month = 12;
                    year = year - 1;
                }

                return month.ToString() + "/" + day.ToString() + "/" + year.ToString();
            }
            else
                return "";
        }

        public string aDayEarlier39(string param, Boolean empty)
        {
            string daystr, other, monthstr, yearstr;
            if (!empty)
            {
                int day, month, year;
                monthstr = param.Substring(0, param.IndexOf("/"));
                other = param.Substring(param.IndexOf("/") + 1);
                daystr = other.Substring(0, other.IndexOf("/"));
                yearstr = other.Substring(other.IndexOf("/") + 1);
                day = int.Parse(daystr);
                month = int.Parse(monthstr);
                year = int.Parse(yearstr);


                day = day - 1;
                if (day == 0)
                {
                    month = month - 1;
                    switch (month)
                    {
                        case 1:
                            day = 31;
                            break;
                        case 2:
                            day = 29;
                            break;
                        case 3:
                            day = 31;
                            break;
                        case 4:
                            day = 30;
                            break;
                        case 5:
                            day = 31;
                            break;
                        case 6:
                            day = 30;
                            break;
                        case 7:
                            day = 31;
                            break;
                        case 8:
                            day = 31;
                            break;
                        case 9:
                            day = 30;
                            break;
                        case 10:
                            day = 31;
                            break;
                        case 11:
                            day = 30;
                            break;
                        default:
                            day = 31;
                            break;
                    }
                }
                if (month == 0)
                {
                    month = 12;
                    year = year - 1;
                }

                return month.ToString() + "/" + day.ToString() + "/" + year.ToString();
            }
            else
                return "";
        }

        public string aDayEarlier38(string param, Boolean empty)
        {
            string daystr, other, monthstr, yearstr;
            if (!empty)
            {
                int day, month, year;
                monthstr = param.Substring(0, param.IndexOf("/"));
                other = param.Substring(param.IndexOf("/") + 1);
                daystr = other.Substring(0, other.IndexOf("/"));
                yearstr = other.Substring(other.IndexOf("/") + 1);
                day = int.Parse(daystr);
                month = int.Parse(monthstr);
                year = int.Parse(yearstr);


                day = day - 1;
                if (day == 0)
                {
                    month = month - 1;
                    switch (month)
                    {
                        case 1:
                            day = 31;
                            break;
                        case 2:
                            day = 29;
                            break;
                        case 3:
                            day = 31;
                            break;
                        case 4:
                            day = 30;
                            break;
                        case 5:
                            day = 31;
                            break;
                        case 6:
                            day = 30;
                            break;
                        case 7:
                            day = 31;
                            break;
                        case 8:
                            day = 31;
                            break;
                        case 9:
                            day = 30;
                            break;
                        case 10:
                            day = 31;
                            break;
                        case 11:
                            day = 30;
                            break;
                        default:
                            day = 31;
                            break;
                    }
                }
                if (month == 0)
                {
                    month = 12;
                    year = year - 1;
                }

                return month.ToString() + "/" + day.ToString() + "/" + year.ToString();
            }
            else
                return "";
        }

        public string aDayEarlier37(string param, Boolean empty)
        {
            string daystr, other, monthstr, yearstr;
            if (!empty)
            {
                int day, month, year;
                monthstr = param.Substring(0, param.IndexOf("/"));
                other = param.Substring(param.IndexOf("/") + 1);
                daystr = other.Substring(0, other.IndexOf("/"));
                yearstr = other.Substring(other.IndexOf("/") + 1);
                day = int.Parse(daystr);
                month = int.Parse(monthstr);
                year = int.Parse(yearstr);


                day = day - 1;
                if (day == 0)
                {
                    month = month - 1;
                    switch (month)
                    {
                        case 1:
                            day = 31;
                            break;
                        case 2:
                            day = 29;
                            break;
                        case 3:
                            day = 31;
                            break;
                        case 4:
                            day = 30;
                            break;
                        case 5:
                            day = 31;
                            break;
                        case 6:
                            day = 30;
                            break;
                        case 7:
                            day = 31;
                            break;
                        case 8:
                            day = 31;
                            break;
                        case 9:
                            day = 30;
                            break;
                        case 10:
                            day = 31;
                            break;
                        case 11:
                            day = 30;
                            break;
                        default:
                            day = 31;
                            break;
                    }
                }
                if (month == 0)
                {
                    month = 12;
                    year = year - 1;
                }

                return month.ToString() + "/" + day.ToString() + "/" + year.ToString();
            }
            else
                return "";
        }

        public string aDayEarlier36(string param, Boolean empty)
        {
            string daystr, other, monthstr, yearstr;
            if (!empty)
            {
                int day, month, year;
                monthstr = param.Substring(0, param.IndexOf("/"));
                other = param.Substring(param.IndexOf("/") + 1);
                daystr = other.Substring(0, other.IndexOf("/"));
                yearstr = other.Substring(other.IndexOf("/") + 1);
                day = int.Parse(daystr);
                month = int.Parse(monthstr);
                year = int.Parse(yearstr);


                day = day - 1;
                if (day == 0)
                {
                    month = month - 1;
                    switch (month)
                    {
                        case 1:
                            day = 31;
                            break;
                        case 2:
                            day = 29;
                            break;
                        case 3:
                            day = 31;
                            break;
                        case 4:
                            day = 30;
                            break;
                        case 5:
                            day = 31;
                            break;
                        case 6:
                            day = 30;
                            break;
                        case 7:
                            day = 31;
                            break;
                        case 8:
                            day = 31;
                            break;
                        case 9:
                            day = 30;
                            break;
                        case 10:
                            day = 31;
                            break;
                        case 11:
                            day = 30;
                            break;
                        default:
                            day = 31;
                            break;
                    }
                }
                if (month == 0)
                {
                    month = 12;
                    year = year - 1;
                }

                return month.ToString() + "/" + day.ToString() + "/" + year.ToString();
            }
            else
                return "";
        }

        public string aDayEarlier35(string param, Boolean empty)
        {
            string daystr, other, monthstr, yearstr;
            if (!empty)
            {
                int day, month, year;
                monthstr = param.Substring(0, param.IndexOf("/"));
                other = param.Substring(param.IndexOf("/") + 1);
                daystr = other.Substring(0, other.IndexOf("/"));
                yearstr = other.Substring(other.IndexOf("/") + 1);
                day = int.Parse(daystr);
                month = int.Parse(monthstr);
                year = int.Parse(yearstr);


                day = day - 1;
                if (day == 0)
                {
                    month = month - 1;
                    switch (month)
                    {
                        case 1:
                            day = 31;
                            break;
                        case 2:
                            day = 29;
                            break;
                        case 3:
                            day = 31;
                            break;
                        case 4:
                            day = 30;
                            break;
                        case 5:
                            day = 31;
                            break;
                        case 6:
                            day = 30;
                            break;
                        case 7:
                            day = 31;
                            break;
                        case 8:
                            day = 31;
                            break;
                        case 9:
                            day = 30;
                            break;
                        case 10:
                            day = 31;
                            break;
                        case 11:
                            day = 30;
                            break;
                        default:
                            day = 31;
                            break;
                    }
                }
                if (month == 0)
                {
                    month = 12;
                    year = year - 1;
                }

                return month.ToString() + "/" + day.ToString() + "/" + year.ToString();
            }
            else
                return "";
        }

        public string aDayEarlier34(string param, Boolean empty)
        {
            string daystr, other, monthstr, yearstr;
            if (!empty)
            {
                int day, month, year;
                monthstr = param.Substring(0, param.IndexOf("/"));
                other = param.Substring(param.IndexOf("/") + 1);
                daystr = other.Substring(0, other.IndexOf("/"));
                yearstr = other.Substring(other.IndexOf("/") + 1);
                day = int.Parse(daystr);
                month = int.Parse(monthstr);
                year = int.Parse(yearstr);


                day = day - 1;
                if (day == 0)
                {
                    month = month - 1;
                    switch (month)
                    {
                        case 1:
                            day = 31;
                            break;
                        case 2:
                            day = 29;
                            break;
                        case 3:
                            day = 31;
                            break;
                        case 4:
                            day = 30;
                            break;
                        case 5:
                            day = 31;
                            break;
                        case 6:
                            day = 30;
                            break;
                        case 7:
                            day = 31;
                            break;
                        case 8:
                            day = 31;
                            break;
                        case 9:
                            day = 30;
                            break;
                        case 10:
                            day = 31;
                            break;
                        case 11:
                            day = 30;
                            break;
                        default:
                            day = 31;
                            break;
                    }
                }
                if (month == 0)
                {
                    month = 12;
                    year = year - 1;
                }

                return month.ToString() + "/" + day.ToString() + "/" + year.ToString();
            }
            else
                return "";
        }

        public string aDayEarlier33(string param, Boolean empty)
        {
            string daystr, other, monthstr, yearstr;
            if (!empty)
            {
                int day, month, year;
                monthstr = param.Substring(0, param.IndexOf("/"));
                other = param.Substring(param.IndexOf("/") + 1);
                daystr = other.Substring(0, other.IndexOf("/"));
                yearstr = other.Substring(other.IndexOf("/") + 1);
                day = int.Parse(daystr);
                month = int.Parse(monthstr);
                year = int.Parse(yearstr);


                day = day - 1;
                if (day == 0)
                {
                    month = month - 1;
                    switch (month)
                    {
                        case 1:
                            day = 31;
                            break;
                        case 2:
                            day = 29;
                            break;
                        case 3:
                            day = 31;
                            break;
                        case 4:
                            day = 30;
                            break;
                        case 5:
                            day = 31;
                            break;
                        case 6:
                            day = 30;
                            break;
                        case 7:
                            day = 31;
                            break;
                        case 8:
                            day = 31;
                            break;
                        case 9:
                            day = 30;
                            break;
                        case 10:
                            day = 31;
                            break;
                        case 11:
                            day = 30;
                            break;
                        default:
                            day = 31;
                            break;
                    }
                }
                if (month == 0)
                {
                    month = 12;
                    year = year - 1;
                }

                return month.ToString() + "/" + day.ToString() + "/" + year.ToString();
            }
            else
                return "";
        }

        public string aDayEarlier32(string param, Boolean empty)
        {
            string daystr, other, monthstr, yearstr;
            if (!empty)
            {
                int day, month, year;
                monthstr = param.Substring(0, param.IndexOf("/"));
                other = param.Substring(param.IndexOf("/") + 1);
                daystr = other.Substring(0, other.IndexOf("/"));
                yearstr = other.Substring(other.IndexOf("/") + 1);
                day = int.Parse(daystr);
                month = int.Parse(monthstr);
                year = int.Parse(yearstr);


                day = day - 1;
                if (day == 0)
                {
                    month = month - 1;
                    switch (month)
                    {
                        case 1:
                            day = 31;
                            break;
                        case 2:
                            day = 29;
                            break;
                        case 3:
                            day = 31;
                            break;
                        case 4:
                            day = 30;
                            break;
                        case 5:
                            day = 31;
                            break;
                        case 6:
                            day = 30;
                            break;
                        case 7:
                            day = 31;
                            break;
                        case 8:
                            day = 31;
                            break;
                        case 9:
                            day = 30;
                            break;
                        case 10:
                            day = 31;
                            break;
                        case 11:
                            day = 30;
                            break;
                        default:
                            day = 31;
                            break;
                    }
                }
                if (month == 0)
                {
                    month = 12;
                    year = year - 1;
                }

                return month.ToString() + "/" + day.ToString() + "/" + year.ToString();
            }
            else
                return "";
        }

        public string aDayEarlier31(string param, Boolean empty)
        {
            string daystr, other, monthstr, yearstr;
            if (!empty)
            {
                int day, month, year;
                monthstr = param.Substring(0, param.IndexOf("/"));
                other = param.Substring(param.IndexOf("/") + 1);
                daystr = other.Substring(0, other.IndexOf("/"));
                yearstr = other.Substring(other.IndexOf("/") + 1);
                day = int.Parse(daystr);
                month = int.Parse(monthstr);
                year = int.Parse(yearstr);


                day = day - 1;
                if (day == 0)
                {
                    month = month - 1;
                    switch (month)
                    {
                        case 1:
                            day = 31;
                            break;
                        case 2:
                            day = 29;
                            break;
                        case 3:
                            day = 31;
                            break;
                        case 4:
                            day = 30;
                            break;
                        case 5:
                            day = 31;
                            break;
                        case 6:
                            day = 30;
                            break;
                        case 7:
                            day = 31;
                            break;
                        case 8:
                            day = 31;
                            break;
                        case 9:
                            day = 30;
                            break;
                        case 10:
                            day = 31;
                            break;
                        case 11:
                            day = 30;
                            break;
                        default:
                            day = 31;
                            break;
                    }
                }
                if (month == 0)
                {
                    month = 12;
                    year = year - 1;
                }

                return month.ToString() + "/" + day.ToString() + "/" + year.ToString();
            }
            else
                return "";
        }

        public string aDayEarlier30(string param, Boolean empty)
        {
            string daystr, other, monthstr, yearstr;
            if (!empty)
            {
                int day, month, year;
                monthstr = param.Substring(0, param.IndexOf("/"));
                other = param.Substring(param.IndexOf("/") + 1);
                daystr = other.Substring(0, other.IndexOf("/"));
                yearstr = other.Substring(other.IndexOf("/") + 1);
                day = int.Parse(daystr);
                month = int.Parse(monthstr);
                year = int.Parse(yearstr);


                day = day - 1;
                if (day == 0)
                {
                    month = month - 1;
                    switch (month)
                    {
                        case 1:
                            day = 31;
                            break;
                        case 2:
                            day = 29;
                            break;
                        case 3:
                            day = 31;
                            break;
                        case 4:
                            day = 30;
                            break;
                        case 5:
                            day = 31;
                            break;
                        case 6:
                            day = 30;
                            break;
                        case 7:
                            day = 31;
                            break;
                        case 8:
                            day = 31;
                            break;
                        case 9:
                            day = 30;
                            break;
                        case 10:
                            day = 31;
                            break;
                        case 11:
                            day = 30;
                            break;
                        default:
                            day = 31;
                            break;
                    }
                }
                if (month == 0)
                {
                    month = 12;
                    year = year - 1;
                }

                return month.ToString() + "/" + day.ToString() + "/" + year.ToString();
            }
            else
                return "";
        }

        public string aDayEarlier29(string param, Boolean empty)
        {
            string daystr, other, monthstr, yearstr;
            if (!empty)
            {
                int day, month, year;
                monthstr = param.Substring(0, param.IndexOf("/"));
                other = param.Substring(param.IndexOf("/") + 1);
                daystr = other.Substring(0, other.IndexOf("/"));
                yearstr = other.Substring(other.IndexOf("/") + 1);
                day = int.Parse(daystr);
                month = int.Parse(monthstr);
                year = int.Parse(yearstr);


                day = day - 1;
                if (day == 0)
                {
                    month = month - 1;
                    switch (month)
                    {
                        case 1:
                            day = 31;
                            break;
                        case 2:
                            day = 29;
                            break;
                        case 3:
                            day = 31;
                            break;
                        case 4:
                            day = 30;
                            break;
                        case 5:
                            day = 31;
                            break;
                        case 6:
                            day = 30;
                            break;
                        case 7:
                            day = 31;
                            break;
                        case 8:
                            day = 31;
                            break;
                        case 9:
                            day = 30;
                            break;
                        case 10:
                            day = 31;
                            break;
                        case 11:
                            day = 30;
                            break;
                        default:
                            day = 31;
                            break;
                    }
                }
                if (month == 0)
                {
                    month = 12;
                    year = year - 1;
                }

                return month.ToString() + "/" + day.ToString() + "/" + year.ToString();
            }
            else
                return "";
        }

        public string aDayEarlier28(string param, Boolean empty)
        {
            string daystr, other, monthstr, yearstr;
            if (!empty)
            {
                int day, month, year;
                monthstr = param.Substring(0, param.IndexOf("/"));
                other = param.Substring(param.IndexOf("/") + 1);
                daystr = other.Substring(0, other.IndexOf("/"));
                yearstr = other.Substring(other.IndexOf("/") + 1);
                day = int.Parse(daystr);
                month = int.Parse(monthstr);
                year = int.Parse(yearstr);


                day = day - 1;
                if (day == 0)
                {
                    month = month - 1;
                    switch (month)
                    {
                        case 1:
                            day = 31;
                            break;
                        case 2:
                            day = 29;
                            break;
                        case 3:
                            day = 31;
                            break;
                        case 4:
                            day = 30;
                            break;
                        case 5:
                            day = 31;
                            break;
                        case 6:
                            day = 30;
                            break;
                        case 7:
                            day = 31;
                            break;
                        case 8:
                            day = 31;
                            break;
                        case 9:
                            day = 30;
                            break;
                        case 10:
                            day = 31;
                            break;
                        case 11:
                            day = 30;
                            break;
                        default:
                            day = 31;
                            break;
                    }
                }
                if (month == 0)
                {
                    month = 12;
                    year = year - 1;
                }

                return month.ToString() + "/" + day.ToString() + "/" + year.ToString();
            }
            else
                return "";
        }

        public string aDayEarlier27(string param, Boolean empty)
        {
            string daystr, other, monthstr, yearstr;
            if (!empty)
            {
                int day, month, year;
                monthstr = param.Substring(0, param.IndexOf("/"));
                other = param.Substring(param.IndexOf("/") + 1);
                daystr = other.Substring(0, other.IndexOf("/"));
                yearstr = other.Substring(other.IndexOf("/") + 1);
                day = int.Parse(daystr);
                month = int.Parse(monthstr);
                year = int.Parse(yearstr);


                day = day - 1;
                if (day == 0)
                {
                    month = month - 1;
                    switch (month)
                    {
                        case 1:
                            day = 31;
                            break;
                        case 2:
                            day = 29;
                            break;
                        case 3:
                            day = 31;
                            break;
                        case 4:
                            day = 30;
                            break;
                        case 5:
                            day = 31;
                            break;
                        case 6:
                            day = 30;
                            break;
                        case 7:
                            day = 31;
                            break;
                        case 8:
                            day = 31;
                            break;
                        case 9:
                            day = 30;
                            break;
                        case 10:
                            day = 31;
                            break;
                        case 11:
                            day = 30;
                            break;
                        default:
                            day = 31;
                            break;
                    }
                }
                if (month == 0)
                {
                    month = 12;
                    year = year - 1;
                }

                return month.ToString() + "/" + day.ToString() + "/" + year.ToString();
            }
            else
                return "";
        }

        public string aDayEarlier26(string param, Boolean empty)
        {
            string daystr, other, monthstr, yearstr;
            if (!empty)
            {
                int day, month, year;
                monthstr = param.Substring(0, param.IndexOf("/"));
                other = param.Substring(param.IndexOf("/") + 1);
                daystr = other.Substring(0, other.IndexOf("/"));
                yearstr = other.Substring(other.IndexOf("/") + 1);
                day = int.Parse(daystr);
                month = int.Parse(monthstr);
                year = int.Parse(yearstr);


                day = day - 1;
                if (day == 0)
                {
                    month = month - 1;
                    switch (month)
                    {
                        case 1:
                            day = 31;
                            break;
                        case 2:
                            day = 29;
                            break;
                        case 3:
                            day = 31;
                            break;
                        case 4:
                            day = 30;
                            break;
                        case 5:
                            day = 31;
                            break;
                        case 6:
                            day = 30;
                            break;
                        case 7:
                            day = 31;
                            break;
                        case 8:
                            day = 31;
                            break;
                        case 9:
                            day = 30;
                            break;
                        case 10:
                            day = 31;
                            break;
                        case 11:
                            day = 30;
                            break;
                        default:
                            day = 31;
                            break;
                    }
                }
                if (month == 0)
                {
                    month = 12;
                    year = year - 1;
                }

                return month.ToString() + "/" + day.ToString() + "/" + year.ToString();
            }
            else
                return "";
        }

        public string aDayEarlier25(string param, Boolean empty)
        {
            string daystr, other, monthstr, yearstr;
            if (!empty)
            {
                int day, month, year;
                monthstr = param.Substring(0, param.IndexOf("/"));
                other = param.Substring(param.IndexOf("/") + 1);
                daystr = other.Substring(0, other.IndexOf("/"));
                yearstr = other.Substring(other.IndexOf("/") + 1);
                day = int.Parse(daystr);
                month = int.Parse(monthstr);
                year = int.Parse(yearstr);


                day = day - 1;
                if (day == 0)
                {
                    month = month - 1;
                    switch (month)
                    {
                        case 1:
                            day = 31;
                            break;
                        case 2:
                            day = 29;
                            break;
                        case 3:
                            day = 31;
                            break;
                        case 4:
                            day = 30;
                            break;
                        case 5:
                            day = 31;
                            break;
                        case 6:
                            day = 30;
                            break;
                        case 7:
                            day = 31;
                            break;
                        case 8:
                            day = 31;
                            break;
                        case 9:
                            day = 30;
                            break;
                        case 10:
                            day = 31;
                            break;
                        case 11:
                            day = 30;
                            break;
                        default:
                            day = 31;
                            break;
                    }
                }
                if (month == 0)
                {
                    month = 12;
                    year = year - 1;
                }

                return month.ToString() + "/" + day.ToString() + "/" + year.ToString();
            }
            else
                return "";
        }

        public string aDayEarlier24(string param, Boolean empty)
        {
            string daystr, other, monthstr, yearstr;
            if (!empty)
            {
                int day, month, year;
                monthstr = param.Substring(0, param.IndexOf("/"));
                other = param.Substring(param.IndexOf("/") + 1);
                daystr = other.Substring(0, other.IndexOf("/"));
                yearstr = other.Substring(other.IndexOf("/") + 1);
                day = int.Parse(daystr);
                month = int.Parse(monthstr);
                year = int.Parse(yearstr);


                day = day - 1;
                if (day == 0)
                {
                    month = month - 1;
                    switch (month)
                    {
                        case 1:
                            day = 31;
                            break;
                        case 2:
                            day = 29;
                            break;
                        case 3:
                            day = 31;
                            break;
                        case 4:
                            day = 30;
                            break;
                        case 5:
                            day = 31;
                            break;
                        case 6:
                            day = 30;
                            break;
                        case 7:
                            day = 31;
                            break;
                        case 8:
                            day = 31;
                            break;
                        case 9:
                            day = 30;
                            break;
                        case 10:
                            day = 31;
                            break;
                        case 11:
                            day = 30;
                            break;
                        default:
                            day = 31;
                            break;
                    }
                }
                if (month == 0)
                {
                    month = 12;
                    year = year - 1;
                }

                return month.ToString() + "/" + day.ToString() + "/" + year.ToString();
            }
            else
                return "";
        }

        public string aDayEarlier23(string param, Boolean empty)
        {
            string daystr, other, monthstr, yearstr;
            if (!empty)
            {
                int day, month, year;
                monthstr = param.Substring(0, param.IndexOf("/"));
                other = param.Substring(param.IndexOf("/") + 1);
                daystr = other.Substring(0, other.IndexOf("/"));
                yearstr = other.Substring(other.IndexOf("/") + 1);
                day = int.Parse(daystr);
                month = int.Parse(monthstr);
                year = int.Parse(yearstr);


                day = day - 1;
                if (day == 0)
                {
                    month = month - 1;
                    switch (month)
                    {
                        case 1:
                            day = 31;
                            break;
                        case 2:
                            day = 29;
                            break;
                        case 3:
                            day = 31;
                            break;
                        case 4:
                            day = 30;
                            break;
                        case 5:
                            day = 31;
                            break;
                        case 6:
                            day = 30;
                            break;
                        case 7:
                            day = 31;
                            break;
                        case 8:
                            day = 31;
                            break;
                        case 9:
                            day = 30;
                            break;
                        case 10:
                            day = 31;
                            break;
                        case 11:
                            day = 30;
                            break;
                        default:
                            day = 31;
                            break;
                    }
                }
                if (month == 0)
                {
                    month = 12;
                    year = year - 1;
                }

                return month.ToString() + "/" + day.ToString() + "/" + year.ToString();
            }
            else
                return "";
        }

        public string aDayEarlier22(string param, Boolean empty)
        {
            string daystr, other, monthstr, yearstr;
            if (!empty)
            {
                int day, month, year;
                monthstr = param.Substring(0, param.IndexOf("/"));
                other = param.Substring(param.IndexOf("/") + 1);
                daystr = other.Substring(0, other.IndexOf("/"));
                yearstr = other.Substring(other.IndexOf("/") + 1);
                day = int.Parse(daystr);
                month = int.Parse(monthstr);
                year = int.Parse(yearstr);


                day = day - 1;
                if (day == 0)
                {
                    month = month - 1;
                    switch (month)
                    {
                        case 1:
                            day = 31;
                            break;
                        case 2:
                            day = 29;
                            break;
                        case 3:
                            day = 31;
                            break;
                        case 4:
                            day = 30;
                            break;
                        case 5:
                            day = 31;
                            break;
                        case 6:
                            day = 30;
                            break;
                        case 7:
                            day = 31;
                            break;
                        case 8:
                            day = 31;
                            break;
                        case 9:
                            day = 30;
                            break;
                        case 10:
                            day = 31;
                            break;
                        case 11:
                            day = 30;
                            break;
                        default:
                            day = 31;
                            break;
                    }
                }
                if (month == 0)
                {
                    month = 12;
                    year = year - 1;
                }

                return month.ToString() + "/" + day.ToString() + "/" + year.ToString();
            }
            else
                return "";
        }

        public string aDayEarlier21(string param, Boolean empty)
        {
            string daystr, other, monthstr, yearstr;
            if (!empty)
            {
                int day, month, year;
                monthstr = param.Substring(0, param.IndexOf("/"));
                other = param.Substring(param.IndexOf("/") + 1);
                daystr = other.Substring(0, other.IndexOf("/"));
                yearstr = other.Substring(other.IndexOf("/") + 1);
                day = int.Parse(daystr);
                month = int.Parse(monthstr);
                year = int.Parse(yearstr);


                day = day - 1;
                if (day == 0)
                {
                    month = month - 1;
                    switch (month)
                    {
                        case 1:
                            day = 31;
                            break;
                        case 2:
                            day = 29;
                            break;
                        case 3:
                            day = 31;
                            break;
                        case 4:
                            day = 30;
                            break;
                        case 5:
                            day = 31;
                            break;
                        case 6:
                            day = 30;
                            break;
                        case 7:
                            day = 31;
                            break;
                        case 8:
                            day = 31;
                            break;
                        case 9:
                            day = 30;
                            break;
                        case 10:
                            day = 31;
                            break;
                        case 11:
                            day = 30;
                            break;
                        default:
                            day = 31;
                            break;
                    }
                }
                if (month == 0)
                {
                    month = 12;
                    year = year - 1;
                }

                return month.ToString() + "/" + day.ToString() + "/" + year.ToString();
            }
            else
                return "";
        }

        public string aDayEarlier20(string param, Boolean empty)
        {
            string daystr, other, monthstr, yearstr;
            if (!empty)
            {
                int day, month, year;
                monthstr = param.Substring(0, param.IndexOf("/"));
                other = param.Substring(param.IndexOf("/") + 1);
                daystr = other.Substring(0, other.IndexOf("/"));
                yearstr = other.Substring(other.IndexOf("/") + 1);
                day = int.Parse(daystr);
                month = int.Parse(monthstr);
                year = int.Parse(yearstr);


                day = day - 1;
                if (day == 0)
                {
                    month = month - 1;
                    switch (month)
                    {
                        case 1:
                            day = 31;
                            break;
                        case 2:
                            day = 29;
                            break;
                        case 3:
                            day = 31;
                            break;
                        case 4:
                            day = 30;
                            break;
                        case 5:
                            day = 31;
                            break;
                        case 6:
                            day = 30;
                            break;
                        case 7:
                            day = 31;
                            break;
                        case 8:
                            day = 31;
                            break;
                        case 9:
                            day = 30;
                            break;
                        case 10:
                            day = 31;
                            break;
                        case 11:
                            day = 30;
                            break;
                        default:
                            day = 31;
                            break;
                    }
                }
                if (month == 0)
                {
                    month = 12;
                    year = year - 1;
                }

                return month.ToString() + "/" + day.ToString() + "/" + year.ToString();
            }
            else
                return "";
        }

        public string aDayEarlier19(string param, Boolean empty)
        {
            string daystr, other, monthstr, yearstr;
            if (!empty)
            {
                int day, month, year;
                monthstr = param.Substring(0, param.IndexOf("/"));
                other = param.Substring(param.IndexOf("/") + 1);
                daystr = other.Substring(0, other.IndexOf("/"));
                yearstr = other.Substring(other.IndexOf("/") + 1);
                day = int.Parse(daystr);
                month = int.Parse(monthstr);
                year = int.Parse(yearstr);


                day = day - 1;
                if (day == 0)
                {
                    month = month - 1;
                    switch (month)
                    {
                        case 1:
                            day = 31;
                            break;
                        case 2:
                            day = 29;
                            break;
                        case 3:
                            day = 31;
                            break;
                        case 4:
                            day = 30;
                            break;
                        case 5:
                            day = 31;
                            break;
                        case 6:
                            day = 30;
                            break;
                        case 7:
                            day = 31;
                            break;
                        case 8:
                            day = 31;
                            break;
                        case 9:
                            day = 30;
                            break;
                        case 10:
                            day = 31;
                            break;
                        case 11:
                            day = 30;
                            break;
                        default:
                            day = 31;
                            break;
                    }
                }
                if (month == 0)
                {
                    month = 12;
                    year = year - 1;
                }

                return month.ToString() + "/" + day.ToString() + "/" + year.ToString();
            }
            else
                return "";
        }

        public string aDayEarlier18(string param, Boolean empty)
        {
            string daystr, other, monthstr, yearstr;
            if (!empty)
            {
                int day, month, year;
                monthstr = param.Substring(0, param.IndexOf("/"));
                other = param.Substring(param.IndexOf("/") + 1);
                daystr = other.Substring(0, other.IndexOf("/"));
                yearstr = other.Substring(other.IndexOf("/") + 1);
                day = int.Parse(daystr);
                month = int.Parse(monthstr);
                year = int.Parse(yearstr);


                day = day - 1;
                if (day == 0)
                {
                    month = month - 1;
                    switch (month)
                    {
                        case 1:
                            day = 31;
                            break;
                        case 2:
                            day = 29;
                            break;
                        case 3:
                            day = 31;
                            break;
                        case 4:
                            day = 30;
                            break;
                        case 5:
                            day = 31;
                            break;
                        case 6:
                            day = 30;
                            break;
                        case 7:
                            day = 31;
                            break;
                        case 8:
                            day = 31;
                            break;
                        case 9:
                            day = 30;
                            break;
                        case 10:
                            day = 31;
                            break;
                        case 11:
                            day = 30;
                            break;
                        default:
                            day = 31;
                            break;
                    }
                }
                if (month == 0)
                {
                    month = 12;
                    year = year - 1;
                }

                return month.ToString() + "/" + day.ToString() + "/" + year.ToString();
            }
            else
                return "";
        }

        public string aDayEarlier17(string param, Boolean empty)
        {
            string daystr, other, monthstr, yearstr;
            if (!empty)
            {
                int day, month, year;
                monthstr = param.Substring(0, param.IndexOf("/"));
                other = param.Substring(param.IndexOf("/") + 1);
                daystr = other.Substring(0, other.IndexOf("/"));
                yearstr = other.Substring(other.IndexOf("/") + 1);
                day = int.Parse(daystr);
                month = int.Parse(monthstr);
                year = int.Parse(yearstr);


                day = day - 1;
                if (day == 0)
                {
                    month = month - 1;
                    switch (month)
                    {
                        case 1:
                            day = 31;
                            break;
                        case 2:
                            day = 29;
                            break;
                        case 3:
                            day = 31;
                            break;
                        case 4:
                            day = 30;
                            break;
                        case 5:
                            day = 31;
                            break;
                        case 6:
                            day = 30;
                            break;
                        case 7:
                            day = 31;
                            break;
                        case 8:
                            day = 31;
                            break;
                        case 9:
                            day = 30;
                            break;
                        case 10:
                            day = 31;
                            break;
                        case 11:
                            day = 30;
                            break;
                        default:
                            day = 31;
                            break;
                    }
                }
                if (month == 0)
                {
                    month = 12;
                    year = year - 1;
                }

                return month.ToString() + "/" + day.ToString() + "/" + year.ToString();
            }
            else
                return "";
        }

        public string aDayEarlier16(string param, Boolean empty)
        {
            string daystr, other, monthstr, yearstr;
            if (!empty)
            {
                int day, month, year;
                monthstr = param.Substring(0, param.IndexOf("/"));
                other = param.Substring(param.IndexOf("/") + 1);
                daystr = other.Substring(0, other.IndexOf("/"));
                yearstr = other.Substring(other.IndexOf("/") + 1);
                day = int.Parse(daystr);
                month = int.Parse(monthstr);
                year = int.Parse(yearstr);


                day = day - 1;
                if (day == 0)
                {
                    month = month - 1;
                    switch (month)
                    {
                        case 1:
                            day = 31;
                            break;
                        case 2:
                            day = 29;
                            break;
                        case 3:
                            day = 31;
                            break;
                        case 4:
                            day = 30;
                            break;
                        case 5:
                            day = 31;
                            break;
                        case 6:
                            day = 30;
                            break;
                        case 7:
                            day = 31;
                            break;
                        case 8:
                            day = 31;
                            break;
                        case 9:
                            day = 30;
                            break;
                        case 10:
                            day = 31;
                            break;
                        case 11:
                            day = 30;
                            break;
                        default:
                            day = 31;
                            break;
                    }
                }
                if (month == 0)
                {
                    month = 12;
                    year = year - 1;
                }

                return month.ToString() + "/" + day.ToString() + "/" + year.ToString();
            }
            else
                return "";
        }

        public string aDayEarlier15(string param, Boolean empty)
        {
            string daystr, other, monthstr, yearstr;
            if (!empty)
            {
                int day, month, year;
                monthstr = param.Substring(0, param.IndexOf("/"));
                other = param.Substring(param.IndexOf("/") + 1);
                daystr = other.Substring(0, other.IndexOf("/"));
                yearstr = other.Substring(other.IndexOf("/") + 1);
                day = int.Parse(daystr);
                month = int.Parse(monthstr);
                year = int.Parse(yearstr);


                day = day - 1;
                if (day == 0)
                {
                    month = month - 1;
                    switch (month)
                    {
                        case 1:
                            day = 31;
                            break;
                        case 2:
                            day = 29;
                            break;
                        case 3:
                            day = 31;
                            break;
                        case 4:
                            day = 30;
                            break;
                        case 5:
                            day = 31;
                            break;
                        case 6:
                            day = 30;
                            break;
                        case 7:
                            day = 31;
                            break;
                        case 8:
                            day = 31;
                            break;
                        case 9:
                            day = 30;
                            break;
                        case 10:
                            day = 31;
                            break;
                        case 11:
                            day = 30;
                            break;
                        default:
                            day = 31;
                            break;
                    }
                }
                if (month == 0)
                {
                    month = 12;
                    year = year - 1;
                }

                return month.ToString() + "/" + day.ToString() + "/" + year.ToString();
            }
            else
                return "";
        }

        public string aDayEarlier14(string param, Boolean empty)
        {
            string daystr, other, monthstr, yearstr;
            if (!empty)
            {
                int day, month, year;
                monthstr = param.Substring(0, param.IndexOf("/"));
                other = param.Substring(param.IndexOf("/") + 1);
                daystr = other.Substring(0, other.IndexOf("/"));
                yearstr = other.Substring(other.IndexOf("/") + 1);
                day = int.Parse(daystr);
                month = int.Parse(monthstr);
                year = int.Parse(yearstr);


                day = day - 1;
                if (day == 0)
                {
                    month = month - 1;
                    switch (month)
                    {
                        case 1:
                            day = 31;
                            break;
                        case 2:
                            day = 29;
                            break;
                        case 3:
                            day = 31;
                            break;
                        case 4:
                            day = 30;
                            break;
                        case 5:
                            day = 31;
                            break;
                        case 6:
                            day = 30;
                            break;
                        case 7:
                            day = 31;
                            break;
                        case 8:
                            day = 31;
                            break;
                        case 9:
                            day = 30;
                            break;
                        case 10:
                            day = 31;
                            break;
                        case 11:
                            day = 30;
                            break;
                        default:
                            day = 31;
                            break;
                    }
                }
                if (month == 0)
                {
                    month = 12;
                    year = year - 1;
                }

                return month.ToString() + "/" + day.ToString() + "/" + year.ToString();
            }
            else
                return "";
        }

        public string aDayEarlier13(string param, Boolean empty)
        {
            string daystr, other, monthstr, yearstr;
            if (!empty)
            {
                int day, month, year;
                monthstr = param.Substring(0, param.IndexOf("/"));
                other = param.Substring(param.IndexOf("/") + 1);
                daystr = other.Substring(0, other.IndexOf("/"));
                yearstr = other.Substring(other.IndexOf("/") + 1);
                day = int.Parse(daystr);
                month = int.Parse(monthstr);
                year = int.Parse(yearstr);


                day = day - 1;
                if (day == 0)
                {
                    month = month - 1;
                    switch (month)
                    {
                        case 1:
                            day = 31;
                            break;
                        case 2:
                            day = 29;
                            break;
                        case 3:
                            day = 31;
                            break;
                        case 4:
                            day = 30;
                            break;
                        case 5:
                            day = 31;
                            break;
                        case 6:
                            day = 30;
                            break;
                        case 7:
                            day = 31;
                            break;
                        case 8:
                            day = 31;
                            break;
                        case 9:
                            day = 30;
                            break;
                        case 10:
                            day = 31;
                            break;
                        case 11:
                            day = 30;
                            break;
                        default:
                            day = 31;
                            break;
                    }
                }
                if (month == 0)
                {
                    month = 12;
                    year = year - 1;
                }

                return month.ToString() + "/" + day.ToString() + "/" + year.ToString();
            }
            else
                return "";
        }

        public string aDayEarlier12(string param, Boolean empty)
        {
            string daystr, other, monthstr, yearstr;
            if (!empty)
            {
                int day, month, year;
                monthstr = param.Substring(0, param.IndexOf("/"));
                other = param.Substring(param.IndexOf("/") + 1);
                daystr = other.Substring(0, other.IndexOf("/"));
                yearstr = other.Substring(other.IndexOf("/") + 1);
                day = int.Parse(daystr);
                month = int.Parse(monthstr);
                year = int.Parse(yearstr);


                day = day - 1;
                if (day == 0)
                {
                    month = month - 1;
                    switch (month)
                    {
                        case 1:
                            day = 31;
                            break;
                        case 2:
                            day = 29;
                            break;
                        case 3:
                            day = 31;
                            break;
                        case 4:
                            day = 30;
                            break;
                        case 5:
                            day = 31;
                            break;
                        case 6:
                            day = 30;
                            break;
                        case 7:
                            day = 31;
                            break;
                        case 8:
                            day = 31;
                            break;
                        case 9:
                            day = 30;
                            break;
                        case 10:
                            day = 31;
                            break;
                        case 11:
                            day = 30;
                            break;
                        default:
                            day = 31;
                            break;
                    }
                }
                if (month == 0)
                {
                    month = 12;
                    year = year - 1;
                }

                return month.ToString() + "/" + day.ToString() + "/" + year.ToString();
            }
            else
                return "";
        }

        public string aDayEarlier11(string param, Boolean empty)
        {
            string daystr, other, monthstr, yearstr;
            if (!empty)
            {
                int day, month, year;
                monthstr = param.Substring(0, param.IndexOf("/"));
                other = param.Substring(param.IndexOf("/") + 1);
                daystr = other.Substring(0, other.IndexOf("/"));
                yearstr = other.Substring(other.IndexOf("/") + 1);
                day = int.Parse(daystr);
                month = int.Parse(monthstr);
                year = int.Parse(yearstr);


                day = day - 1;
                if (day == 0)
                {
                    month = month - 1;
                    switch (month)
                    {
                        case 1:
                            day = 31;
                            break;
                        case 2:
                            day = 29;
                            break;
                        case 3:
                            day = 31;
                            break;
                        case 4:
                            day = 30;
                            break;
                        case 5:
                            day = 31;
                            break;
                        case 6:
                            day = 30;
                            break;
                        case 7:
                            day = 31;
                            break;
                        case 8:
                            day = 31;
                            break;
                        case 9:
                            day = 30;
                            break;
                        case 10:
                            day = 31;
                            break;
                        case 11:
                            day = 30;
                            break;
                        default:
                            day = 31;
                            break;
                    }
                }
                if (month == 0)
                {
                    month = 12;
                    year = year - 1;
                }

                return month.ToString() + "/" + day.ToString() + "/" + year.ToString();
            }
            else
                return "";
        }

        public string aDayEarlier10(string param, Boolean empty)
        {
            string daystr, other, monthstr, yearstr;
            if (!empty)
            {
                int day, month, year;
                monthstr = param.Substring(0, param.IndexOf("/"));
                other = param.Substring(param.IndexOf("/") + 1);
                daystr = other.Substring(0, other.IndexOf("/"));
                yearstr = other.Substring(other.IndexOf("/") + 1);
                day = int.Parse(daystr);
                month = int.Parse(monthstr);
                year = int.Parse(yearstr);


                day = day - 1;
                if (day == 0)
                {
                    month = month - 1;
                    switch (month)
                    {
                        case 1:
                            day = 31;
                            break;
                        case 2:
                            day = 29;
                            break;
                        case 3:
                            day = 31;
                            break;
                        case 4:
                            day = 30;
                            break;
                        case 5:
                            day = 31;
                            break;
                        case 6:
                            day = 30;
                            break;
                        case 7:
                            day = 31;
                            break;
                        case 8:
                            day = 31;
                            break;
                        case 9:
                            day = 30;
                            break;
                        case 10:
                            day = 31;
                            break;
                        case 11:
                            day = 30;
                            break;
                        default:
                            day = 31;
                            break;
                    }
                }
                if (month == 0)
                {
                    month = 12;
                    year = year - 1;
                }

                return month.ToString() + "/" + day.ToString() + "/" + year.ToString();
            }
            else
                return "";
        }

        public string aDayEarlier9(string param, Boolean empty)
        {
            string daystr, other, monthstr, yearstr;
            if (!empty)
            {
                int day, month, year;
                monthstr = param.Substring(0, param.IndexOf("/"));
                other = param.Substring(param.IndexOf("/") + 1);
                daystr = other.Substring(0, other.IndexOf("/"));
                yearstr = other.Substring(other.IndexOf("/") + 1);
                day = int.Parse(daystr);
                month = int.Parse(monthstr);
                year = int.Parse(yearstr);


                day = day - 1;
                if (day == 0)
                {
                    month = month - 1;
                    switch (month)
                    {
                        case 1:
                            day = 31;
                            break;
                        case 2:
                            day = 29;
                            break;
                        case 3:
                            day = 31;
                            break;
                        case 4:
                            day = 30;
                            break;
                        case 5:
                            day = 31;
                            break;
                        case 6:
                            day = 30;
                            break;
                        case 7:
                            day = 31;
                            break;
                        case 8:
                            day = 31;
                            break;
                        case 9:
                            day = 30;
                            break;
                        case 10:
                            day = 31;
                            break;
                        case 11:
                            day = 30;
                            break;
                        default:
                            day = 31;
                            break;
                    }
                }
                if (month == 0)
                {
                    month = 12;
                    year = year - 1;
                }

                return month.ToString() + "/" + day.ToString() + "/" + year.ToString();
            }
            else
                return "";
        }

        public string aDayEarlier8(string param, Boolean empty)
        {
            string daystr, other, monthstr, yearstr;
            if (!empty)
            {
                int day, month, year;
                monthstr = param.Substring(0, param.IndexOf("/"));
                other = param.Substring(param.IndexOf("/") + 1);
                daystr = other.Substring(0, other.IndexOf("/"));
                yearstr = other.Substring(other.IndexOf("/") + 1);
                day = int.Parse(daystr);
                month = int.Parse(monthstr);
                year = int.Parse(yearstr);


                day = day - 1;
                if (day == 0)
                {
                    month = month - 1;
                    switch (month)
                    {
                        case 1:
                            day = 31;
                            break;
                        case 2:
                            day = 29;
                            break;
                        case 3:
                            day = 31;
                            break;
                        case 4:
                            day = 30;
                            break;
                        case 5:
                            day = 31;
                            break;
                        case 6:
                            day = 30;
                            break;
                        case 7:
                            day = 31;
                            break;
                        case 8:
                            day = 31;
                            break;
                        case 9:
                            day = 30;
                            break;
                        case 10:
                            day = 31;
                            break;
                        case 11:
                            day = 30;
                            break;
                        default:
                            day = 31;
                            break;
                    }
                }
                if (month == 0)
                {
                    month = 12;
                    year = year - 1;
                }

                return month.ToString() + "/" + day.ToString() + "/" + year.ToString();
            }
            else
                return "";
        }

        public string aDayEarlier7(string param, Boolean empty)
        {
            string daystr, other, monthstr, yearstr;
            if (!empty)
            {
                int day, month, year;
                monthstr = param.Substring(0, param.IndexOf("/"));
                other = param.Substring(param.IndexOf("/") + 1);
                daystr = other.Substring(0, other.IndexOf("/"));
                yearstr = other.Substring(other.IndexOf("/") + 1);
                day = int.Parse(daystr);
                month = int.Parse(monthstr);
                year = int.Parse(yearstr);


                day = day - 1;
                if (day == 0)
                {
                    month = month - 1;
                    switch (month)
                    {
                        case 1:
                            day = 31;
                            break;
                        case 2:
                            day = 29;
                            break;
                        case 3:
                            day = 31;
                            break;
                        case 4:
                            day = 30;
                            break;
                        case 5:
                            day = 31;
                            break;
                        case 6:
                            day = 30;
                            break;
                        case 7:
                            day = 31;
                            break;
                        case 8:
                            day = 31;
                            break;
                        case 9:
                            day = 30;
                            break;
                        case 10:
                            day = 31;
                            break;
                        case 11:
                            day = 30;
                            break;
                        default:
                            day = 31;
                            break;
                    }
                }
                if (month == 0)
                {
                    month = 12;
                    year = year - 1;
                }

                return month.ToString() + "/" + day.ToString() + "/" + year.ToString();
            }
            else
                return "";
        }

        public string aDayEarlier6(string param, Boolean empty)
        {
            string daystr, other, monthstr, yearstr;
            if (!empty)
            {
                int day, month, year;
                monthstr = param.Substring(0, param.IndexOf("/"));
                other = param.Substring(param.IndexOf("/") + 1);
                daystr = other.Substring(0, other.IndexOf("/"));
                yearstr = other.Substring(other.IndexOf("/") + 1);
                day = int.Parse(daystr);
                month = int.Parse(monthstr);
                year = int.Parse(yearstr);


                day = day - 1;
                if (day == 0)
                {
                    month = month - 1;
                    switch (month)
                    {
                        case 1:
                            day = 31;
                            break;
                        case 2:
                            day = 29;
                            break;
                        case 3:
                            day = 31;
                            break;
                        case 4:
                            day = 30;
                            break;
                        case 5:
                            day = 31;
                            break;
                        case 6:
                            day = 30;
                            break;
                        case 7:
                            day = 31;
                            break;
                        case 8:
                            day = 31;
                            break;
                        case 9:
                            day = 30;
                            break;
                        case 10:
                            day = 31;
                            break;
                        case 11:
                            day = 30;
                            break;
                        default:
                            day = 31;
                            break;
                    }
                }
                if (month == 0)
                {
                    month = 12;
                    year = year - 1;
                }

                return month.ToString() + "/" + day.ToString() + "/" + year.ToString();
            }
            else
                return "";
        }

        public string aDayEarlier5(string param, Boolean empty)
        {
            string daystr, other, monthstr, yearstr;
            if (!empty)
            {
                int day, month, year;
                monthstr = param.Substring(0, param.IndexOf("/"));
                other = param.Substring(param.IndexOf("/") + 1);
                daystr = other.Substring(0, other.IndexOf("/"));
                yearstr = other.Substring(other.IndexOf("/") + 1);
                day = int.Parse(daystr);
                month = int.Parse(monthstr);
                year = int.Parse(yearstr);


                day = day - 1;
                if (day == 0)
                {
                    month = month - 1;
                    switch (month)
                    {
                        case 1:
                            day = 31;
                            break;
                        case 2:
                            day = 29;
                            break;
                        case 3:
                            day = 31;
                            break;
                        case 4:
                            day = 30;
                            break;
                        case 5:
                            day = 31;
                            break;
                        case 6:
                            day = 30;
                            break;
                        case 7:
                            day = 31;
                            break;
                        case 8:
                            day = 31;
                            break;
                        case 9:
                            day = 30;
                            break;
                        case 10:
                            day = 31;
                            break;
                        case 11:
                            day = 30;
                            break;
                        default:
                            day = 31;
                            break;
                    }
                }
                if (month == 0)
                {
                    month = 12;
                    year = year - 1;
                }

                return month.ToString() + "/" + day.ToString() + "/" + year.ToString();
            }
            else
                return "";
        }

        public string aDayEarlier4(string param, Boolean empty)
        {
            string daystr, other, monthstr, yearstr;
            if (!empty)
            {
                int day, month, year;
                monthstr = param.Substring(0, param.IndexOf("/"));
                other = param.Substring(param.IndexOf("/") + 1);
                daystr = other.Substring(0, other.IndexOf("/"));
                yearstr = other.Substring(other.IndexOf("/") + 1);
                day = int.Parse(daystr);
                month = int.Parse(monthstr);
                year = int.Parse(yearstr);


                day = day - 1;
                if (day == 0)
                {
                    month = month - 1;
                    switch (month)
                    {
                        case 1:
                            day = 31;
                            break;
                        case 2:
                            day = 29;
                            break;
                        case 3:
                            day = 31;
                            break;
                        case 4:
                            day = 30;
                            break;
                        case 5:
                            day = 31;
                            break;
                        case 6:
                            day = 30;
                            break;
                        case 7:
                            day = 31;
                            break;
                        case 8:
                            day = 31;
                            break;
                        case 9:
                            day = 30;
                            break;
                        case 10:
                            day = 31;
                            break;
                        case 11:
                            day = 30;
                            break;
                        default:
                            day = 31;
                            break;
                    }
                }
                if (month == 0)
                {
                    month = 12;
                    year = year - 1;
                }

                return month.ToString() + "/" + day.ToString() + "/" + year.ToString();
            }
            else
                return "";
        }

        public string aDayEarlier3(string param, Boolean empty)
        {
            string daystr, other, monthstr, yearstr;
            if (!empty)
            {
                int day, month, year;
                monthstr = param.Substring(0, param.IndexOf("/"));
                other = param.Substring(param.IndexOf("/") + 1);
                daystr = other.Substring(0, other.IndexOf("/"));
                yearstr = other.Substring(other.IndexOf("/") + 1);
                day = int.Parse(daystr);
                month = int.Parse(monthstr);
                year = int.Parse(yearstr);


                day = day - 1;
                if (day == 0)
                {
                    month = month - 1;
                    switch (month)
                    {
                        case 1:
                            day = 31;
                            break;
                        case 2:
                            day = 29;
                            break;
                        case 3:
                            day = 31;
                            break;
                        case 4:
                            day = 30;
                            break;
                        case 5:
                            day = 31;
                            break;
                        case 6:
                            day = 30;
                            break;
                        case 7:
                            day = 31;
                            break;
                        case 8:
                            day = 31;
                            break;
                        case 9:
                            day = 30;
                            break;
                        case 10:
                            day = 31;
                            break;
                        case 11:
                            day = 30;
                            break;
                        default:
                            day = 31;
                            break;
                    }
                }
                if (month == 0)
                {
                    month = 12;
                    year = year - 1;
                }

                return month.ToString() + "/" + day.ToString() + "/" + year.ToString();
            }
            else
                return "";
        }

        public string aDayEarlier2(string param, Boolean empty)
        {
            string daystr, other, monthstr, yearstr;
            if (!empty)
            {
                int day, month, year;
                monthstr = param.Substring(0, param.IndexOf("/"));
                other = param.Substring(param.IndexOf("/") + 1);
                daystr = other.Substring(0, other.IndexOf("/"));
                yearstr = other.Substring(other.IndexOf("/") + 1);
                day = int.Parse(daystr);
                month = int.Parse(monthstr);
                year = int.Parse(yearstr);


                day = day - 1;
                if (day == 0)
                {
                    month = month - 1;
                    switch (month)
                    {
                        case 1:
                            day = 31;
                            break;
                        case 2:
                            day = 29;
                            break;
                        case 3:
                            day = 31;
                            break;
                        case 4:
                            day = 30;
                            break;
                        case 5:
                            day = 31;
                            break;
                        case 6:
                            day = 30;
                            break;
                        case 7:
                            day = 31;
                            break;
                        case 8:
                            day = 31;
                            break;
                        case 9:
                            day = 30;
                            break;
                        case 10:
                            day = 31;
                            break;
                        case 11:
                            day = 30;
                            break;
                        default:
                            day = 31;
                            break;
                    }
                }
                if (month == 0)
                {
                    month = 12;
                    year = year - 1;
                }

                return month.ToString() + "/" + day.ToString() + "/" + year.ToString();
            }
            else
                return "";
        }



        public string FromPeriod(string param)
        {
            string day, other, month, year;
            int iYear;
            month = param.Substring(0, param.IndexOf("/"));
            other = param.Substring(param.IndexOf("/") + 1);
            day = other.Substring(0, other.IndexOf("/"));
            year = other.Substring(other.IndexOf("/") + 1);

            DateTime date = new DateTime(int.Parse(year), int.Parse(month), int.Parse(day));
            System.Globalization.CultureInfo auCulture =
            System.Globalization.CultureInfo.CreateSpecificCulture("en-US");
            System.Globalization.Calendar cal = auCulture.Calendar;
            int weekNo = cal.GetWeekOfYear(date,
            auCulture.DateTimeFormat.CalendarWeekRule,
            auCulture.DateTimeFormat.FirstDayOfWeek);



            if (weekNo == 53)
            {
                weekNo = 1;
                iYear = int.Parse(year) + 1;
                year = iYear.ToString();
            }
            return weekNo.ToString() + "." + year;

        }

        public string ToPeriod(string d1, string d2, string d3, string d4, string d5, string d6, string d7, string d8, string d9, string d10, string d11, string d12, string d13, string d14, string d15, string d16, string d17, string d18, string d19, string d20, string d21, string d22, string d23, string d24, string d25, string d26, string d27, string d28, string d29, string d30, string d31, string d32, string d33, string d34, string d35, string d36, string d37, string d38, string d39, string d40, string d41, string d42, string d43, string d44, string d45, string d46, string d47, string d48, string d49, string d50, string d51, string d52, string total)
        {
            string param = "";
            if (total.Equals("1"))
                param = d1;
            if (total.Equals("2"))
                param = d2;
            if (total.Equals("3"))
                param = d3;
            if (total.Equals("4"))
                param = d4;
            if (total.Equals("5"))
                param = d5;
            if (total.Equals("6"))
                param = d6;
            if (total.Equals("7"))
                param = d7;
            if (total.Equals("8"))
                param = d8;
            if (total.Equals("9"))
                param = d9;
            if (total.Equals("10"))
                param = d10;
            if (total.Equals("11"))
                param = d12;
            if (total.Equals("12"))
                param = d12;
            if (total.Equals("13"))
                param = d13;
            if (total.Equals("14"))
                param = d14;
            if (total.Equals("15"))
                param = d15;
            if (total.Equals("16"))
                param = d16;
            if (total.Equals("17"))
                param = d17;
            if (total.Equals("18"))
                param = d18;
            if (total.Equals("19"))
                param = d19;
            if (total.Equals("20"))
                param = d20;
            if (total.Equals("21"))
                param = d21;
            if (total.Equals("22"))
                param = d22;
            if (total.Equals("23"))
                param = d23;
            if (total.Equals("24"))
                param = d24;
            if (total.Equals("25"))
                param = d25;
            if (total.Equals("26"))
                param = d26;
            if (total.Equals("27"))
                param = d27;
            if (total.Equals("28"))
                param = d28;
            if (total.Equals("29"))
                param = d29;
            if (total.Equals("30"))
                param = d30;
            if (total.Equals("31"))
                param = d31;
            if (total.Equals("32"))
                param = d32;
            if (total.Equals("33"))
                param = d33;
            if (total.Equals("34"))
                param = d34;
            if (total.Equals("35"))
                param = d35;
            if (total.Equals("36"))
                param = d36;
            if (total.Equals("37"))
                param = d37;
            if (total.Equals("38"))
                param = d38;
            if (total.Equals("39"))
                param = d39;
            if (total.Equals("40"))
                param = d40;
            if (total.Equals("41"))
                param = d41;
            if (total.Equals("42"))
                param = d42;
            if (total.Equals("43"))
                param = d43;
            if (total.Equals("44"))
                param = d44;
            if (total.Equals("45"))
                param = d45;
            if (total.Equals("46"))
                param = d46;
            if (total.Equals("47"))
                param = d47;
            if (total.Equals("48"))
                param = d48;
            if (total.Equals("49"))
                param = d49;
            if (total.Equals("50"))
                param = d50;
            if (total.Equals("51"))
                param = d51;
            if (total.Equals("52"))
                param = d52;


            string day, other, month, year;
            int iYear;
            month = param.Substring(0, param.IndexOf("/"));
            other = param.Substring(param.IndexOf("/") + 1);
            day = other.Substring(0, other.IndexOf("/"));
            year = other.Substring(other.IndexOf("/") + 1);

            DateTime date = new DateTime(int.Parse(year), int.Parse(month), int.Parse(day));
            System.Globalization.CultureInfo auCulture =
            System.Globalization.CultureInfo.CreateSpecificCulture("en-US");
            System.Globalization.Calendar cal = auCulture.Calendar;
            int weekNo = cal.GetWeekOfYear(date,
            auCulture.DateTimeFormat.CalendarWeekRule,
            auCulture.DateTimeFormat.FirstDayOfWeek);

            if (weekNo == 53)
            {
                weekNo = 1;
                iYear = int.Parse(year) + 1;
                year = iYear.ToString();
            }
            return weekNo.ToString() + "." + year;

        }

        public bool LogicalEq(string val1, string val2)
        {
            bool ret = false;
            double d1 = 0;
            double d2 = 0;
            if (IsNumeric(val1, ref d1) && IsNumeric(val2, ref d2))
            {
                ret = d1 == d2;
            }
            else
            {
                ret = String.Compare(val1, val2, StringComparison.Ordinal) == 0;
            }
            return ret;
        }


        public string MathDivide(string val1, string val2)
        {
            string retval = "";
            double d1 = 0;
            double d2 = 0;
            if (IsNumeric(val1, ref d1) && IsNumeric(val2, ref d2))
            {
                if (d2 != 0)
                {
                    double ret = d1 / d2;
                    retval = ret.ToString(System.Globalization.CultureInfo.InvariantCulture);
                }
            }
            return retval;
        }


        public string MathRound(string val)
        {
            return MathRound(val, "0");
        }

        public string MathRound(string val, string decimals)
        {
            string retval = "";
            double v = 0;
            double db = 0;
            if (IsNumeric(val, ref v) && IsNumeric(decimals, ref db))
            {
                try
                {
                    int d = (int)db;
                    double ret = Math.Round(v, d);
                    retval = ret.ToString(System.Globalization.CultureInfo.InvariantCulture);
                }
                catch (Exception)
                {
                }
            }
            return retval;
        }


        public bool LogicalNe(string val1, string val2)
        {
            bool ret = false;
            double d1 = 0;
            double d2 = 0;
            if (IsNumeric(val1, ref d1) && IsNumeric(val2, ref d2))
            {
                ret = d1 != d2;
            }
            else
            {
                ret = String.Compare(val1, val2, StringComparison.Ordinal) != 0;
            }
            return ret;
        }


        public bool LogicalLte(string val1, string val2)
        {
            bool ret = false;
            double d1 = 0;
            double d2 = 0;
            if (IsNumeric(val1, ref d1) && IsNumeric(val2, ref d2))
            {
                ret = d1 <= d2;
            }
            else
            {
                ret = String.Compare(val1, val2, StringComparison.Ordinal) <= 0;
            }
            return ret;
        }


        public bool IsNumeric(string val)
        {
            if (val == null)
            {
                return false;
            }
            double d = 0;
            return Double.TryParse(val, System.Globalization.NumberStyles.AllowThousands | System.Globalization.NumberStyles.Float, System.Globalization.CultureInfo.InvariantCulture, out d);
        }

        public bool IsNumeric(string val, ref double d)
        {
            if (val == null)
            {
                return false;
            }
            return Double.TryParse(val, System.Globalization.NumberStyles.AllowThousands | System.Globalization.NumberStyles.Float, System.Globalization.CultureInfo.InvariantCulture, out d);
        }

        public bool ValToBool(string val)
        {
            if (val != null)
            {
                if (string.Compare(val, bool.TrueString, StringComparison.OrdinalIgnoreCase) == 0)
                {
                    return true;
                }
                if (string.Compare(val, bool.FalseString, StringComparison.OrdinalIgnoreCase) == 0)
                {
                    return false;
                }
                val = val.Trim();
                if (string.Compare(val, bool.TrueString, StringComparison.OrdinalIgnoreCase) == 0)
                {
                    return true;
                }
                if (string.Compare(val, bool.FalseString, StringComparison.OrdinalIgnoreCase) == 0)
                {
                    return false;
                }
                double d = 0;
                if (IsNumeric(val, ref d))
                {
                    return (d > 0);
                }
            }
            return false;
        }




    }
}
