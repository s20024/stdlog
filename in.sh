#!/bin/sh

# 勉強開始のデータの取得
stdlog_in_hour=`date "+%H"`
stdlog_in_minute=`date "+%M"`
#　勉強はじめの時間の計算
stdlog_in=$(($stdlog_in_hour * 60 + $stdlog_in_minute))
#　休み時間のクリア
stdlog_breaktime=0

# 表示の表示ｗ
echo "$stdlog_in_hour時$stdlog_in_minute分！！"
echo "勉強スタート！！今日も1日頑張ろう！ｗ"