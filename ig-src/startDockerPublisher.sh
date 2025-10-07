#!/bin/sh

random_number=$(date +%s%N | cut -b1-10)
instance_name="ig-publisher-imaging-$random_number"

docker run \
    --name $instance_name \
    --rm -it \
    -v $(pwd):/home/publisher/ig \
    --tmpfs /home/publisher/ig/.fhir \
    hl7fhir/ig-publisher-base 
