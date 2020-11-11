#!/bin/sh
# 休み時間の取得
stdlog_time=$1

#　休み時間の計算
stdlog_breaktime=$(($stdlog_time + $stdlog_breaktime))

#　文字の表示
echo "$stdlog_time分後には戻ってきてください(・_・;)"