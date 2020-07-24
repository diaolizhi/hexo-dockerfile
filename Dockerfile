FROM centos:7
MAINTAINER diaolizhi

ENV LANG en_US.utf8
ENV TZ Asia/Shanghai
ENV PATH="${PATH}:./node_modules/.bin"

COPY ssh /root/.ssh

RUN yum install -y git

RUN curl -sL https://rpm.nodesource.com/setup_10.x | bash -
RUN yum install -y nodejs

WORKDIR /root
RUN git clone git@github.com:diaolizhi/diaolizhi.github.io.git

WORKDIR /root/diaolizhi.github.io
RUN git checkout --track origin/blog
RUN npm install
RUN nohup hexo s >/dev/null 2>&1 &

RUN git config --global user.email "476439123@qq.com"
RUN git config --global user.name "diaolizhi"

RUN yum install -y vim

