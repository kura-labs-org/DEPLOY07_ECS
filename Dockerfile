from openjdk:11
copy . /root
workdir '/root'
entrypoint ["java","-jar","demo.jar"]
