FROM alpine
LABEL maintainer "Thomas Bouvier <tomatrocho@gmail.com>"

RUN apk add --no-cache bash curl git

WORKDIR /opt/Dropbox-Uploader
RUN git clone https://github.com/andreafabrizi/Dropbox-Uploader.git

COPY ./dropbox_uploader.conf .
COPY ./crontab.txt .
COPY ./entry.sh .

RUN chmod +x /opt/Dropbox-Uploader/Dropbox-Uploader/dropbox_uploader.sh /opt/Dropbox-Uploader/entry.sh

RUN /usr/bin/crontab ./crontab.txt

CMD ["/entry.sh"]
