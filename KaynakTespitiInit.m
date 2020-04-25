function varargout = KaynakTespitiInit(varargin)
% KAYNAKTESPITIINIT MATLAB code for KaynakTespitiInit.fig
%      KAYNAKTESPITIINIT, by itself, creates a new KAYNAKTESPITIINIT or raises the existing
%      singleton*.
%
%      H = KAYNAKTESPITIINIT returns the handle to a new KAYNAKTESPITIINIT or the handle to
%      the existing singleton*.
%
%      KAYNAKTESPITIINIT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in KAYNAKTESPITIINIT.M with the given input arguments.
%
%      KAYNAKTESPITIINIT('Property','Value',...) creates a new KAYNAKTESPITIINIT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before KaynakTespitiInit_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to KaynakTespitiInit_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help KaynakTespitiInit

% Last Modified by GUIDE v2.5 16-Feb-2019 22:29:33

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @KaynakTespitiInit_OpeningFcn, ...
                   'gui_OutputFcn',  @KaynakTespitiInit_OutputFcn, ...
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


% --- Executes just before KaynakTespitiInit is made visible.
function KaynakTespitiInit_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to KaynakTespitiInit (see VARARGIN)
try
    img=imread('ARISLAB.jpg');
    image(handles.axes7,img);
    axis(handles.axes7,'tight','off');
catch
    set(handles.axes7,'Visible','off');
end
set(handles.pushbutton2,'Visible','off');
handles.maxiter=1000;set(handles.edit1,'String','1000');
handles.tol=1e-4;set(handles.edit3,'String','1e-4');
handles.fs=25000;set(handles.edit4,'String','25000');
handles.time=1;set(handles.edit5,'String','1');
handles.speed=340;set(handles.edit6,'String','340');
handles.xo=nan;set(handles.edit7,'String','');
handles.yo=nan;set(handles.edit8,'String','');
handles.filestat=false;set(handles.checkbox2,'Value',0);
% Choose default command line output for KaynakTespitiInit
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes KaynakTespitiInit wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = KaynakTespitiInit_OutputFcn(hObject, eventdata, handles) 
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
clear maincalc
% - Input check
if isempty(handles.xo) || isnan(handles.xo)
    set(handles.status,'String','Enter a X coordinate');
    return;    
elseif isempty(handles.yo) || isnan(handles.yo)
    set(handles.status,'String','Enter a Y coordinate');
    return;
elseif handles.speed<=0
    set(handles.status,'String','Check propagation speed');
    return;
elseif handles.time<=0
    set(handles.status,'String','Refresh time should be greater than 0');
    return;
elseif handles.fs<=0
    set(handles.status,'String','Sampling frequency should be greater than 0');
    return;
elseif handles.tol<=0
    set(handles.status,'String','Convergence limit should be greater than 0');
    return;
elseif handles.maxiter<=0
    set(handles.status,'String','Iteration limit should be greater than 0');
    return;
end

set(handles.status,'String','Starting NI device...');
drawnow;
try
    buff=daq.getDevices();
    handles.ai = daq.createSession('ni');
    handles.ai.IsContinuous=true;
    handles.ai.Rate=handles.fs;
    handles.ai.NotifyWhenDataAvailableExceeds = handles.fs*handles.time;
    addAnalogInputChannel(handles.ai,buff.ID,0:2,'Voltage');
    handles.lh = addlistener(handles.ai,'DataAvailable',@(src,event) maincalc(event,handles));
catch
    clear ai;
    set(handles.status,'String','NI device error');
    return;
end
set(handles.status,'String','Success');
if handles.filestat
    handles.file=fopen('record.txt','w');
end
handles.ui=maincalc(0,handles);
guidata(hObject, handles);
set(handles.pushbutton1,'Visible','off');
set(handles.pushbutton2,'Visible','on');
tic();
startBackground(handles.ai);
handles.ai.wait(2592000); % 30 Gün

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
delete(handles.lh);
close(handles.ui);
stop(handles.ai);
release(handles.ai)
if handles.filestat
    fclose(handles.file);
end
set(handles.pushbutton1,'Visible','on');
set(handles.pushbutton2,'Visible','off');
set(handles.status,'String','');
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
guidata(hObject, handles);


% --- Executes on button press in checkbox2.
function checkbox2_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.filestat=get(hObject,'Value');
% Hint: get(hObject,'Value') returns toggle state of checkbox2
guidata(hObject, handles);
