function varargout = guidesigma(varargin)
% GUIDESIGMA MATLAB code for guidesigma.fig
%      GUIDESIGMA, by itself, creates a new GUIDESIGMA or raises the existing
%      singleton*.
%
%      H = GUIDESIGMA returns the handle to a new GUIDESIGMA or the handle to
%      the existing singleton*.
%
%      GUIDESIGMA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUIDESIGMA.M with the given input arguments.
%
%      GUIDESIGMA('Property','Value',...) creates a new GUIDESIGMA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before guidesigma_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to guidesigma_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help guidesigma

% Last Modified by GUIDE v2.5 17-Apr-2017 22:13:13

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @guidesigma_OpeningFcn, ...
                   'gui_OutputFcn',  @guidesigma_OutputFcn, ...
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


% --- Executes just before guidesigma is made visible.
function guidesigma_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to guidesigma (see VARARGIN)

% Choose default command line output for guidesigma
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes guidesigma wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = guidesigma_OutputFcn(hObject, eventdata, handles) 
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


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
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
            G(i,j) = 255;
             B(i,j) = 255;
        end
    end
end

a = loaidiem(R);
a = a';
pd1 = fitdist(a,'Normal');

b = loaidiem(G);
b = b';
pd2 = fitdist(b,'Normal');

c = loaidiem(B);
c = c';
pd3 = fitdist(c,'Normal');

set(handles.text1,'string',num2str(pd1.sigma));
set(handles.text2,'string',num2str(pd1.mu));
set(handles.text3,'string',num2str(pd2.sigma));
set(handles.text4,'string',num2str(pd2.mu));
set(handles.text5,'string',num2str(pd3.sigma));
set(handles.text6,'string',num2str(pd3.mu));

x = [pd1.sigma pd2.sigma pd3.sigma];
y = [pd1.mu pd2.mu pd3.mu];
%dlmwrite('test1.csv',x,'delimiter',',','-append');
%dlmwrite('test1.csv',y,'delimiter',',','-append');

axes(handles.axes2)
imshow(R)
axes(handles.axes3)
imshow(G)
axes(handles.axes4)
imshow(B)
