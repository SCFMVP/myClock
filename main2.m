global Endtime
Endtime=[2020 7 11 18 16 00]
t = timer('StartDelay', 0,'Period',0.05,'TasksToExecute', 10000,...
          'ExecutionMode','fixedRate');
t.TimerFcn = {@mycallback};
start(t)