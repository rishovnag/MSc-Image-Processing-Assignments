clear
clc
global filename path;
[filename,path] = uigetfile('D:\*.jpg,*.JPG,*.jpeg,*.JPEG,*.PNG');

tmp = strcat(path, '\', filename);
im= imread(tmp);
%%im=rgb2gray(im1);
imshow(im);title("Original Image");

prompt = 'Enter the Zooming Factor(give in integer): ';
zoom_factor=input(prompt);
[r c]=size(im);
rn=r*zoom_factor;
cn=c*zoom_factor;
s=zoom_factor;
new_im=zeros(rn,cn);
for i=1:rn
  x1=floor(i/s);
  x2=ceil(i/s);
  if(x1==0)
    x1=1;
  endif
  x=rem(i/s,1);
  for j=1:cn
    y1=floor(j/s);
    y2=ceil(j/s);
    if(y1==0)
      y1=1;
    endif
    y=rem(j/s,1);
    ptl=im(x1,y1);
    ptr=im(x2,y1);
    pbl=im(x1,y2);
    pbr=im(x2,y2);
    termleft=(y*ptr)+((1-y)*ptl);
    termright=(y*pbr)+((1-y)*pbl);
    new_im(i,j)=(1-x)*termleft+x*termright;
    endfor
  
endfor
figure,imshow(im);title("After Bi-Linear Interpolation");
imwrite(new_im,gray(256),'output_bilinear.jpg');