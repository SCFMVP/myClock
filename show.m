function show(x)
    info=['���ѹ���',num2str(x(1)),'Сʱ, ',num2str(x(2)),'����',num2str(x(3)),'��. ����Ϣ.']
    h=helpdlg(info,'��ʾ');
    pause(1);close(h); 
    % todo: ���ﲻ��ǿ����Ϣ!
    dos 'rundll32.exe user32.dll LockWorkStation' ;% ������Ļ
end