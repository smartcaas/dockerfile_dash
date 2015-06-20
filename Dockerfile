FROM tomcat:8
ENV APP_DIR ${CATALINA_HOME}/webapps/
COPY dash ${APP_DIR}/dash
COPY config.txt ${APP_DIR}/uic/web/WEB-INF/config.txt
COPY server.xml ${CATALINA_HOME}/conf/server.xml
COPY run.sh /run.sh
RUN chmod +x /run.sh
CMD ["/run.sh"]
