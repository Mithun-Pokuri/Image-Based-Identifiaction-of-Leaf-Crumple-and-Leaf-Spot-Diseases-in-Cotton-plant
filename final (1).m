clc
close all
clear all
[filename, pathname] = uigetfile({'*.jpg';'*.png'}, 'Select a Leaf Image File');
I = imread([pathname,filename]);
I = imresize(I,[256,256]);
figure,imshow(I);title('original image');
rgb = im2double(I);
r = rgb(:, :, 1);
g = rgb(:, :, 2);
b = rgb(:, :, 3);

num = 0.5*((r - g) + (r - b));
den = sqrt((r - g).^2 + (r - b).*(g - b));
theta = acos(num./(den + eps));

H = theta;
H(b > g) = 2*pi - H(b > g);
H = H/(2*pi);

num = min(min(r, g), b);
den = r + g + b;
den(den == 0) = eps;
S = 1 - 3.* num./den;

H(S == 0) = 0;

I2 = (r + g + b)/3;
hsi = cat(3, H, S, I2);
image1 = im2double(hsi);
figure;imshow(hsi);title('hsi image');
count = sum((hsi(:, :, 1) >= 0.08 & hsi(:, :, 1) <= 0.12)&(hsi(:, :, 3) >= 0.16 & hsi(:, :, 3) <= 0.33));
nump=sum(count(1,:));
if(nump>100)
   I1 = imadjust(I,stretchlim(I));
 figure;imshow(I1);title('Contrast Enhanced');

rgb = im2double(I);
r = rgb(:, :, 1);
g = rgb(:, :, 2);
b = rgb(:, :, 3);

num = 0.5*((r - g) + (r - b));
den = sqrt((r - g).^2 + (r - b).*(g - b));
theta = acos(num./(den + eps));

H = theta;
H(b > g) = 2*pi - H(b > g);
H = H/(2*pi);

num = min(min(r, g), b);
den = r + g + b;
den(den == 0) = eps;
S = 1 - 3.* num./den;

H(S == 0) = 0;

I2 = (r + g + b)/3;
hsi = cat(3, H, S, I2);
% figure;imshow(hsi);
% figure,imshow(H);
% figure,imshow(S);
% figure,imshow(I2);
I=rgb2lab(I);
figure;imshow(I);title('LAB image');

% figure;imshow(I(:,:,2),[0 100]);

imwrite(I(:,:,2),'a.jpg');
j=imread('a.jpg');
 figure;imshow(j);title('A part of LAB image');
l=im2bw(j);
figure;imshow(l);title('BW image');
k=imcomplement(l);
 figure;imshow(k);title('complement of BW image');

se = strel('disk',2);
d=imclose(k,se);
figure;imshow(d);title('close operation');

e=imcomplement(d);
 figure;imshow(e);title('complented image');

g = imclearborder(e);
figure;imshow(g);title('Clearing Border');
h=immultiply(H,g);
 figure;imshow(h);title('H image');
i=immultiply(S,g);
figure;imshow(i);title('S image');
j=immultiply(I2,g);
figure;imshow(j);title('I image');
k=h(h~=0);
l=i(i~=0);
m=j(j~=0);

CC = bwconncomp(g);
S = regionprops(CC,'Area');
S7 =struct2array(S);
S1 = (regionprops(CC,'MajorAxisLength'));
S2 =struct2array(S1);
S3 = int16(S2);

S5= (regionprops(CC,'Eccentricity'));
S6 =struct2array(S5);

S4=CC.NumObjects;
 x=1:1:S4;
 figure;subplot(3,1,1);bar(x,S3);xlabel('Number of spots');ylabel('MajorAxisLength');
 subplot(3,1,2);bar(x,S7);xlabel('Number of spots');ylabel('Area');
 subplot(3,1,3);bar(x,S6);xlabel('Number of spots');ylabel('Eccentricity');
S14 = (regionprops(CC,'MinorAxisLength'));
S15 =struct2array(S14);
Mean1 = mean2(k);
Mean2 = mean2(l);
Mean3 = mean2(m);
Minimum1 = min(k);
Minimum2 = min(l);
Minimum3 = min(m);
Maximum1 = max(k);
Maximum2 = max(l);
Maximum3 = max(m);
Standard_Deviation1 = std2(k);
Standard_Deviation2 = std2(l);
Standard_Deviation3 = std2(m);
Entropy1=entropy(k);
Entropy2=entropy(l);
Entropy3=entropy(m);
Variance1 = mean2(var(k));
Variance2 = mean2(var(l));
Variance3 = mean2(var(m));
Kurtosis1 = kurtosis(k);
Kurtosis2 = kurtosis(l);
Kurtosis3 = kurtosis(m);
Skewness1 = skewness(k);
Skewness2 = skewness(l);
Skewness3 = skewness(m);
ImgVector = [mean(S7),min(S7),max(S7),mean(S2),min(S2),max(S2),mean(S6),min(S6),max(S6),mean(S15),min(S15),max(S15),S4,Mean1,Mean2,Mean3,Minimum1,Minimum2,Minimum3,Maximum1,Maximum2,Maximum3,Standard_Deviation1,Standard_Deviation2,Standard_Deviation3,Entropy1,Entropy2,Entropy3,Variance1,Variance2,Variance3,Kurtosis1,Kurtosis2,Kurtosis3,Skewness1,Skewness2,Skewness3];
xlswrite('A:\sem8\final year project\m3.csv',ImgVector,'m3','B2');
else 
  I = rgb2gray(I);
[Gmag1, Gdir1] = imgradient(I,'prewitt');
figure
imshowpair(Gmag1, Gdir1, 'montage');
figure,histogram(Gmag1);
figure,histogram(Gdir1);
SDmag1=std2(Gmag1);
SDdir1=std2(Gdir1);
if (SDmag1 < 50) || (SDdir1 <100)
    disp('Crumple diseased leaf')
else
    disp('Normal leaf')
end
end   
    