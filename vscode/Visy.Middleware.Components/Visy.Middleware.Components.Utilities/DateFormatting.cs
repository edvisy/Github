using System;
using System.Collections.Generic;
using System.Text;
using System.IO;

namespace Visy.Middleware.Components.Utilities
{
    public class DateFormatting
    {
        public static string Format(string in_date)
        {
            string out_date = "";
            //FileStream sLogFile = new FileStream(@"C:\temp\errors\calls.log", FileMode.Create, FileAccess.Write);
            //System.IO.StreamWriter strmWriter2 = new System.IO.StreamWriter(sLogFile);
            try
            {
                //convert from 17/08/2006 ( [dd]/[mm]/[yyyy] to [yyyymmdd]
                
                //strmWriter2.WriteLine("Calling with date : " + in_date);

                string s_year;
                string s_month;
                string s_day;
                int i_year;
                int i_month;
                int i_day;

                //parse 
                s_year = in_date.Substring(6, 2);
                s_month = in_date.Substring(3, 2);
                s_day = in_date.Substring(0, 2);
                #region check year and convert to int
                if (s_year.Length == 2)
                    s_year = "20" + s_year;
                else
                    if (s_year.Length != 4)
                    {
                        //raise error - year is invalid
                        throw (new Exception("Year is invalid on date : " + in_date));
                    }
                i_year = int.Parse(s_year);
                #endregion
                #region check month boundaries and convert to int
                if (s_month.Length != 2)
                    throw (new Exception("Month is invalid on date : " + in_date));
                i_month = int.Parse(s_month);
                if (i_month < 1 || i_month > 12) //check month boundaries
                    throw (new Exception("Month is invalid on date : " + in_date));
                #endregion
                #region check day boundaries and convert to int
                if (s_day.Length < 1 || s_day.Length > 2)//check length
                    throw (new Exception("Day is invalid on date : " + in_date));
                i_day = int.Parse(s_day);
                if (i_day < 1 || i_day > 31)
                    throw (new Exception("Day is invalid on date : " + in_date));
                #endregion


                DateTime dtIn = new DateTime(i_year, i_month, i_day);
                out_date = dtIn.ToString("yyyyMMdd");
            }
            catch (Exception e)
            {
                //write to log file
                //FileStream sOutFile = new FileStream(@"C:\temp\errors\errors.log", FileMode.Create, FileAccess.Write);
                //System.IO.StreamWriter strmWriter = new System.IO.StreamWriter(sOutFile);
                //strmWriter.WriteLine(e.ToString());
                //strmWriter.Close();
                //sOutFile.Close();
                throw (e);
            }
            finally
            {
                //strmWriter2.Close();
                //sLogFile.Close(); 
            }
            
            return out_date;
        }
        
