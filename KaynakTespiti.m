function varargout = KaynakTespiti(varargin)
% KAYNAKTESPITI MATLAB code for KaynakTespiti.fig
%      KAYNAKTESPITI, by itself, creates a new KAYNAKTESPITI or raises the existing
%      singleton*.
%
%      H = KAYNAKTESPITI returns the handle to a new KAYNAKTESPITI or the handle to
%      the existing singleton*.
%
%      KAYNAKTESPITI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in KAYNAKTESPITI.M with the given input arguments.
%
%      KAYNAKTESPITI('Property','Value',...) creates a new KAYNAKTESPITI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before KaynakTespiti_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to KaynakTespiti_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help KaynakTespiti

% Last Modified by GUIDE v2.5 10-Feb-2019 20:57:51

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @KaynakTespiti_OpeningFcn, ...
                   'gui_OutputFcn',  @KaynakTespiti_OutputFcn, ...
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


% --- Executes just before KaynakTespiti is made visible.
function KaynakTespiti_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to KaynakTespiti (see VARARGIN)
try
    img=imread('SIILAB.PNG');
    image(handles.axes7,img);
catch
    set(handles.axes7,'Visible','off');
end
set(handles.pushbutton2,'Visible','off');
axis(handles.axes1,'off');
axis(handles.axes2,'off');
axis(handles.axes3,'off');
axis(handles.axes4,'off');
axis(handles.axes7,'off');
handles.maxiter=1000;
handles.tol=1e-4;
handles.fs=25000;
handles.time=1;
handles.speed=340;
handles.xo=nan;
handles.yo=nan;
% Choose default command line output for KaynakTespiti
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes KaynakTespiti wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = KaynakTespiti_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.maxiter=str2double(get(hObject,'String'));
% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double
guidata(hObject, handles);


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



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.tol=str2double(get(hObject,'String'));
% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double
guidata(hObject, handles);

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
handles.fs=str2double(get(hObject,'String'));
% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double
guidata(hObject, handles);

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



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.time=str2double(get(hObject,'String'));
% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.speed=str2double(get(hObject,'String'));
% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
handles.cond=true;
guidata(hObject,handles);
% - Input check
if isempty(handles.xo) || isnan(handles.xo)
    set(handles.status,'String','Geçerli bir X koordinatý girin');
    return;    
elseif isempty(handles.yo) || isnan(handles.yo)
    set(handles.status,'String','Geçerli bir Y koordinatý girin');
    return;
elseif handles.speed<=0
    set(handles.status,'String','Geçerli bir ses hýzý girin');
    return;
elseif handles.time<=0
    set(handles.status,'String','Geçerli bir yenileme zamaný girin');
    return;
elseif handles.fs<=0
    set(handles.status,'String','Geçerli bir örnekleme frekansý girin');
    return;
elseif handles.tol<=0
    set(handles.status,'String','Geçerli bir yakýnsama sýnýrý girin');
    return;
elseif handles.maxiter<=0
    set(handles.status,'String','Geçerli bir iterasyon sýnýrý girin');
    return;
end

% - Init NI
set(handles.status,'String','NI cihazý hazýrlanýyor');
pause(0.05);
try
%     ai=daq.createSession('ni');
%     addAnalogInputChannel(ai,'Dev1',0:2,'Voltage');
%     ai.Rate=handles.fs;
%     ai.DurationInSeconds=handles.time;
    ai = daq.createSession('ni');
    ai.IsContinuous=true;
    ai.Rate=handles.fs;
    addAnalogInputChannel(ai,'Dev1',0:2,'Voltage');
    lh = addlistener(ai,'DataAvailable',@(src,event) maincalc(event,handles));
catch
    clear ai;
    set(handles.status,'String','NI cihaz hatasý');
    return;
end

