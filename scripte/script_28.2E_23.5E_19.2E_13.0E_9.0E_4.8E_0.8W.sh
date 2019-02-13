#!/bin/sh

#return="0D"
#echo -e "$start" "\n" "$satg" > $OUT
#echo -n -e "\r\n" >> $OUT

cd ~/Settings/data

#Augabedatei
SOUT="services.xml"
sstart=$(cat ./start/services.xml)
ssata=$(cat ./0.8W/services.xml)
ssatb=$(cat ./4.8E/services.xml)
ssatd=$(cat ./9.0E/services.xml)
ssate=$(cat ./13.0E/services.xml)
ssatg=$(cat ./19.2E/services.xml)
ssath=$(cat ./23.5E/services.xml)
ssatj=$(cat ./28.2E/services.xml)
send=$(cat ./end/services.xml)
echo "$sstart" > $SOUT
echo "$ssata" >> $SOUT
echo "$ssatb" >> $SOUT
echo "$ssatd" >> $SOUT
echo "$ssate" >> $SOUT
echo "$ssatg" >> $SOUT
echo "$ssath" >> $SOUT
echo "$ssatj" >> $SOUT
echo "$send" >> $SOUT
cp $SOUT ~/Settings/28.2E_23.5E_19.2E_13.0E_9.0E_4.8E_0.8W/

BOUT="bouquets.xml"
bstart=$(cat ./start/bouquets.xml)
bsata=$(cat ./0.8W/bouquets.xml)
bsatb=$(cat ./4.8E/bouquets.xml)
bsatd=$(cat ./9.0E/bouquets.xml)
bsate=$(cat ./13.0E/bouquets.xml)
bsatg=$(cat ./19.2E/bouquets.xml)
bsath=$(cat ./23.5E/bouquets.xml)
bsatj=$(cat ./28.2E/bouquets.xml)
bend=$(cat ./end/bouquets.xml)
echo "$bstart" > $BOUT
echo "$bsata" >> $BOUT
echo "$bsatb" >> $BOUT
echo "$bsatd" >> $BOUT
echo "$bsate" >> $BOUT
echo "$bsatg" >> $BOUT
echo "$bsath" >> $BOUT
echo "$bsatj" >> $BOUT
echo "$bend" >> $BOUT
cp $BOUT ~/Settings/28.2E_23.5E_19.2E_13.0E_9.0E_4.8E_0.8W/

SATOUT="satellites.xml"
satstart=$(cat ./start/satellites.xml)
satsata=$(cat ./0.8W/satellites.xml)
satsatb=$(cat ./4.8E/satellites.xml)
satsatd=$(cat ./9.0E/satellites.xml)
satsate=$(cat ./13.0E/satellites.xml)
satsatg=$(cat ./19.2E/satellites.xml)
satsath=$(cat ./23.5E/satellites.xml)
satsatj=$(cat ./28.2E/satellites.xml)
satend=$(cat ./end/satellites.xml)
echo "$satstart" > $SATOUT
echo "$satsata" >> $SATOUT
echo "$satsatb" >> $SATOUT
echo "$satsatd" >> $SATOUT
echo "$satsate" >> $SATOUT
echo "$satsatg" >> $SATOUT
echo "$satsath" >> $SATOUT
echo "$satsatj" >> $SATOUT
echo "$satend" >> $SATOUT
cp $SATOUT ~/Settings/28.2E_23.5E_19.2E_13.0E_9.0E_4.8E_0.8W/

