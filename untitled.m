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

% Last Modified by GUIDE v2.5 19-Apr-2018 21:07:22

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


% --- Executes on button press in open_btn.
function open_btn_Callback(hObject, eventdata, handles)
% hObject    handle to open_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global data;
[name_file1,name_path1] = uigetfile( ...
{'*.bmp;*.jpg;','Files of type (*.bmp,*.jpg)';},...
'Open Image');
    if ~isequal(name_file1,0)
        data = imread(fullfile(name_path1,name_file1));
        guidata(hObject,handles);
        axes(handles.ib1);
        imshow(data);
    else
        return;
    end

% --- Executes on button press in exit_btn.
function exit_btn_Callback(hObject, eventdata, handles)
% hObject    handle to exit_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clc;
close()

% --- Executes on button press in dilasi_btn.
function dilasi_btn_Callback(hObject, eventdata, handles)
% hObject    handle to dilasi_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
tic;
global data
gray = rgb2gray(data);
level = graythresh(gray);
bw = imbinarize(gray, level);
SE = ones(3, 3);
imdilasi = imdilate(bw, SE);
axes(handles.ib2);
imshow(imdilasi);
toc;
disp(toc)

% --- Executes on button press in erosi_btn.
function erosi_btn_Callback(hObject, eventdata, handles)
% hObject    handle to erosi_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
tic;
global data
gray = rgb2gray(data);
level = graythresh(gray);
bw = imbinarize(gray, level);
SE = ones(3, 3);
imerosi = imerode(bw, SE);
axes(handles.ib3);
imshow(imerosi);
toc;
disp(toc)

% --- Executes on button press in opening_btn.
function opening_btn_Callback(hObject, eventdata, handles)
% hObject    handle to opening_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
tic;
global data
gray = rgb2gray(data);
level = graythresh(gray);
bw = imbinarize(gray, level);
SE = ones(3, 3);
opening = imopen(bw, SE);
axes(handles.ib2);
imshow(opening);
toc;
disp(toc)

% --- Executes on button press in closing_btn.
function closing_btn_Callback(hObject, eventdata, handles)
% hObject    handle to closing_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
tic;
global data
gray = rgb2gray(data);
level = graythresh(gray);
bw = imbinarize(gray, level);
SE = ones(3, 3);
closing = imclose(bw, SE);
axes(handles.ib3);
imshow(closing);
toc;
disp(toc)

% --- Executes on button press in thin_btn.
function thin_btn_Callback(hObject, eventdata, handles)
% hObject    handle to thin_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
tic;
global data
gray = rgb2gray(data);
level = graythresh(gray);
bw = imbinarize(gray, level);
imthin = bwmorph(bw, 'thin');
axes(handles.ib2);
imshow(imthin);
toc;
disp(toc)


% --- Executes on button press in prewitt_btn.
function prewitt_btn_Callback(hObject, eventdata, handles)
% hObject    handle to prewitt_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
tic;
global data
data = rgb2gray(data);
perX = [ -1 0 1 ; -1 0 1; -1 0 1 ];
perY = [ 1 1 1 ; 0 0 0 ; -1 -1 -1 ];
prewitX = conv2(data, perX);
prewitY = conv2(data, perY);
gradien = abs(prewitX) + abs(prewitY);
gradien = mat2gray(gradien);
axes(handles.ib2);
imshow(prewitX);
axes(handles.ib3);
imshow(prewitY);
axes(handles.ib4);
imshow(gradien);
toc;
disp(toc);

% --- Executes on button press in robert_btn.
function robert_btn_Callback(hObject, eventdata, handles)
% hObject    handle to robert_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
tic;
global data
data=rgb2gray(data);
robX = [ 1 0 ; 0 -1 ];
robY = [ 0 1 ; -1 0 ];
robertX = conv2(data, robX);
robertY = conv2(data, robY);
gradien = abs(robertX) + abs(robertX);
gradien = mat2gray(gradien);
axes(handles.ib2);
imshow(robertX);
axes(handles.ib3);
imshow(robertY);
axes(handles.ib4);
imshow(gradien);
toc;
disp(toc);

% --- Executes on button press in canny_btn.
function canny_btn_Callback(hObject, eventdata, handles)
% hObject    handle to canny_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global data
data = rgb2gray(data);
imcanny = edge(data,'Canny');
axes(handles.ib2);
imshow(imcanny);
toc;
disp(toc);

% --- Executes on button press in sobel_btn.
function sobel_btn_Callback(hObject, eventdata, handles)
% hObject    handle to sobel_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
tic;
global data
data = rgb2gray(data);
SxSobel = [ -1 0 1 ; -2 0 2; -1 0 1 ];
SySobel = [ 1 2 1 ; 0 0 0 ; -1 -2 -1 ];
sobelSx = conv2(data, SxSobel);
sobelSy = conv2(data, SySobel);
gradien = abs(sobelSx) + abs(sobelSy);
gradien = mat2gray(gradien);
axes(handles.ib2);
imshow(sobelSx);
axes(handles.ib3);
imshow(sobelSy);
axes(handles.ib4);
imshow(gradien);
toc;
disp(toc);

% --- Executes on button press in log_btn.
function log_btn_Callback(hObject, eventdata, handles)
% hObject    handle to log_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
tic;
global data
data = rgb2gray(data);
imlog = edge(data, 'log');
axes(handles.ib3);
imshow(imlog);
toc;
disp(toc);


% --- Executes on button press in region_btn.
function region_btn_Callback(hObject, eventdata, handles)
% hObject    handle to region_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
tic;
%tahap 1 -- read img, konversi rgb2gray
global data
if length(size(data))>2
    %tahap 1 -- konversi rgb2gray
    img = rgb2gray(data);
    
    %tahap 2 -- Lakukan proses penambahan kontras agar citra terlihat lebih jelas
    %Kemudian lakukan konversi nilai pixel menjadi desimal sebagai input yang dibutuhkan oleh algoritma region growing
    %Simpan citra ini untuk ditampilkan saat akhir program
    imgFilterContrast = adapthisteq(img);
    
    %tahap 3 -- Tentukan seed point, yaitu posisi koordinat awal dimana perhitungan akan dimulai
    %Diasumsikan dalam kasus ini, semua titik yang memiliki nilai pixel kurang dari 32 akan digunakan sebagai seed point
    [x1,y1] = find(imgFilterContrast<=32);
    
    %tahap 4 -- Lakukan perhitungan pada masing-masing seed point yang ditemukan
    %Lakukan proses perhitungan menggunakan region growing sesuai seed point yang tersedia
    %Kemudian ambil semua nilai terbaik yang ditemukan pada masing-masing hasil region growing
    %Penjelasan lebih detail tentang fungsi ini dapat dilihat pada penjelasan skrip fungsi Region Growing (poin 4a - 4c)
    imgFilterContrast = im2double(imgFilterContrast);
    output = zeros(size(img));
    for i=1:size(x1,1)
        tmp = regionGrowing(imgFilterContrast,x1(i),y1(i),0.05); 
        output = max(output,tmp);
    end
    axes(handles.ib2);
    imshow(output);
end
toc;
disp(toc);

% --- Executes on button press in watershed_btn.
function watershed_btn_Callback(hObject, eventdata, handles)
% hObject    handle to watershed_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
tic;
global data
data = rgb2gray(data);
D = -bwdist(~data);
D(~data) = -Inf;
L = watershed(D);
axes(handles.ib3);
imshow(label2rgb(L,'jet','w'))
toc;
disp(toc);