        /// <summary>
        /// 
        /// </summary>
        /// <param name="InDateType">1 - Fixed, 2 - Delimiter</param>
        /// <param name="InFixedFormat">If InDateType=1 than this is used to determine the fixed format, if not it's ignore.</param>
        /// <param name="InDelimiter">If InDateType=2 than this is used to split date parts.</param>
        /// <param name="InLayout">1 - Day/Year/Month, 2 - Day/Month/Year, 3 - Month/Year/Day, 4 - Month/Day/Year, 5 - Year/Day/Month, 6 - Year/Month/Day.</param>
        /// <param name="OutDateFormat">Format of Output Date. Eg. DDMMYYYY</param>
        /// <param name="InDate">Date to be formated.</param>
        /// <returns></returns>
        public static string FormatDate(int InDateType, string InFixedFormat, string InDelimiter, int InLayout, string OutDateFormat, string InDate)
        {
            string OutPutDate = "";
            if (InDateType == 1) //Fixed
            {
                //USE InFixedFormat to parse date and reformat to output format
                OutPutDate = FormatBySpecified(InFixedFormat, OutDateFormat, InDate);
            }
            else
                if (InDateType == 2)//Delimiter
                {
                    //USE InDelimiter, InLayout to parse date and reformat to output format
                    /*
                    ALGORITH :
                    1. split using delimiter
                    2. get parts using InLayout
                    3. pass To format function to reformat
                     
                     */
                    string day = "";
                    string month = "";
                    string year = "";


                    #region STRIP TIME IF ANY
                    InDate.Trim();
                    if (InDate.Contains(" "))
                    {
                        //assumption is made that format is [DATE][SPACE][TIME]
                        InDate = InDate.Substring(0, InDate.IndexOf(" "));
                    }

                    #endregion


                    #region GET DATE PARTS
                    //IMPROVEMENT (MH) : If specified Delimiter is not found on the data passed in
                    //than cycle through other possible delimiters ( ie. -/\. )
                    string PossibleDelimiters = @".,\,/,-";
                    string del_char = ",";
                    string[] DelArray = PossibleDelimiters.Split(del_char.ToCharArray(),System.StringSplitOptions.None);
                    
                    string[] date_parts;
                    if (InDate.IndexOf(InDelimiter) > 0) //delimiter found
                    {
                        date_parts = InDate.Split(InDelimiter.ToCharArray(), System.StringSplitOptions.None);
                    }
                    else
                    {
                        bool found_alternate = false;
                        for (int i = 0; (i < DelArray.Length && (found_alternate == false)); i++)
                        {
                            if (InDate.IndexOf(DelArray[i]) > 0) //found alternate delimiter
                            {
                                InDelimiter = DelArray[i];
                                found_alternate = true;
                            }
                        }
                        if (found_alternate)
                        {
                            date_parts = InDate.Split(InDelimiter.ToCharArray(), System.StringSplitOptions.None);
                        }
   

                        else if (InLayout == 7) //Add routine for InLayout = 7
                        {
                            //Assign date_parts for empty
                            date_parts = InDate.Split(' ');
                            
                            //Convert excel date number to a date
                            int l = Int32.Parse(InDate) + 68569 + 2415019;
                            int n = ((4 * l) / 146097);
                            l = l - ((146097 * n + 3) / 4);
                            int i = ((4000 * (l + 1)) / 1461001);
                            l = l - ((1461 * i) / 4) + 31;
                            int j = ((80 * l) / 2447);

                            int  iday = l - ((2447 * j) / 80);

                            l = (j / 11);
                            int imonth = j + 2 - (12 * l);
                            int iyear = 100 * (n - 49) + i + l;
                             
                            day = iday.ToString();
                            month = imonth.ToString();
                            year = iyear.ToString();

                        }
                        else
                        {
                            throw new Exception("Unable to find valid Delimiter for Date");
                        }
                                                    
                    }

                   

                    if (InLayout == 1 || InLayout == 2)
                    {
                        day = date_parts[0];
                        if (InLayout == 1)
                        {
                            month = date_parts[2];
                            year = date_parts[1];
                        }
                        else
                        {
                            month = date_parts[1];
                            year = date_parts[2];
                        }

                    }
                    else
                        if (InLayout == 3 || InLayout == 4)
                        {
                            month = date_parts[0];
                            if (InLayout == 3)
                            {
                                day = date_parts[2];
                                year = date_parts[1];
                            }
                            else
                            {
                                day = date_parts[1];
                                year = date_parts[2];
                            }
                        }
                        else
                            if (InLayout == 5 || InLayout == 6)
                            {
                                year = date_parts[0];
                                if (InLayout == 5)
                                {
                                    month = date_parts[2];
                                    day = date_parts[1];
                                }
                                else
                                {
                                    month = date_parts[1];
                                    day = date_parts[2];
                                }
                            }
                    #endregion

                    //Perform Validation

                    //Convert String Month ( eg. Jan, Feb etc.. ) to number
                    if (month.Length > 2) //longer indicates string
                    {

                        #region GET MONTH NUMBER
                        switch (month.ToLower())
                        {
                            case "jan":
                                month = "1";
                                break;
                            case "feb":
                                month = "2";
                                break;
                            case "mar":
                                month = "3";
                                break;
                            case "apr":
                                month = "4";
                                break;
                            case "may":
                                month = "5";
                                break;
                            case "jun":
                                month = "6";
                                break;
                            case "jul":
                                month = "7";
                                break;
                            case "aug":
                                month = "8";
                                break;
                            case "sep":
                                month = "9";
                                break;
                            case "oct":
                                month = "10";
                                break;
                            case "nov":
                                month = "11";
                                break;
                            case "dec":
                                month = "12";
                                break;
                            default :
                                throw (new Exception("Invalid Month supplied (" + month + ")"));
                                break;
                        }
                        #endregion
                    }

                    OutPutDate = ReFormat(year, month, day, OutDateFormat);

                }
                else
                {
                    throw (new Exception("DateType not supported.  Must be 1 for Fixe or 2 for Delimited."));
                }
            return OutPutDate;
        }
        private static string FormatBySpecified(string inFormat, string outFormat, string inDate)
        {
            Boolean longYear = false;
            string rawArrangedDate = "";
            string outputDate = "";

            //parts of date will always be identified by m or d or y
            //hence this can be used to determine length of parts
            //d will always be 2

            int day_length = DatePartLength(inFormat, 'D');
            string day = inDate.Substring(inFormat.IndexOf("D"), day_length);
            //can be MMM, hence length will be 3
            int month_length = DatePartLength(inFormat, 'M');
            string month = inDate.Substring(inFormat.IndexOf("M"), month_length);
            //can be YYYY, hence length will be 4
            int year_length = DatePartLength(inFormat, 'Y');
            string year = inDate.Substring(inFormat.IndexOf("Y"), year_length);



            outputDate = ReFormat(year, month, day, outFormat);

            return outputDate;

        }

