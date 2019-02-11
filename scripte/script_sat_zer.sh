#!/bin/sh

_PWD_=/home/annie/Settings

xsltproc -o ./tmp.xml ${_PWD_}/scripte/xsl/grep_sat_0.8.xsl ${_PWD_}/zapit/satellites.xml
cat ./tmp.xml | grep -v "^[[:space:]]*$" | grep -v "\-\-" | grep -v GMT | grep -v xml | grep -v satellites > ${_PWD_}/data/0.8W/satellites.xml

xsltproc -o ./tmp.xml ${_PWD_}/scripte/xsl/grep_sat_4.8.xsl ${_PWD_}/zapit/satellites.xml
cat ./tmp.xml | grep -v "^[[:space:]]*$" | grep -v "\-\-" | grep -v GMT | grep -v xml | grep -v satellites > ${_PWD_}/data/4.8E/satellites.xml

xsltproc -o ./tmp.xml ${_PWD_}/scripte/xsl/grep_sat_7.0.xsl ${_PWD_}/zapit/satellites.xml
cat ./tmp.xml | grep -v "^[[:space:]]*$" | grep -v "\-\-" | grep -v GMT | grep -v xml | grep -v satellites > ${_PWD_}/data/7.0E/satellites.xml

xsltproc -o ./tmp.xml ${_PWD_}/scripte/xsl/grep_sat_9.0.xsl ${_PWD_}/zapit/satellites.xml
cat ./tmp.xml | grep -v "^[[:space:]]*$" | grep -v "\-\-" | grep -v GMT | grep -v xml | grep -v satellites > ${_PWD_}/data/9.0E/satellites.xml

xsltproc -o ./tmp.xml ${_PWD_}/scripte/xsl/grep_sat_13.0.xsl ${_PWD_}/zapit/satellites.xml
cat ./tmp.xml | grep -v "^[[:space:]]*$" | grep -v "\-\-" | grep -v GMT | grep -v xml | grep -v satellites > ${_PWD_}/data/13.0E/satellites.xml

xsltproc -o ./tmp.xml ${_PWD_}/scripte/xsl/grep_sat_16.0.xsl ${_PWD_}/zapit/satellites.xml
cat ./tmp.xml | grep -v "^[[:space:]]*$" | grep -v "\-\-" | grep -v GMT | grep -v xml | grep -v satellites > ${_PWD_}/data/16.0E/satellites.xml

xsltproc -o ./tmp.xml ${_PWD_}/scripte/xsl/grep_sat_19.2.xsl ${_PWD_}/zapit/satellites.xml
cat ./tmp.xml | grep -v "^[[:space:]]*$" | grep -v "\-\-" | grep -v GMT | grep -v xml | grep -v satellites > ${_PWD_}/data/19.2E/satellites.xml

xsltproc -o ./tmp.xml ${_PWD_}/scripte/xsl/grep_sat_23.5.xsl ${_PWD_}/zapit/satellites.xml
cat ./tmp.xml | grep -v "^[[:space:]]*$" | grep -v "\-\-" | grep -v GMT | grep -v xml | grep -v satellites > ${_PWD_}/data/23.5E/satellites.xml

xsltproc -o ./tmp.xml ${_PWD_}/scripte/xsl/grep_sat_26.0.xsl ${_PWD_}/zapit/satellites.xml
cat ./tmp.xml | grep -v "^[[:space:]]*$" | grep -v "\-\-" | grep -v GMT | grep -v xml | grep -v satellites > ${_PWD_}/data/26.0E/satellites.xml

xsltproc -o ./tmp.xml ${_PWD_}/scripte/xsl/grep_sat_28.2.xsl ${_PWD_}/zapit/satellites.xml
cat ./tmp.xml | grep -v "^[[:space:]]*$" | grep -v "\-\-" | grep -v GMT | grep -v xml | grep -v satellites > ${_PWD_}/data/28.2E/satellites.xml


