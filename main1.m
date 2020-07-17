clc;
clear all;
close all;
% todo: 做成GUI
%% 获得系统时间
% todo: 根据时间
% datetime
% %% 计算两时间的时间差
% dnb = datevec('2014-08-13 04:25:28');   % datetime获取当天时间
% dna = datevec('2014-08-13 04:23:28');   % 获取用户输入时间,格式如左边
% fix(etime(dna,dnb)) % 时间差,单位是秒

%% 定时功能
% 根据指定时长
x=input('请输入定需要时时间[小时 分钟], e.g.[0 1], 定时为1分钟\n');
time=x(1)*60*60+x(2)*60;
% 定时器,等于一个中断,很好用
t = timer('TimerFcn','stat=false; show(x)',...
    'StartDelay',time);
start(t);
stat=true;
% 也可以在这个while里通过比对时间来完成定时
while(stat==true)  
  disp(datetime);
%   disp('.');
  pause(1);
end
% 必须要关掉句柄
stop(t)
delete(t)

%% 判断鼠标
% https://blog.csdn.net/qq_43157190/article/details/104633565
get(0,'PointerLocation')


