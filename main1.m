clc;
clear all;
close all;
% todo: ����GUI
%% ���ϵͳʱ��
% todo: ����ʱ��
% datetime
% %% ������ʱ���ʱ���
% dnb = datevec('2014-08-13 04:25:28');   % datetime��ȡ����ʱ��
% dna = datevec('2014-08-13 04:23:28');   % ��ȡ�û�����ʱ��,��ʽ�����
% fix(etime(dna,dnb)) % ʱ���,��λ����

%% ��ʱ����
% ����ָ��ʱ��
x=input('�����붨��Ҫʱʱ��[Сʱ ����], e.g.[0 1], ��ʱΪ1����\n');
time=x(1)*60*60+x(2)*60;
% ��ʱ��,����һ���ж�,�ܺ���
t = timer('TimerFcn','stat=false; show(x)',...
    'StartDelay',time);
start(t);
stat=true;
% Ҳ���������while��ͨ���ȶ�ʱ������ɶ�ʱ
while(stat==true)  
  disp(datetime);
%   disp('.');
  pause(1);
end
% ����Ҫ�ص����
stop(t)
delete(t)

%% �ж����
% https://blog.csdn.net/qq_43157190/article/details/104633565
get(0,'PointerLocation')


