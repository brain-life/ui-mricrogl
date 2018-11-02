docker build -t soichih/vncserver-mricrogl .
docker tag soichih/vncserver-mricrogl soichih/vncserver-mricrogl:1.1

#note.. this repo should be built via autobuild on dockerhub
docker push soichih/vncserver-mricrogl
