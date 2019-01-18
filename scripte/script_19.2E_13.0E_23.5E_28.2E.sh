#!/bin/sh

#return="0D"
#echo -e "$start" "\n" "$satg" > $OUT
#echo -n -e "\r\n" >> $OUT

cd ~/Settings/data

#Augabedatei
SOUT="services.xml"
sstart=$(cat ./start/sstart.xml)
ssate=$(cat ./13.0E/13.0E.xml)
ssatg=$(cat ./19.2E/19.2E.xml)
ssath=$(cat ./23.5E/23.5E.xml)
ssatj=$(cat ./28.2E/28.2E.xml)
send=$(cat ./end/send.xml)
echo "$sstart" > $SOUT
echo "$ssate" >> $SOUT
echo "$ssatg" >> $SOUT
echo "$ssath" >> $SOUT
echo "$ssatj" >> $SOUT
echo "$send" >> $SOUT
cp $SOUT ~/Settings/19.2E_13.0E_23.5E_28.2E/

BOUT="bouquets.xml"
bstart=$(cat ./start/bstart.xml)
bsate=$(cat ./13.0E/bouquets.xml)
bsatg=$(cat ./19.2E/bouquets.xml)
bsath=$(cat ./23.5E/bouquets.xml)
bsatj=$(cat ./28.2E/bouquets.xml)
bend=$(cat ./end/bend.xml)
echo "$bstart" > $BOUT
echo "$bsate" >> $BOUT
echo "$bsatg" >> $BOUT
echo "$bsath" >> $BOUT
echo "$bsatj" >> $BOUT
echo "$bend" >> $BOUT
cp $BOUT ~/Settings/19.2E_13.0E_23.5E_28.2E/

SATOUT="satellites.xml"
satstart=$(cat ./start/satstart.xml)
satsate=$(cat ./13.0E/satellites.xml)
satsatg=$(cat ./19.2E/satellites.xml)
satsath=$(cat ./23.5E/satellites.xml)
satsatj=$(cat ./28.2E/satellites.xml)
satend=$(cat ./end/satend.xml)
echo "$satstart" > $SATOUT
echo "$satsate" >> $SATOUT
echo "$satsatg" >> $SATOUT
echo "$satsath" >> $SATOUT
echo "$satsatj" >> $SATOUT
echo "$satend" >> $SATOUT
cp $SATOUT ~/Settings/19.2E_13.0E_23.5E_28.2E/

