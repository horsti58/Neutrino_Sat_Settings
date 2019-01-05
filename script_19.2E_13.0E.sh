#!/bin/sh

cd /home/annie/Settings

#Augabedatei
OUT="service.xml"
start=$(cat ./start/start.xml)
#sata=$(cat ./0.8W/0.8W.xml)
#satb=$(cat ./4.8E/4.8E.xml)
#satc=$(cat ./7.0E/7.0E.xml)
#satd=$(cat ./9.0E/9.0E.xml)
sate=$(cat ./13.0E/13.0E.xml)
#satf=$(cat ./16.0E/16.0E.xml)
satg=$(cat ./19.2E/19.2E.xml)
#sath=$(cat ./23.5E/23.5E.xml)
#sati=$(cat ./26.0E/26.0E.xml)
#satj=$(cat ./28.2E/28.2E.xml)
end=$(cat ./end/end.xml)
return="0D"

#echo -e "$start" "\n" "$satg" > $OUT
#echo -n -e "\r\n" >> $OUT

echo "$start" > $OUT
#echo "$sata" >> $OUT
#echo "$satb" >> $OUT
#echo "$satc" >> $OUT
#echo "$satd" >> $OUT
echo "$sate" >> $OUT
#echo "$satf" >> $OUT
echo "$satg" >> $OUT
#echo "$sath" >> $OUT
#echo "$sati" >> $OUT
#echo "$satj" >> $OUT
echo "$end" >> $OUT

