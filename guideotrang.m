function varargout = guideotrang(varargin)
% GUIDEOTRANG MATLAB code for guideotrang.fig
%      GUIDEOTRANG, by itself, creates a new GUIDEOTRANG or raises the existing
%      singleton*.
%
%      H = GUIDEOTRANG returns the handle to a new GUIDEOTRANG or the handle to
%      the existing singleton*.
%
%      GUIDEOTRANG('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUIDEOTRANG.M with the given input arguments.
%
%      GUIDEOTRANG('Property','Value',...) creates a new GUIDEOTRANG or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before guideotrang_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to guideotrang_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help guideotrang

% Last Modified by GUIDE v2.5 17-Apr-2017 21:23:06

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @guideotrang_OpeningFcn, ...
                   'gui_OutputFcn',  @guideotrang_OutputFcn, ...
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


% --- Executes just before guideotrang is made visible.
function guideotrang_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to guideotrang (see VARARGIN)

% Choose default command line output for guideotrang
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes guideotrang wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = guideotrang_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image
[filename, pathname] = uigetfile({'*.jpg';'*.png';'*.bmp';'*.tif';'*.*'},'File Selector');
if ~isequal(filename,0)
    image = imread([pathname, filename]);
    axes(handles.axes1)
    imshow(image)
else
    return
end
guidata(hObject,handles);
set(handles.radiobutton1,'Enable','on');
set(handles.radiobutton2,'Enable','on');
set(handles.radiobutton3,'Enable','on');
set(handles.radiobutton1,'Value',0);
set(handles.radiobutton2,'Value',0);
set(handles.radiobutton3,'Value',0);



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


% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton1
set(handles.radiobutton2,'value',0);
set(handles.radiobutton3,'value',0);
global image
R = image(:, :, 1);
G = image(:, :, 2);
B = image(:, :, 3);

giatri = get(handles.edit1,'string');
giatri = str2num(giatri);

for i=1:480
    for j=1:640
        if R(i,j)>giatri
            R(i,j) = 255;
        else
            R(i,j) = 0;
        end
    end
end

for i=1:480
    for j=1:640
        if G(i,j)>giatri
            G(i,j) = 255;   
        else
            G(i,j) = 0; 
        end
    end
end

for i=1:480
    for j=1:640
        if B(i,j)>giatri
            B(i,j) = 255;
        else
            B(i,j) = 0; 
        end
    end
end

a = banhanba(R);
b = banhanba(G);
c = banhanba(B);

set(handles.text1,'string',num2str(a));
set(handles.text2,'string',num2str(b));
set(handles.text3,'string',num2str(c));

x = [a b c];
dlmwrite('test1.csv',x,'delimiter',',','-append');

axes(handles.tuan1)
imshow(R)
axes(handles.tuan2)
imshow(G)
axes(handles.tuan3)
imshow(B)

% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton2
set(handles.radiobutton1,'value',0);
set(handles.radiobutton3,'value',0);
global image
R = image(:, :, 1);
G = image(:, :, 2);
B = image(:, :, 3);

giatri = get(handles.edit1,'string');
giatri = str2num(giatri);

for i=1:480
    for j=1:640
        if R(i,j)>giatri
            R(i,j) = 255;
        else
            R(i,j) = 0;
        end
    end
end

for i=1:480
    for j=1:640
        if G(i,j)>giatri
            G(i,j) = 255;   
        else
            G(i,j) = 0; 
        end
    end
end

for i=1:480
    for j=1:640
        if B(i,j)>giatri
            B(i,j) = 255;
        else
            B(i,j) = 0; 
        end
    end
end

a = banhanbon(R);
b = banhanbon(G);
c = banhanbon(B);

x = [a b c];
dlmwrite('test2.csv',x,'delimiter',',','-append');

set(handles.text1,'string',num2str(a));
set(handles.text2,'string',num2str(b));
set(handles.text3,'string',num2str(c));

axes(handles.tuan1)
imshow(R)
axes(handles.tuan2)
imshow(G)
axes(handles.tuan3)
imshow(B)


% --- Executes on button press in radiobutton3.
function radiobutton3_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton3
set(handles.radiobutton2,'value',0);
set(handles.radiobutton1,'value',0);
global image
R = image(:, :, 1);
G = image(:, :, 2);
B = image(:, :, 3);

giatri = get(handles.edit1,'string');
giatri = str2num(giatri);

for i=1:480
    for j=1:640
        if R(i,j)>giatri
            R(i,j) = 255;
        else
            R(i,j) = 0;
        end
    end
end

for i=1:480
    for j=1:640
        if G(i,j)>giatri
            G(i,j) = 255;   
        else
            G(i,j) = 0; 
        end
    end
end

for i=1:480
    for j=1:640
        if B(i,j)>giatri
            B(i,j) = 255;
        else
            B(i,j) = 0; 
        end
    end
end

a = namnhannam(R);
b = namnhannam(G);
c = namnhannam(B);

x = [a b c];
dlmwrite('test3.csv',x,'delimiter',',','-append');

set(handles.text1,'string',num2str(a));
set(handles.text2,'string',num2str(b));
set(handles.text3,'string',num2str(c));

axes(handles.tuan1)
imshow(R)
axes(handles.tuan2)
imshow(G)
axes(handles.tuan3)
imshow(B)


% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function axes2_Callback(hObject, eventdata, handles)
% hObject    handle to tuan1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a = getimage(handles.tuan1);
figure;
imshow(a)



% --------------------------------------------------------------------
function axes3_Callback(hObject, eventdata, handles)
% hObject    handle to tuan2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a = getimage(handles.tuan2);
figure;
imshow(a)


% --------------------------------------------------------------------
function axes4_Callback(hObject, eventdata, handles)
% hObject    handle to tuan3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a = getimage(handles.tuan3);
figure;
imshow(a)
