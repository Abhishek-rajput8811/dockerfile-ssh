# run images
FROM ubuntu
# install ssh server
RUN apt update
RUN apt install -y openssh-server
# create directory
RUN mkdir /run/sshd
# create an user and give an appropriate password
RUN useradd -m abhi && echo 'abhi:12345' | chpasswd &&  usermod -aG sudo abhi
# now set environment varibale with password
ENV SSH_USERNAME=abhi
ENV SSH_PASSWORD=12345
#now expose the port 
EXPOSE 22
# NOW give image a dedicated task 
CMD ["/usr/sbin/sshd","-D"]
