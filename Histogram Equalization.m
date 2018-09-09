clear
clc
global filename path;
[filename,path] = uigetfile('C:\');

tmp = strcat(path, '\', filename);
im2 = imread(tmp);
figure,imshow(im2);title("Original Image");
%%im2=rgb2gray(im1);
%%figure,imshow(im2);title("Gray-Level Image of the RGB Image");
numberofpixels=size(im2,1)*size(im2,2);
histogram_image=uint8(zeros(size(im2,1),size(im2,2)));
frequency=zeros(256,1);
probfrequency=zeros(256,1);
probc=zeros(256,1);
cdf=zeros(256,1);
output_frequency=zeros(256,1);
for i=1:size(im2,1)
  for j=1:size(im2,2)
    value=im2(i,j);
    frequency(value+1)=frequency(value+1)+1;
    probfrequency(value+1)=frequency(value+1)/numberofpixels;
    
  endfor
endfor
lmax=255;
sum=0;
for i=1:size(probfrequency)
  sum=sum+frequency(i);
  cdf(i)=sum;
  probc(i)=cdf(i)/numberofpixels;
  output_frequency(i)=probc(i)*lmax;
endfor

for i=1:size(im2,1)
  for j=1:size(im2,2)
      histogram_image(i,j)=output_frequency(im2(i,j)+1);
    endfor
endfor
figure,imshow(histogram_image);title("After Histogram Equalization");


