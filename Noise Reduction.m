clear
clc
global filename path;
[filename,path] = uigetfile('C:\Users\Partha Pratim Sarkar\bs mam\Noise Reduction\*.jpg,*.JPG,*.jpeg,*.JPEG');

tmp = strcat(path, '\', filename);
im= imread(tmp);
imshow(im);title("Before Filtering");
prompt = 'Enter the Size of the mask?';
rowmask = input(prompt);
colmask=input(prompt);
[row col]=size(im);
a=zeros(rowmask*colmask,1);
for i=rowmask-1:(row-rowmask-1)
  for j=colmask-1:(col-colmask-1)
    x=1;
    for k=-1:rowmask-1 
      for l=-1:colmask-1
        a(x)=im(i+k,j+l);
        x++;
      endfor
     endfor
     sort(a);
     im(i,j)=median(a);
   endfor
 endfor
 figure,imshow(im);title("After Filtering");
imwrite(im,gray(256),'Filtered_image.jpg');

