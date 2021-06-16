clear all;
close all;
clc;

%----------------------------------------------

%hjiof  %jgeo  %anvd
L1 = im2double(imread('hjiof.jpg'));
I1 = L1(:,:,1);
L2 = im2double(imread('jgeo.jpg'));
I2 = L2(:,:,1);
L3 = im2double(imread('anvd.jpg'));
I3 = L3(:,:,1);

%----------------------------------------------
reg_maxdist = 0.14;

figure(1)
subplot(321);
imshow(L1);
title('hjiof original image');
[x,y] = ginput(1);
x = round(x);
y = round(y);
hold on;
plot(x,y,'xg','MarkerSize',20,'LineWidth',2);
hold off;
J1 = regiongrowing(I1,y,x,reg_maxdist);
subplot(322);
imshow(I1+J1);
title('hjiof wound segmentation image');

%計算傷口占整張圖的面積比例(以pixels計算)
wound_size_1=sum(sum(J1==1));
[m1,n1] = size(J1);
wound_size_proportion_1=( wound_size_1/(m1*n1) );

%----------------------------------------------
reg_maxdist = 0.1;

subplot(323);
imshow(L2);
title('jgeo original image');
[x,y] = ginput(1);
x = round(x);
y = round(y);
hold on;
plot(x,y,'xg','MarkerSize',20,'LineWidth',2);
hold off;
J2 = regiongrowing(I2,y,x,reg_maxdist);
subplot(324);
imshow(I2+J2);
title('jgeo wound segmentation image');
num2=sum(sum(J2==1));

%計算傷口占整張圖的面積比例(以pixels計算)
wound_size_2=sum(sum(J2==1));
[m2,n2] = size(J2);
wound_size_proportion_2=( wound_size_2/(m2*n2) );

%----------------------------------------------
reg_maxdist = 0.14;

subplot(325);
imshow(L3);
title('anvd original image');
[x,y] = ginput(1);
x = round(x);
y = round(y);
hold on;
plot(x,y,'xg','MarkerSize',20,'LineWidth',2);
hold off;
J3 = regiongrowing(I3,y,x,reg_maxdist);
subplot(326);
imshow(I3+J3);
title('anvd wound segmentation image');
num3=sum(sum(J3==1));

%計算傷口占整張圖的面積比例(以pixels計算)
wound_size_3=sum(sum(J3==1));
[m3,n3] = size(J3);
wound_size_proportion_3=( wound_size_3/(m3*n3) );

%----------------------------------------------

S=load('IRtestdata.mat');

A1 = S.hjiof;
A2 = S.jgeo;
A3 = S.anvd;

%----------------------------------------------

reg_maxdist = 0.09;

figure(2)
subplot(331);
imshow(A1,[]);

title('hjiof IR original image');

A1=im2double(A1)/255;

max1=max(max(A1));
min1=min(min(A1));

G1 = imadjust(A1,[min1 max1],[1 0]);  
subplot(332);
imshow(G1,[]);
title('hjiof IR enhancement image');

[x,y] = ginput(1);
x = round(x);
y = round(y);
hold on;
plot(x,y,'xg','MarkerSize',20,'LineWidth',2);
hold off;

J4 = regiongrowing(G1,y,x,reg_maxdist);
subplot(333);
imshow(J4+G1);
title('hjiof wound segmentation image');

%計算傷口占整張圖的面積比例(以pixels計算)
wound_size_4=sum(sum(J4==1));
[m4,n4] = size(J4+G1);
wound_size_proportion_4=( wound_size_4/(m4*n4) );

%----------------------------------------------
reg_maxdist = 0.09;

subplot(334);
imshow(A2,[]);

title('jgeo IR original image');

A2=im2double(A2)/255;

max2=max(max(A2));
min2=min(min(A2));

G2 = imadjust(A2,[min2 max2],[1 0]);  
subplot(335);
imshow(G2,[]);
title('jgeo IR enhancement image');

[x,y] = ginput(1);
x = round(x);
y = round(y);
hold on;
plot(x,y,'xg','MarkerSize',20,'LineWidth',2);
hold off;

J5 = regiongrowing(G2,y,x,reg_maxdist);
subplot(336);
imshow(J5+G2);
title('jgeo wound segmentation image');

%計算傷口占整張圖的面積比例(以pixels計算)
wound_size_5=sum(sum(J5==1));
[m5,n5] = size(J5+G2);
wound_size_proportion_5=( wound_size_5/(m5*n5) );

%----------------------------------------------
reg_maxdist = 0.09;

subplot(337);
imshow(A1,[]);

title('anvd IR original image');

A3=im2double(A3)/255;

max3=max(max(A1));
min3=min(min(A1));

G3 = imadjust(A1,[min3 max3],[1 0]);  
subplot(338);
imshow(G3,[]);
title('anvd IR enhancement image');

[x,y] = ginput(1);
x = round(x);
y = round(y);
hold on;
plot(x,y,'xg','MarkerSize',20,'LineWidth',2);
hold off;

J6 = regiongrowing(G3,y,x,reg_maxdist);
subplot(339);
imshow(J6+G3);
title('anvd wound segmentation image');

%計算傷口占整張圖的面積比例(以pixels計算)
wound_size_6=sum(sum(J6==1));
[m6,n6] = size(J6+G3);
wound_size_proportion_6=( wound_size_6/(m6*n6) );
