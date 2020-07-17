function varargout = myClock(varargin)
% MYCLOCK MATLAB code for myClock.fig
%      MYCLOCK, by itself, creates a new MYCLOCK or raises the existing
%      singleton*.
%
%      H = MYCLOCK returns the handle to a new MYCLOCK or the handle to
%      the existing singleton*.
%
%      MYCLOCK('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MYCLOCK.M with the given input arguments.
%
%      MYCLOCK('Property','Value',...) creates a new MYCLOCK or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before myClock_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to myClock_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help myClock

% Last Modified by GUIDE v2.5 11-Jul-2020 20:19:53

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @myClock_OpeningFcn, ...
                   'gui_OutputFcn',  @myClock_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before myClock is made visible.
function myClock_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to myClock (see VARARGIN)
A=importdata('1.txt')
set(handles.listbox1,'string',A);
% Choose default command line output for myClock
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes myClock wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = myClock_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1


% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- 方法一的计时启动按钮.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% 获取输入值
a=str2num(get(handles.edit1,'string'));
b=str2num(get(handles.edit2,'string'));
c=str2num(get(handles.edit3,'string'));
mytime=[a;b;c]
Alltime=mytime(1)*60*60+mytime(2)*60+mytime(3);
Alltime1=Alltime;
startFlag=true;
timeMouse=0;
x=0;y=0;
while(Alltime>0) 
    set(handles.text29,'string',datestr(datetime,'yyyy-mm-dd HH:MM:SS')); % 当前时间
    if startFlag
        Alltime=Alltime-1;
        Lefttime=Alltime;
        LeftSeconds=floor(rem(Lefttime,60));
        LeftMinutes=floor(rem(Lefttime/60,60));
        LeftHours=floor(rem(Lefttime/(60*60),60));
        r=sprintf('剩余时间:%d时%d分%d秒',LeftHours,LeftMinutes,LeftSeconds);
        rr=sprintf('%d:%d:%d',LeftHours,LeftMinutes,LeftSeconds);
        disp(r)   
        %计算剩余时间        
        leaveTime=Alltime1-Alltime;
        LeftSeconds1=floor(rem(leaveTime,60));
        LeftMinutes1=floor(rem(leaveTime/60,60));
        LeftHours1=floor(rem(leaveTime/(60*60),60));
        rrr=sprintf('%d：%d：%d',LeftHours1,LeftMinutes1,LeftSeconds1);
        % GUI显示
        set(handles.text31,'string',rrr);  % 已经计时
        set(handles.text33,'string',rr); % 剩余时间
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
%文本按一列存储
fp=fopen('1.txt','a'); % 1.txt'为文件名；'w'为打开方式：会清空原本的数据，重新写入。
%按列写入
fprintf(fp,'%s：%s\n',datestr(datetime,'yyyy-mm-dd'),rrr);
fclose(fp);            % 关闭文件。
show(mytime)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear all
close


function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- deadline 模式倒计时
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Starttime
global Endtime
global InfoStr
global PassInfoStr
global startFlag
set(handles.text35,'string',get(handles.edit4,'string'));
x=datestr(get(handles.edit4,'string'),'yyyy mm dd HH MM ss ');
y=datestr(datetime,'yyyy mm dd HH MM SS');
Starttime=[str2num(y(1:4)),str2num(y(6:7)), str2num(y(9:10)), str2num(y(12:13)), str2num(y(15:16)), str2num(y(18:19))];
Endtime=[str2num(x(1:4)),str2num(x(6:7)), str2num(x(9:10)), str2num(x(12:13)), str2num(x(15:16)), str2num(x(18:19))];
t = timer('StartDelay', 0,'Period',1,'TasksToExecute', 10000,...
          'ExecutionMode','fixedRate');
t.TimerFcn = {@mycallback};
start(t)
startFlag=true;
% 也可以在这个while里通过比对时间来完成定时
while(true)  
    %disp(datetime);
    if(~startFlag)
        %文本按一列存储
        fp=fopen('1.txt','a'); % 1.txt'为文件名；'w'为打开方式：会清空原本的数据，重新写入。
        %按列写入
        fprintf(fp,'%s：%s\n',datestr(datetime,'yyyy-mm-dd'),PassInfoStr);
        fclose(fp);            % 关闭文件。
%         show(mytime)
        break;
    end
    set(handles.text31,'string',PassInfoStr);
    set(handles.text29,'string',datestr(datetime,'yyyy-mm-dd HH:MM:SS'));
    set(handles.text33,'string',InfoStr);
    pause(1);
end
% 必须要关掉句柄
stop(t);
delete(t);


% --- 方法二的暂停计,不需要!!!!!
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% global startFlag
% startFlag=false;
