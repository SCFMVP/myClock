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
        r=sprintf('ʣ��ʱ��:%dʱ%d��%d��',LeftHours,LeftMinutes,LeftSeconds);
        disp(r)        
    else
%         disp('.')
    end
    %�ж����״̬    
    p=get(0,'PointerLocation');
    %��⵽���λ��δ�ƶ�
    if x==p(1) && y==p(2)  
        timeMouse=timeMouse+1
        x=p(1);
        y=p(2);
        if timeMouse>=5
            startFlag=false
            disp('�û����뿪');     
            timeMouse=0;
        end
    else
        disp('�û��ѻع�');     
        x=p(1);
        y=p(2);
        startFlag=true;
    end
	pause(1);
end
show(mytime)