function mycallback(t,events,arg_str)
%mycallback.m
global Starttime
global Endtime
global InfoStr
global PassInfoStr
global startFlag
Lefttime=etime(Endtime,clock);
Passtime=etime(clock,Starttime);
tt=sprintf('%d��%d��%d',floor(rem(Passtime/(60*60),60)),floor(rem(Passtime/60,60)),floor(rem(Passtime,60)));
PassInfoStr=tt;
if Lefttime<0
    stop(t);
    disp('ʣ��ʱ��: 0�� 0��000')  
    InfoStr='00:00:00';
%     show()
    startFlag=false;
    return
end
LeftMillionSeconds=round(rem(Lefttime,1)*1000);
LeftSeconds=floor(rem(Lefttime,60));
LeftMinutes=floor(rem(Lefttime/60,60));
LeftHours=floor(rem(Lefttime/(60*60),60));
rr=sprintf('%d:%d:%d',LeftHours,LeftMinutes,LeftSeconds);
InfoStr=rr;
r=sprintf('ʣ��ʱ��:%dʱ%d��%d��%d',LeftHours,LeftMinutes,LeftSeconds,LeftMillionSeconds);
disp(r)