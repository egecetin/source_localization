clear all;
ai = daq.createSession('ni');
ai.IsContinuous=true;
%ai.DurationInSeconds=1;

handles.maxiter=1000;
handles.tol=1e-4;
handles.fs=25000;
handles.time=1;
handles.speed=340;
handles.xo=5;
handles.yo=5;

ai.Rate=25000;
ai.NotifyWhenDataAvailableExceeds = 25000;
addAnalogInputChannel(ai,'Dev1',0:2,'Voltage');
lh = addlistener(ai,'DataAvailable',@(src,event) maincalc(event,handles));
%tic()
startBackground(ai);
%pause(2);
ai.wait();
delete(lh);
%toc()

function plotter(event)
    persistent a
    if isempty(a)
        a=1;
    end
    plot(event.TimeStamps,event.Data);
    a=a+1
    drawnow;
end