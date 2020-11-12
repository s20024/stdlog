#!/bin/sh

# 終了データの取得
stdlog_out_hour=`date "+%H"`
stdlog_out_minute=`date "+%M"`

#　終了データの計算
stdlog_out=$(($stdlog_out_hour * 60 + $stdlog_out_minute))

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

#　今日（当日の日にちの取得）
today=`echo ~/.stdlog/stdlog_today`

#　データにすでに今日のデータがあるかどうかのため
stdlog_judge=`grep "$today" ~/stdlog/data.csv`

#catから>したらおかしくなるから1度変数に代入
stdlog_data=`cat ~/stdlog/data.csv`

#　データにすでに今日のデータがあった場合の処理
if [ "$stdlog_judge" != "" ] ; then

    #　今日のデータの消去
    echo $stdlog_data | sed -e "s/$today.*$/ /g" | sed -e 's/ 2/\n2/g' > ~/stdlog/data.csv
fi

# "year_month_day, study_time_hour, study_time_minute"
#　データの入力
echo "$today,$stdlog_stdtime_hour,$stdlog_stdtime_minute" >> ~/stdlog/data.csv

#　文字の表示
echo "$stdlog_stdtime_hour時間勉強しました。"
echo "お疲れ様です。(・_・;)"