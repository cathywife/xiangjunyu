#!/bin/bash
#Creat By  xiangjunyu
#version 20170621-1.0
#����˷��������,��������ע����1�������û����DNS���񣬱Ͼ�ֻ�Ǽ��udp 53�˿��Ƿ���ǲ����ģ�Ҫ���DNS�����Ƿ�������������
if [ $port == 53 ];then
    nslookup checkdns.test.com ${rip}|grep mail.test.com
else
#��������ʹ��nc�����TCP�˿��Ƿ���,keepalived�Ѿ��Դ�TCP��⣬���Բ���
    nc -z $rip ${port}
fi
if [ $? -eq 0 ]; then
    exit 0    #����ֵ��keepalived������ֵΪ0ʱ��keepalived��֪����˼����������������Ӧ��DNS IP������RS�б���
else
    exit 1    #����ֵ��keepalived������ֵΪ1ʱ��keeplived��֪����˼��ʧ�ܣ�ֱ�ӽ���˵Ĺ���DNS��RS�б���ժ������֤ҵ������
fi