FROM microsoft/mssql-server-linux:2017-latest

RUN apt-get -y update && \
apt-get install -y tzdata && \
ln -fs /usr/share/zoneinfo/Asia/Taipei /etc/localtime && \
dpkg-reconfigure -f noninteractive tzdata &&\
/opt/mssql/bin/mssql-conf set sqlagent.enabled true &&\
/opt/mssql/bin/mssql-conf set hadr.hadrenabled 1

CMD [ "/opt/mssql/bin/sqlservr" ]
