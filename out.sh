#!/bin/sh

stdlog_out_hour=`date "+%H"`
stdlog_out_minute=`date "+%M"`
stdlog_out=$(($stdlog_out_hour * 60 + $stdlog_out_minute))
stdlog_stdtime_minute=$(($stdlog_out - ($stdlog_in + $stdlog_breaktime)))
stdlog_stdtime_hour=`echo "scale=1;$stdlog_stdtime_minute / 60.0" | bc`

if [ $stdlog_stdtime_minute -le 0 ] ; then
    stdlog_stdtime_minute=0
    stdlog_stdtime_hour=0
fi


today=`date "+%y:%m:%d"`
stdlog_judge=`grep "$today" ~/stdlog/data.csv`
stdlog_data=`cat ~/stdlog/data.csv`
if [ "$stdlog_judge" != "" ] ; then
    echo $stdlog_data | sed -e "s/$today.*$/ /g" | sed -e 's/ 2/\n2/g' > ~/stdlog/data.csv
fi
# "year_month_day, study_time_hour, study_time_minute"

echo "$today,$stdlog_stdtime_hour,$stdlog_stdtime_minute" >> ~/stdlog/data.csv
