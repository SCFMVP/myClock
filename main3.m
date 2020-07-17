clc;
clear all;
%%
% global Alltime
mytime=[ 0 2 0]
Alltime=mytime(1)*60*60+mytime(2)*60+mytime(3);
startFlag=true;
timeMouse=0;
x=0;y=0;
while(Alltime>0) 
    if startFlag
        Alltime=Alltime-1;
        Lefttime=Alltime;
        LeftSeconds=floor(rem(Lefttime,60));
        LeftMinutes=floor(rem(Lefttime/60,60));
        LeftHours=floor(rem(Lefttime/(60*60),60));
        r=sprintf('剩余时间:%d时%d分%d秒',LeftHours,LeftMinutes,LeftSeconds);
        disp(r)        
    else
%         disp('.')
    end
    %判断鼠标状态    
    p=get(0,'PointerLocation');
    %检测到鼠标位置未移动
    if x==p(1) && y==p(2)  
        timeMouse=timeMouse+1
        x=p(1);
        y=p(2);
        if timeMouse>=5
            startFlag=false
            disp('用户已离开');     
            timeMouse=0;
        end
    else
        disp('用户已回归');     
        x=p(1);
        y=p(2);
        startFlag=true;
    end
	pause(1);
end
show(mytime)