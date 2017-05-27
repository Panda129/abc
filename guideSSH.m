function varargout = guideSSH(varargin)
% GUIDESSH MATLAB code for guideSSH.fig
%      GUIDESSH, by itself, creates a new GUIDESSH or raises the existing
%      singleton*.
%
%      H = GUIDESSH returns the handle to a new GUIDESSH or the handle to
%      the existing singleton*.
%
%      GUIDESSH('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUIDESSH.M with the given input arguments.
%
%      GUIDESSH('Property','Value',...) creates a new GUIDESSH or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before guideSSH_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to guideSSH_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help guideSSH

% Last Modified by GUIDE v2.5 14-Apr-2017 15:48:23

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @guideSSH_OpeningFcn, ...
                   'gui_OutputFcn',  @guideSSH_OutputFcn, ...
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


% --- Executes just before guideSSH is made visible.
function guideSSH_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to guideSSH (see VARARGIN)

% Choose default command line output for guideSSH
handles.output = hObject;
global A
axes(handles.axes1)
imshow(A)
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes guideSSH wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = guideSSH_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in button_open2.
function button_open2_Callback(hObject, eventdata, handles)
% hObject    handle to button_open2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global B
[filename, pathname] = uigetfile({'*.jpg';'*.png';'*.bmp';'*.tif';'*.*'},'File Selector');
if ~isequal(filename,0)
    B = imread([pathname, filename]);
    axes(handles.axes2)
    imshow(B)
else
    return
end
guidata(hObject,handles);
set(handles.radiobuttonR,'Enable','on');
set(handles.radiobuttonG,'Enable','on');
set(handles.radiobuttonB,'Enable','on');


% --- Executes on button press in button_back.
function button_back_Callback(hObject, eventdata, handles)
% hObject    handle to button_back (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close
guide01


% --- Executes on button press in radiobuttonB.
function radiobuttonR_Callback(hObject, eventdata, handles)
% hObject    handle to radiobuttonB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobuttonB
set(handles.radiobuttonG,'Value',0);
set(handles.radiobuttonB,'Value',0);
image1 = getimage(handles.axes1);
image2 = getimage(handles.axes2);

M1R = image1(:, :, 1);

FAR = image2(:, :, 1);

hM1R = imhist(M1R);

hFAR = imhist(FAR);

TongR = 0;

sizeR = 0;

for i=1:256
    TongR = TongR + abs(hM1R(i)-hFAR(i));
    sizeR = hM1R(i) + sizeR;
end
saisoR = TongR/sizeR;
x = 1:256;
axes(handles.axes3)
plot(x, hFAR,'b-',x, hM1R,'r-');
ylim([0 5000])
xlim([0 256]);
set(handles.text_saisoR,'string',saisoR);

% --- Executes on button press in radiobuttonG.
function radiobuttonG_Callback(hObject, eventdata, handles)
% hObject    handle to radiobuttonG (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobuttonG
set(handles.radiobuttonR,'Value',0);
set(handles.radiobuttonB,'Value',0);
image1 = getimage(handles.axes1);
image2 = getimage(handles.axes2);

M1G = image1(:, :, 2);

FAG = image2(:, :, 2);

hM1G = imhist(M1G);

hFAG = imhist(FAG);

TongG = 0;

sizeG = 0;

for i=1:256
    TongG = TongG + abs(hM1G(i)-hFAG(i));
    sizeG = hM1G(i) + sizeG;
end
saisoG = TongG/sizeG;
x = 1:256;
axes(handles.axes3)
plot(x, hFAG,'b-',x, hM1G,'r-');
ylim([0 5000])
xlim([0 256]);
set(handles.text_saisoG,'string',saisoG);


% --- Executes on button press in radiobuttonR.
function radiobuttonB_Callback(hObject, eventdata, handles)
% hObject    handle to radiobuttonR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobuttonR
set(handles.radiobuttonR,'Value',0);
set(handles.radiobuttonG,'Value',0);
image1 = getimage(handles.axes1);
image2 = getimage(handles.axes2);

M1B = image1(:, :, 3);

FAB = image2(:, :, 3);

hM1B = imhist(M1B);

hFAB = imhist(FAB);

TongB = 0;

sizeB = 0;

for i=1:256
    TongB = TongB + abs(hM1B(i)-hFAB(i));
    sizeB = hM1B(i) + sizeB;
end
saisoB = TongB/sizeB;
x = 1:256;
axes(handles.axes3)
plot(x, hFAB,'b-',x, hM1B,'r-');
ylim([0 5000])
xlim([0 256]);
set(handles.text_saisoB,'string',saisoB);
