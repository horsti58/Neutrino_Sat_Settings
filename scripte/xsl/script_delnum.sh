#!/bin/sh
_PWD_=/home/annie/Settings
xsltproc -o ${_PWD_}/19.2E/services.onum.xml ${_PWD_}/scripte/xsl/delnum.xsl ${_PWD_}/19.2E/services.xml
echo "19.2E done"
xsltproc -o ${_PWD_}/19.2E_13.0E/services.onum.xml ${_PWD_}/scripte/xsl/delnum.xsl ${_PWD_}/19.2E_13.0E/services.xml
echo "19.2E_13.0E done"
xsltproc -o ${_PWD_}/19.2E_13.0E_23.5E/services.onum.xml ${_PWD_}/scripte/xsl/delnum.xsl ${_PWD_}/19.2E_13.0E_23.5E/services.xml
echo "19.2E_13.0E_23.5E done"
xsltproc -o ${_PWD_}/19.2E_13.0E_23.5E_28.2E/services.onum.xml ${_PWD_}/scripte/xsl/delnum.xsl ${_PWD_}/19.2E_13.0E_23.5E_28.2E/services.xml
echo "19.2E_13.0E_23.5E_28.2E done"
xsltproc -o ${_PWD_}/19.2E_13.0E_23.5E_28.2E_9.0E/services.onum.xml ${_PWD_}/scripte/xsl/delnum.xsl ${_PWD_}/19.2E_13.0E_23.5E_28.2E_9.0E/services.xml
echo "19.2E_13.0E_23.5E_28.2E_9.0E done"
xsltproc -o ${_PWD_}/services.onum.xml ${_PWD_}/scripte/xsl/delnum.xsl ${_PWD_}/19.2E_13.0E_28.2E/services.xml
echo "19.2E_13.0E_28.2E done"
xsltproc -o ${_PWD_}/28.2E_23.5E_19.2E_13.0E_9.0E_4.8E_0.8W/services.onum.xml ${_PWD_}/scripte/xsl/delnum.xsl ${_PWD_}/28.2E_23.5E_19.2E_13.0E_9.0E_4.8E_0.8W/services.xml
echo "28.2E_23.5E_19.2E_13.0E_9.0E_4.8E_0.8W done"
xsltproc -o ${_PWD_}/28.2E_26.0E_23.5E_19.2E_16.0E_13.0E_9.0E_7.0E_4.8E_0.8W/services.onum.xml ${_PWD_}/scripte/xsl/delnum.xsl ${_PWD_}/28.2E_26.0E_23.5E_19.2E_16.0E_13.0E_9.0E_7.0E_4.8E_0.8W/services.xml
echo "28.2E_26.0E_23.5E_19.2E_16.0E_13.0E_9.0E_7.0E_4.8E_0.8W done"

