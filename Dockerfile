# Container image that runs your code
FROM alpine:3.10

ARG order-number
ARG $ordered-date

Run echo "hello ${{order-number}} :: world ${{ordered-date}} " 

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]