        public static string FormatNumberToDDMMYYYY(string param)
        {
            string numberstr = param;
            int number = int.Parse(numberstr);
            DateTime aDate = new DateTime(1899, 12, 30);
            aDate = aDate.AddDays(number);
            return aDate.ToShortDateString();
        }

        private static string ReFormat(string s_year, string s_month, string s_day, string outFormat)
        {
            DateTime dt;
            int i_year;
            int i_month;
            int i_day;

            //make sure output format is correct
            string parsedFormat = parseOutDateFormat(outFormat);

            if (s_year.Length == 2) //make sure year is full length
                s_year = "20" + s_year;

            i_year = int.Parse(s_year);
            i_month = int.Parse(s_month);
            i_day = int.Parse(s_day);

            dt = new DateTime(i_year, i_month, i_day);

            return dt.ToString(parsedFormat);
        }
        private static int DatePartLength(string inFormat, char date_part)
        {
            int part_length = 0;
            char[] sChars = inFormat.ToCharArray();
            for (int i = 0; i < sChars.Length; i++)
            {
                if (sChars[i] == date_part)
                    part_length++;
            }
            return part_length;
        }
        private static string parseOutDateFormat(string outFormat)
        {
            string parsedFormat = "";
            string singleChar = "";


            int i = 0;
            while (i < outFormat.Length)
            {
                singleChar = outFormat.Substring(i, 1);
                if (singleChar.Equals("D") || singleChar.Equals("Y"))
                {
                    singleChar = singleChar.ToLower();
                }
                parsedFormat = parsedFormat + singleChar;
                i++;
            }

            return parsedFormat;

        }

        public static string FormateDateNew(string inputDate, string outputFormat)
        {
            return (Convert.ToDateTime(inputDate)).ToString(outputFormat);
        }

        public static string FormateDateNew(string inputDate, string outputFormat, string inputFormat)
        {
            try
            {
                if (inputDate.Length > 5)
                {
                    inputDate = inputDate.IndexOf("/") > 0 && inputFormat.IndexOf(".") > 0 ? inputDate.Replace("/", ".") : inputDate;
                    inputDate = inputDate.IndexOf(".") > 0 && inputFormat.IndexOf("/") > 0 ? inputDate.Replace(".", "/") : inputDate;

                    DateTime dt = DateTime.ParseExact(inputDate, inputFormat, System.Globalization.CultureInfo.InvariantCulture);
                    return dt.ToString(outputFormat);
                }
                else {

                    double number = double.Parse(inputDate);
                    DateTime conv = DateTime.FromOADate(number);

                    return conv.ToString("yyyyMMdd");
                }
            }
            catch (Exception ex){
                return string.Empty;
            }
        }

    }
}
