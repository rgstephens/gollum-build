FROM ruby:2.7-buster
RUN apt-get -y update && apt-get -y install libicu-dev cmake git && rm -rf /var/lib/apt/lists/*

RUN gem install github-linguist
RUN gem install gollum
RUN gem install org-ruby
RUN gem install github-markdown

#RUN apt-get install -y net-tools

RUN addgroup --system gollum && adduser --ingroup gollum --system gollum

WORKDIR /wiki
#COPY config.rb .
#RUN ls -l
#RUN pwd

#WORKDIR /app/wiki
#RUN mkdir /app/wiki
#RUN chown -R gollum:gollum /app/wiki
#USER gollum
#RUN ls  -l

CMD gollum --live-preview --show-all --page-file-dir /wiki/repo
#CMD gollum --port 80 --live-preview --show-all --config /wiki/config.rb
# ENTRYPOINT ["gollum", "--port", "80"]

EXPOSE 4567
