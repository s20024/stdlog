#!/bin/sh

path=`pwd`

mkdir -p ~/.stdlog

cd ~/.stdlog

git clone --depth 1 https://github.com/s20024/stdlog.git
mv stdlog/* .
rm -rf stdlog README.md

cd ~/
mkdir -p stdlog
cd stdlog

touch data.csv 
echo "year_month_day,study_time_hour,study_time_minute" > data.csv


echo "
alias in=\". ~/.stdlog/in.sh\"
alias out=\". ~/.stdlog/out.sh\"
alias breaktime=\". ~/.stdlog/breaktime.sh\"
" >> ~/.bashrc

. ~/.bashrc

cd $path