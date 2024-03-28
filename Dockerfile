FROM httpd:alpine
COPY . /usr/local/apache2/htdocs/
RUN apk add grep
RUN apk add bash
RUN apk add curl
RUN chmod +x /usr/local/apache2/htdocs/curl_weather.sh
EXPOSE 80
