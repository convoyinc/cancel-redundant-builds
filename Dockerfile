FROM everpeace/curl-jq:latest

RUN apt-get update && apt-get -y install ca-certificates

WORKDIR /entrypoint
COPY . .

ENTRYPOINT ["./cancel_redundant_builds.sh"]
