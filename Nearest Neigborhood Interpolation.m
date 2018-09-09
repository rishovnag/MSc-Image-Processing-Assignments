clear
clc
global filename path;
[filename,path] = uigetfile('D:\*.jpg,*.JPG,*.jpeg,*.JPEG');

tmp = strcat(path, '\', filename);
im1 = imread(tmp);
%%imshow(im);title("Before Image Interpolation");
x_res=640;
y_res=480;
%%im1=rgb2gray(im);
  [j k]=size(im1);
  x_new=x_res;
  y_new=y_res;
  x_scale=x_new/(j-1);
  y_scale=y_new/(k-1);
  M=zeros(x_new,y_new);
  
  for count1=0:x_new-1
    for count2=0:y_new-1
        M(count1+1,count2+1)=im1(1+round(count1/x_scale),1+round(count2/y_scale));
      end
   end
   output_image=M;
   %%disp(M);
  
   subplot(1,2,1);imagesc(im1); colormap gray;
   subplot(1,2,2);imagesc(output_image);colormap gray;
   imwrite(im1,gray(256),'input_tree.jpg');
   imwrite(output_image,gray(256),'output_tree.jpg');
   