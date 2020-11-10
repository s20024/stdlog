#!/bin/sh

stdlog_out_hour=`date "+%H"`
stdlog_out_minute=`date "+%M"`
stdlog_out=$(($stdlog_out_hour * 60 + $stdlog_out_minute))
stdlog_stdtime_minute=$(($stdlog_out - $stdlog_in - $std))
stdlog_stdtime_hour=`echo "scale=5;$stdlog_stdtime_minute / 60.0" | bc`

today=`date "+%y/%m/%d"`

# "year_month_day, study_time_hour, study_time_minute"

echo "$today, $stdlog_stdtime_hour, $stdlog_stdtime_minute" >> date.csv