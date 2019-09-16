FROM python:alpine
RUN apk update && \
      apk upgrade && \
      apk add bash && \
      apk add --no-cache --virtual build-deps build-base gcc && \
      apk add --no-cache nodejs npm && \
      pip install awscli aws-sam-cli && \
      apk del build-deps
RUN mkdir /app
WORKDIR /app
EXPOSE 3001
ENTRYPOINT ["/usr/local/bin/sam"]
