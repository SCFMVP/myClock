%子函数

function mycallback2(t,events,arg_str)
%mycallback.m
% global Endtime
% Lefttime=etime(Endtime,clock);
global Alltime
Lefttime=Alltime;
if Lefttime<0
    stop(t);
    disp('剩余时间: 0分 0秒000')
    return
end
LeftMillionSeconds=round(rem(Lefttime,1)*1000);
LeftSeconds=floor(rem(Lefttime,60));
LeftMinutes=floor(rem(Lefttime/60,60));
r=sprintf('剩余时间:%d分%d秒%d',LeftMinutes,LeftSeconds,LeftMillionSeconds);
disp(r)