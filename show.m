function show(x)
    info=['您已工作',num2str(x(1)),'小时, ',num2str(x(2)),'分钟',num2str(x(3)),'秒. 请休息.']
    h=helpdlg(info,'提示');
    pause(1);close(h); 
    % todo: 这里不能强制休息!
    dos 'rundll32.exe user32.dll LockWorkStation' ;% 锁定屏幕
end