echo 'Installing Java 8...'
sudo apt update
sudo apt-get install -y openjdk-8-jdk
sudo update-java-alternatives -s java-1.8.0-openjdk-amd64

echo 'Installing Spark...'
wget https://downloads.apache.org/spark/spark-2.4.7/spark-2.4.7-bin-hadoop2.7.tgz
tar -xvf spark-2.4.7-bin-hadoop2.7.tgz
sudo mv spark-2.4.7-bin-hadoop2.7/ /opt/spark

echo "export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-amd64/" >> ~/.profile
echo "export SPARK_HOME=/opt/spark" >> ~/.profile
echo "export PATH=$PATH:/usr/lib/jvm/java-1.8.0-openjdk-amd64:/opt/spark/bin:/opt/spark/sbin" >> ~/.profile
echo "export PYSPARK_PYTHON=/usr/bin/python3" >> ~/.profile
#source ~/.profile

echo 'Done. Now run `source ~/.profile` to complete'