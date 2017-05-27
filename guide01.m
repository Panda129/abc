function varargout = guide01(varargin)
% GUIDE01 MATLAB code for guide01.fig
%      GUIDE01, by itself, creates a new GUIDE01 or raises the existing
%      singleton*.
%
%      H = GUIDE01 returns the handle to a new GUIDE01 or the handle to
%      the existing singleton*.
%
%      GUIDE01('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUIDE01.M with the given input arguments.
%
%      GUIDE01('Property','Value',...) creates a new GUIDE01 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before guide01_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to guide01_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help guide01

% Last Modified by GUIDE v2.5 13-Apr-2017 23:53:10

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @guide01_OpeningFcn, ...
                   'gui_OutputFcn',  @guide01_OutputFcn, ...
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


% --- Executes just before guide01 is made visible.
function guide01_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to guide01 (see VARARGIN)

% Choose default command line output for guide01
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes guide01 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = guide01_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in radiobuttonR.
function radiobuttonR_Callback(hObject, eventdata, handles)
% hObject    handle to radiobuttonR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobuttonR
global A
set(handles.radiobuttonG,'Value',0);
set(handles.radiobuttonB,'Value',0);
axes(handles.axes2)
imhist(A(:,:,1))
title('Histogram Red Channel')



% --- Executes on button press in radiobuttonG.
function radiobuttonG_Callback(hObject, eventdata, handles)
% hObject    handle to radiobuttonG (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobuttonG
global A
set(handles.radiobuttonR,'Value',0);
set(handles.radiobuttonB,'Value',0);
axes(handles.axes2)
imhist(A(:,:,2))
title('Histogram Green Channel')


% --- Executes on button press in radiobuttonB.
function radiobuttonB_Callback(hObject, eventdata, handles)
% hObject    handle to radiobuttonB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobuttonB
global A
set(handles.radiobuttonG,'Value',0);
set(handles.radiobuttonR,'Value',0);
axes(handles.axes2)
imhist(A(:,:,3))
title('Histogram Blue Channel')


% --------------------------------------------------------------------
function ss_menu_Callback(hObject, eventdata, handles)
% hObject    handle to ss_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function menu_file_Callback(hObject, eventdata, handles)
% hObject    handle to menu_file (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function menuitem_open_Callback(hObject, eventdata, handles)
% hObject    handle to menuitem_open (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global A
[filename, pathname] = uigetfile({'*.jpg';'*.png';'*.bmp';'*.tif';'*.*'},'File Selector');
if ~isequal(filename,0)
    A = imread([pathname, filename]);
    axes(handles.axes1)
    imshow(A)
else
    return
end
guidata(hObject,handles);
set(handles.radiobuttonR,'Enable','on');
set(handles.radiobuttonG,'Enable','on');
set(handles.radiobuttonB,'Enable','on');


% --------------------------------------------------------------------
function menuitem_save_Callback(hObject, eventdata, handles)
% hObject    handle to menuitem_save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function menuitem_ssh_Callback(hObject, eventdata, handles)
% hObject    handle to menuitem_ssh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close;
guideSSH


% --------------------------------------------------------------------
function menuitem_ssn_Callback(hObject, eventdata, handles)
% hObject    handle to menuitem_ssn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close;
guideDis
