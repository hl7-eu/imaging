#!/bin/sh

cd XtEHR-models
wget https://github.com/Xt-EHR/xt-ehr-common/archive/refs/tags/0.3.0.zip
unzip 0.3.0.zip
cd xt-ehr-common-0.3.0
./_updatePublisher.sh
./_genonce.sh
cd ..
