function varargout = untitled(varargin)
% UNTITLED MATLAB code for untitled.fig
%      UNTITLED, by itself, creates a new UNTITLED or raises the existing
%      singleton*.
%
%      H = UNTITLED returns the handle to a new UNTITLED or the handle to
%      the existing singleton*.
%
%      UNTITLED('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UNTITLED.M with the given input arguments.
%
%      UNTITLED('Property','Value',...) creates a new UNTITLED or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before untitled_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to untitled_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help untitled

% Last Modified by GUIDE v2.5 28-Nov-2018 20:39:18

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @untitled_OpeningFcn, ...
                   'gui_OutputFcn',  @untitled_OutputFcn, ...
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


% --- Executes just before untitled is made visible.
function untitled_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to untitled (see VARARGIN)
global m;
m = mobiledev;

% Choose default command line output for untitled
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes untitled wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = untitled_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in startbutton.
%맨처음 나오는 파란색 스타트 버튼
function startbutton_Callback(hObject, eventdata, handles)
% hObject    handle to startbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global m;
m.AccelerationSensorEnabled = 1;
m.OrientationSensorEnabled = 1;

set(handles.startbutton,'Visible','off');
set(handles.putbutton,'Visible','on');%입력버튼
set(handles.input1,'Visible','on');%키 입력 칸
set(handles.input2,'Visible','on');%몸무게 입력 칸
set(handles.text1,'Visible','on');%키
set(handles.text2,'Visible','on');%몸무게
set(handles.text3,'Visible','on');%cm
set(handles.text4,'Visible','on');%kg
set(handles.resetbutton,'Visible','on');%다시 입력하기 버튼
set(handles.resetbutton,'enable','off');
set(handles.togglebutton1,'Visible','on');%측정시작 버튼
set(handles.togglebutton1,'enable','off');



function input1_Callback(hObject, eventdata, handles)
%키 입력 칸
% hObject    handle to input1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of input1 as text
%        str2double(get(hObject,'String')) returns contents of input1 as a double


% --- Executes during object creation, after setting all properties.
function input1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to input1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
    height
end

function input2_Callback(hObject, eventdata, handles)
%몸무게 입력 칸
% hObject    handle to input2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of input2 as text
%        str2double(get(hObject,'String')) returns contents of input2 as a double


% --- Executes during object creation, after setting all properties.
function input2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to input2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in putbutton.
function putbutton_Callback(hObject, eventdata, handles)
%입력 버튼(초록색
% hObject    handle to putbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global height %키
global weight %몸무게

height = get(handles.input1,'String');
weight = get(handles.input2,'String');
set(handles.putbutton,'enable','off');
set(handles.togglebutton1,'enable','on');
set(handles.resetbutton,'enable','on');

set(handles.resetbutton, 'BackgroundColor',[0.471 0.671 0.188]);
set(handles.putbutton,'BackgroundColor',[0.94 0.94 0.94]);

% --- Executes on button press in togglebutton1.
function togglebutton1_Callback(hObject, eventdata, handles)
%측정시작 버튼(노란색)
% hObject    handle to togglebutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton1
global m
m.Logging = 1;
set(handles.putbutton,'Visible','off');
set(handles.input1,'Visible','off');
set(handles.input2,'Visible','off');
set(handles.text1,'Visible','off');
set(handles.text2,'Visible','off');
set(handles.text3,'Visible','off');
set(handles.text4,'Visible','off');
set(handles.togglebutton1,'Visible','off');
set(handles.stopbutton,'Visible','on'); %측정완료 버튼
set(handles.stopbutton,'enable','on');
set(handles.resetbutton,'Visible','off');

axes(handles.axes2);
imshow('zap.png');

% --- Executes on button press in resetbutton.
function resetbutton_Callback(hObject, eventdata, handles)
%다시 입력하기 버튼(입력 버튼 클릭 시 활성화->초록색
% hObject    handle to resetbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.putbutton,'enable','on');
set(handles.togglebutton1,'enable','off');

set(handles.putbutton, 'BackgroundColor',[0.471 0.671 0.188]);
set(handles.resetbutton,'BackgroundColor',[0.94 0.94 0.94]);

% --- Executes on button press in stopbutton.
function stopbutton_Callback(hObject, eventdata, handles)
%측정완료 버튼(빨간색)
global m;
m.Logging = 0;
m.AccelerationSensorEnabled = 0;
m.OrientationSensorEnabled = 0;
global height
global weight
height = str2double(height);
weight = str2double(weight);
global score;
score = scorepredict1(m, height, weight);

% hObject    handle to stopbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of stopbutton

set(handles.stopbutton,'enable','off');
set(handles.stopbutton,'Visible','off');

m.discardlogs;

axes(handles.axes2);
imshow('blank.png');%배경색으로 덮기

set(handles.text5,'Visible','on'); %<결과>

set(handles.text8,'Visible','on');%1
set(handles.text9,'Visible','on');%2
set(handles.text10,'Visible','on');%3
set(handles.text11,'Visible','on');%4
set(handles.text12,'Visible','on');%5
set(handles.text13,'Visible','on');%점수:

curscore = zeros(1,5);
temp = zeros(1,5);
load('ScoreData.mat', 'curscore');

for i=1:5
    temp(i) = curscore(i);
end

for i=1:5
    if(score>=curscore(i))
        curscore(i) = score;
        for j=i+1:5
            curscore(j) = temp(j-1);
        end
        break;
    end 
end

save('ScoreData', 'curscore');

set(handles.text14,'String', curscore(1));%1등점수
set(handles.text14,'Visible','on');
set(handles.text15,'String', curscore(2));%2등점수
set(handles.text15,'Visible','on');
set(handles.text16,'String', curscore(3));%3등점수
set(handles.text16,'Visible','on');
set(handles.text17,'String', curscore(4));%4등점수
set(handles.text17,'Visible','on');
set(handles.text18,'String', curscore(5));%5등점수
set(handles.text18,'Visible','on');

set(handles.text19,'Visible','on');%사용자 점수
set(handles.text19,'String',score);