set(handles.status,'String','Baþarýlý');
set(handles.pushbutton1,'Visible','off');
set(handles.pushbutton2,'Visible','on');
pause(0.05);
axes(handles.axes1);xlim([-50 50]);ylim([-50 50]);
startBackground(ai);
pause(5);
% databuff=zeros(handles.fs*handles.time*6,3);
% % - Calculations
% while(handles.cond)
%     tic();
%     data=startForeground(ai);
%     % - Merge data
%     databuff(1:handles.fs*handles.time*5,:)=databuff(handles.fs*handles.time+1:end,:);
%     databuff(handles.fs*handles.time*5+1:end,:)=data;
%     % - Plot data
%     plot(handles.axes2,databuff(:,1));axis(handles.axes2,'tight');
%     xticklabels(handles.axes2,{});yticklabels(handles.axes2,{});
%     plot(handles.axes3,databuff(:,2));axis(handles.axes3,'tight');
%     xticklabels(handles.axes3,{});yticklabels(handles.axes3,{});
%     plot(handles.axes4,databuff(:,3));axis(handles.axes4,'tight');
%     xticklabels(handles.axes4,{});yticklabels(handles.axes4,{});
%     drawnow;
%     % - 
%     cor12=xcorr(data(:,1),data(:,2));
%     cor13=xcorr(data(:,1),data(:,3));
%     cor23=xcorr(data(:,2),data(:,3));
% 
%     [~,zamanf12]=max(cor12);
%     [~,zamanf13]=max(cor13);
%     [~,zamanf23]=max(cor23);
% 
%     afcor12=zamanf12-handles.time*handles.fs;
%     afcor13=zamanf13-handles.time*handles.fs;
%     afcor23=zamanf23-handles.time*handles.fs;
%     afm12=afcor12*handles.speed/handles.fs;
%     afm13=afcor13*handles.speed/handles.fs;
%     afm23=afcor23*handles.speed/handles.fs;
% 
%     if ((afcor12>=0) && (afcor13>=0) && (afcor23>=0))
%         a=abs(afm13);
%         b=abs(afm23);
%         c=0;
%     elseif ((afcor12<=0) && (afcor13>=0) && (afcor23>=0))
%         a=abs(afm13);    
%         b=abs(afm23);     
%         c=0;
%     elseif ((afcor12>=0) && (afcor13>=0) && (afcor23<=0))
%         a=abs(afm12);
%         b=0;
%         c=abs(afm23); 
%     elseif ((afcor12>=0) && (afcor13<=0) && (afcor23<=0))
%         a=abs(afm12);
%         b=0;
%         c=abs(afm23);
%     elseif ((afcor12<=0) && (afcor13<=0) && (afcor23>=0))
%         a=0;
%         b=abs(afm12);
%         c=abs(afm13);
%     elseif ((afcor12<=0) && (afcor13<=0) && (afcor23<=0))
%         a=0;
%         b=abs(afm12);
%         c=abs(afm13);    
%     else
%         a=abs(afm12);
%         b=abs(afm13);
%         c=abs(afm23);     
%     end
% 
%     % - Iteration
% 
%     f = @(x) [x(1)^2 + (x(2)-handles.yo)^2 - (x(3)+a)^2;
%               x(1)^2+x(2)^2-(x(3)+b)^2
%              (x(1)-handles.xo)^2+x(2)^2-(x(3)+c)^2];
%     % The Jacobian matrix:
%     J = @(x) [2*x(1)         2*x(2)-2*handles.xo    -2*x(3)-2*a
%               2*x(1)            2*x(2)      -2*x(3)-2*b
%               2*x(1)-2*handles.yo       2*x(2)      -2*x(3)-2*c];
% 
%     % initial guess:
%     x = [a; b; c;];
%     for n=1:handles.maxiter
%        delta = -J(x) \ f(x);
%        x = x + delta;
%        if norm(delta,inf) < handles.tol
% %          fprintf('%5i    %10.5e   %10.5e     %10.5e      %8.3e\n',n,x(1),x(2),x(3),norm(delta,inf));
%          break
%        end
%     end
% 
% %     if n==handles.maxiter
% %        disp('*** Warning: may not have converged -- tolerance not satisfied')
% %        fprintf('%5i    %10.5e   %10.5e     %10.5e      %8.3e\n',n,x(1),x(2),x(3),norm(delta,inf));
% %     end
% 
%     % - Calculate radius
%     r1=sqrt((handles.xo-x(1))^2+x(2)^2);
%     r2=sqrt(x(1)^2+x(2)^2);
%     r3=sqrt(x(1)^2+(handles.yo-x(2))^2);
%     
%     % - Plot circles
%     cla;grid minor;hold on;
%     draw_circle(0.2,[0,0]);
%     draw_circle(0.2,[handles.xo,0]);
%     draw_circle(0.2,[0,handles.yo]);
%     draw_circle(r2,[0,0],'r');
%     draw_circle(r1,[handles.yo,0],'g');
%     draw_circle(r3,[0,handles.xo],'b');
%     %draw_circle(4,[abs(x(1)),abs(x(2))],'k');
%     draw_circle(2,[abs(x(1)),abs(x(2))],'k');
%     draw_circle(1.5,[abs(x(1)),abs(x(2))],'k');
%     draw_circle(1,[abs(x(1)),abs(x(2))],'k');
%     hold off;
%     drawnow;
%     timer=toc();
%     set(handles.status,'String',['Tur zamaný: ' num2str(timer) ' sn']);
%     handles=guidata(hObject); % - Get new handles from other functions
% end

set(handles.pushbutton1,'Visible','on');
set(handles.pushbutton2,'Visible','off');
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
guidata(hObject, handles);



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.yo=str2double(get(hObject,'String'));
% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.xo=str2double(get(hObject,'String'));
% Hints: get(hObject,'String') returns contents of edit8 as text
%        str2double(get(hObject,'String')) returns contents of edit8 as a double
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
handles.cond=false;
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
guidata(hObject, handles);