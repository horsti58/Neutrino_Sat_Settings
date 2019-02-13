#!/bin/sh
_PWD_=/home/annie/Settings
xsltproc -o ./tmp.xml ${_PWD_}/scripte/xsl/grep0.8.xsl ${_PWD_}/zapit/services.xml
cat ./tmp.xml | grep -v "^[[:space:]]*$" | grep -v zapit | grep -v xml > ${_PWD_}/data/0.8W/services.xml
xsltproc -o ./tmp.xml ${_PWD_}/scripte/xsl/grep4.8.xsl ${_PWD_}/zapit/services.xml
cat ./tmp.xml | grep -v "^[[:space:]]*$" | grep -v zapit | grep -v xml > ${_PWD_}/data/4.8E/services.xml
xsltproc -o ./tmp.xml ${_PWD_}/scripte/xsl/grep7.0.xsl ${_PWD_}/zapit/services.xml
cat ./tmp.xml | grep -v "^[[:space:]]*$" | grep -v zapit | grep -v xml > ${_PWD_}/data/7.0E/services.xml
xsltproc -o ./tmp.xml ${_PWD_}/scripte/xsl/grep9.0.xsl ${_PWD_}/zapit/services.xml
cat ./tmp.xml | grep -v "^[[:space:]]*$" | grep -v zapit | grep -v xml > ${_PWD_}/data/9.0E/services.xml
xsltproc -o ./tmp.xml ${_PWD_}/scripte/xsl/grep13.0.xsl ${_PWD_}/zapit/services.xml
cat ./tmp.xml | grep -v "^[[:space:]]*$" | grep -v zapit | grep -v xml > ${_PWD_}/data/13.0E/services.xml
xsltproc -o ./tmp.xml ${_PWD_}/scripte/xsl/grep16.0.xsl ${_PWD_}/zapit/services.xml
cat ./tmp.xml | grep -v "^[[:space:]]*$" | grep -v zapit | grep -v xml > ${_PWD_}/data/16.0E/services.xml
xsltproc -o ./tmp.xml ${_PWD_}/scripte/xsl/grep19.2.xsl ${_PWD_}/zapit/services.xml
cat ./tmp.xml | grep -v "^[[:space:]]*$" | grep -v zapit | grep -v xml > ${_PWD_}/data/19.2E/services.xml
xsltproc -o ./tmp.xml ${_PWD_}/scripte/xsl/grep23.5.xsl ${_PWD_}/zapit/services.xml
cat ./tmp.xml | grep -v "^[[:space:]]*$" | grep -v zapit | grep -v xml > ${_PWD_}/data/23.5E/services.xml
xsltproc -o ./tmp.xml ${_PWD_}/scripte/xsl/grep26.0.xsl ${_PWD_}/zapit/services.xml
cat ./tmp.xml | grep -v "^[[:space:]]*$" | grep -v zapit | grep -v xml > ${_PWD_}/data/26.0E/services.xml
xsltproc -o ./tmp.xml ${_PWD_}/scripte/xsl/grep28.2.xsl ${_PWD_}/zapit/services.xml
cat ./tmp.xml | grep -v "^[[:space:]]*$" | grep -v zapit | grep -v xml > ${_PWD_}/data/28.2E/services.xml

