#!/bin/sh

cd XtEHR-models
wget https://github.com/Xt-EHR/xt-ehr-common/archive/refs/tags/0.2.0.zip
unzip 0.2.0.zip
cd xt-ehr-common-0.2.0
sushi .
cd ..
