from openjdk:11
copy . /root/
workdir /root/
entrypoint ['java','-jar','demo-0.0.1-SNAPSHOT.jar']