%�Ӻ���

function mycallback2(t,events,arg_str)
%mycallback.m
% global Endtime
% Lefttime=etime(Endtime,clock);
global Alltime
Lefttime=Alltime;
if Lefttime<0
    stop(t);
    disp('ʣ��ʱ��: 0�� 0��000')
    return
end
LeftMillionSeconds=round(rem(Lefttime,1)*1000);
LeftSeconds=floor(rem(Lefttime,60));
LeftMinutes=floor(rem(Lefttime/60,60));
r=sprintf('ʣ��ʱ��:%d��%d��%d',LeftMinutes,LeftSeconds,LeftMillionSeconds);
disp(r)