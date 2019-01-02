FROM cloudbees/jnlp-slave-with-java-build-tools:2.4.0

USER root

ENV SONAR_SCANNER_VER 3.2.0.1227-linux

RUN mkdir -p /opt/sonar && \
    wget https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-${SONAR_SCANNER_VER}.zip && \
    unzip -d /opt/sonar sonar-scanner-cli-${SONAR_SCANNER_VER}.zip && \
    rm sonar-scanner-cli-${SONAR_SCANNER_VER}.zip && \
    # Sass and compass too
    apt-get -y update && \
    apt-get install -y ruby ruby-dev build-essential && \
    gem install sass -v 3.4.24 && \
    gem install compass -v 1.0.3

USER jenkins

ENV PATH $PATH:/opt/sonar/sonar-scanner-${SONAR_SCANNER_VER}/bin