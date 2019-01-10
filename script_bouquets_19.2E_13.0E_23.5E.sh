#!/bin/sh

cd /home/annie/Settings

#Augabedatei
OUT="bouquets.xml"
start=$(cat ./start/bstart.xml)
#sata=$(cat ./0.8W/bouquets.xml)
#satb=$(cat ./4.8E/bouquets.xml)
#satc=$(cat ./7.0E/bouquets.xml)
#satd=$(cat ./9.0E/bouquets.xml)
sate=$(cat ./13.0E/bouquets.xml)
#satf=$(cat ./16.0E/bouquets.xml)
satg=$(cat ./19.2E/bouquets.xml)
sath=$(cat ./23.5E/bouquets.xml)
#sati=$(cat ./26.0E/bouquets.xml)
#satj=$(cat ./28.2E/bouquets.xml)
end=$(cat ./end/bend.xml)

echo "$start" > $OUT
#echo "$sata" >> $OUT
#echo "$satb" >> $OUT
#echo "$satc" >> $OUT
#echo "$satd" >> $OUT
echo "$sate" >> $OUT
#echo "$satf" >> $OUT
echo "$satg" >> $OUT
echo "$sath" >> $OUT
#echo "$sati" >> $OUT
#echo "$satj" >> $OUT
echo "$end" >> $OUT

