FROM viapath/snappy_ngstools
MAINTAINER David Brawand <dbrawand@nhs.net>
ENV HOME /root
ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64

## varDict
RUN cd /usr/local/pipeline/ && \
    git clone --recursive https://github.com/AstraZeneca-NGS/VarDictJava.git && \
    cd VarDictJava && \
    git checkout v1.4.0 && \
    git submodule update --recursive && \
    ./gradlew clean installApp && \
    ./gradlew clean javadoc && \
    chmod -R 755 /usr/local/pipeline/VarDictJava && \
    chown -R snappy:snappy /usr/local/pipeline && \
    sed  -i '$aPATH=$PATH:/usr/local/pipeline/VarDictJava/VarDict' /home/snappy/.bashrc
#./gradlew clean javadoc && \

CMD ["/bin/bash"]
