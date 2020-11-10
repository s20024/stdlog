#!/bin/sh

stdlog_in_hour=`date "+%H"`
stdlog_in_minute=`date "+%M"`
stdlog_in=$(($stdlog_in_hour * 60 + $stdlog_in_minute))
stdlog_breaktime=0