# sql-server-docker-Asia-Taipei-timezone
<h3>docker SQL Server 設定台灣時區</h3>
<pre>
FROM microsoft/mssql-server-linux:2017-latest

RUN apt-get -y update && \
apt-get install -y tzdata && \
<b>ln -fs /usr/share/zoneinfo/Asia/Taipei/etc/localtime && \</b>
dpkg-reconfigure -f noninteractive tzdata &&\
/opt/mssql/bin/mssql-conf set sqlagent.enabled true &&\
/opt/mssql/bin/mssql-conf set hadr.hadrenabled 1

CMD [ "/opt/mssql/bin/sqlservr" ]

</pre>
