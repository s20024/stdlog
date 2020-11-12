#!/bin/sh

# 前回のデータの取得
today=`cat ~/.stdlog/stdlog_today`
judge=`cat ~/stdlog/data.csv | grep $today`

# 前回のデータが残っているかの判別
if [ "$judge" = "" ] ; then

# 前回のデータが残っていない場合（outコマンドのシワスレの場合）
echo "前回outのし忘れです。"

# 終了データの取得
read -p "$today は何時に勉強を終わりましたか？　時間を入力→:" stdlog_out_hour_out
read -p "$today は何分に勉強を終わりましたか？　分数を入力→:" stdlog_out_minute_out

#　終了データの計算
stdlog_out=$(($stdlog_out_hour_out * 60 + $stdlog_out_minute_out))

# 休み時間の取得
stdlog_breaktime=`cat ~/.stdlog/stdlog_breaktime`

# 初めの時間の取得
stdlog_in=`cat ~/.stdlog/stdlog_in`

#　勉強した分数の計算
stdlog_stdtime_minute=$(($stdlog_out - ($stdlog_in + $stdlog_breaktime)))

#　勉強した分数から時間の取得
stdlog_stdtime_hour=`echo "scale=1;$stdlog_stdtime_minute / 60.0" | bc`

#　休み時間のせいで勉強時間がマイナスになった場合の処理
if [ $stdlog_stdtime_minute -le 0 ] ; then
    stdlog_stdtime_minute=0
    stdlog_stdtime_hour=0
fi

# "year_month_day, study_time_hour, study_time_minute"
#　データの入力
echo "$today,$stdlog_stdtime_hour,$stdlog_stdtime_minute" >> ~/stdlog/data.csv

#　文字の表示
echo "$todayは$stdlog_stdtime_hour時間勉強しました。"
echo "お疲れ様です。(・_・;)"
echo ""

fi
today=`date "+%y:%m:%d"`
echo "$today" > ~/.stdlog/stdlog_today

# 勉強開始のデータの取得
stdlog_in_hour=`date "+%H"`
stdlog_in_minute=`date "+%M"`
#　勉強はじめの時間の計算
stdlog_in=$(($stdlog_in_hour * 60 + $stdlog_in_minute))

# .stdlog にデータとして記入
echo $stdlog_in > ~/.stdlog/stdlog_in

#　休み時間のクリア
echo "0" > ~/.stdlog/stdlog_breaktime

# 表示の表示ｗ
echo "$stdlog_in_hour時$stdlog_in_minute分！！"
echo "勉強スタート！！今日も1日頑張ろう！ｗ"