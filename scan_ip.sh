#!/bin/bash
 
[ $UID -ne 0 ]&&{
  echo  "Pls su - root!"
  exit 1
}
 
#-c ping通几次结束
#-t 超时几秒结束
CMD="ping -c 1 -t 5"
IP="192.168.0."
 
for n in `seq 254`
do
{
  $CMD $IP$n &>/dev/null
  if [  $? -eq 0 ];then
#把结果追加到文件当中
    echo  "$IP$n is survival" >> ${IP}lsit.txt
    
  fi
} & #并行编程
done

